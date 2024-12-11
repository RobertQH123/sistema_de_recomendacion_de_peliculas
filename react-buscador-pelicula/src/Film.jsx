import { useEffect, useState } from 'react'
import './App.css'
import { Movies } from './components/Movies'
import { useNavigate, useParams } from 'react-router-dom'
import useFilms from './hooks/useFilms' // Cambié useMovies por useFilms

function Film() {
  const { id } = useParams()
  const { getFilmsId, userfilms, films: movies, loading } = useFilms()
  const [search, setSearch] = useState('')
  const [filter, setFilter] = useState('') // New state for the filter
  const [filteredMovies, setFilteredMovies] = useState(movies)
  const [userfilteredMovies, setUserFilteredMovies] = useState(userfilms)
  const navigate = useNavigate()

  useEffect(() => {
    if (id) {
      getFilmsId({ id }) // Pasa el `id` a la función para obtener películas personalizadas
    }
  }, [id])

  // Search handler
  const handleSubmit = (event) => {
    event.preventDefault()
    // Apply filtering logic when search is triggered
    filterMovies(search, filter)
  }

  const handleChange = (event) => {
    const newSearch = event.target.value
    setSearch(newSearch)
    filterMovies(newSearch, filter) // Apply filter when the search value changes
  }

  const handleFilterChange = (event) => {
    const newFilter = event.target.value
    setFilter(newFilter)
    filterMovies(search, newFilter) // Apply filter when filter value changes
  }

  const filterMovies = (searchTerm, filterTerm) => {
    let filtered = movies
    let filteredUserid = userfilms

    if (searchTerm) {
      filtered = filtered.filter((movie) =>
        movie.title.toLowerCase().includes(searchTerm.toLowerCase())
      )

      filteredUserid = filteredUserid.filter((movie) =>
        movie.title.toLowerCase().includes(searchTerm.toLowerCase())
      )
    }

    if (filterTerm) {
      filtered = filtered.filter(
        (movie) => movie.genre.toLowerCase().includes(filterTerm.toLowerCase()) // Adjust based on your movie properties
      )

      filteredUserid = filteredUserid.filter(
        (movie) => movie.genre.toLowerCase().includes(filterTerm.toLowerCase()) // Adjust based on your movie properties
      )
    }

    setFilteredMovies(filtered)
    setUserFilteredMovies(filteredUserid)
  }

  useEffect(() => {
    if (movies) filterMovies(search, filter)
  }, [movies, userfilms]) // Apply filtering when movies are fetched

  return (
    <div className="page">
      <header>
        <h1>Buscador de peliculas</h1>
        <button
          onClick={() => navigate('/')}
          style={{
            backgroundColor: '#e50914',
            color: '#fff',
            border: 'none',
            padding: '10px 20px',
            fontSize: '16px',
            borderRadius: '5px',
            cursor: 'pointer',
            marginBottom: '20px',
            transition: 'background-color 0.3s',
          }}
          onMouseOver={(e) => (e.target.style.backgroundColor = '#b00610')}
          onMouseOut={(e) => (e.target.style.backgroundColor = '#e50914')}
        >
          Regresar a la página principal
        </button>
        <form className="form" onSubmit={handleSubmit}>
          <input
            type="text"
            value={search}
            name="query"
            onChange={handleChange} // Updates search term
            placeholder="Avenger, Star Wars, The Matrix .."
          />
          <button type="submit">Buscar</button>
        </form>
      </header>

      <main>
        <p>recomendaciones para el usuario</p>
        {loading ? <p>Cargando...</p> : <Movies movies={userfilteredMovies} />}
        <p>mejores</p>
        {loading ? <p>Cargando...</p> : <Movies movies={filteredMovies} />}
      </main>
    </div>
  )
}

export default Film
