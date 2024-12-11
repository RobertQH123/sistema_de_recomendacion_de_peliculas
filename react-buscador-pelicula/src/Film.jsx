import { useEffect, useState } from 'react'
import './App.css'
import { Movies } from './components/Movies'
import useFilms from './hooks/useFilms' // Cambié useMovies por useFilms

function Film() {
  const { films: movies, loading } = useFilms()
  const [search, setSearch] = useState('')
  const [filter, setFilter] = useState('') // New state for the filter
  const [filteredMovies, setFilteredMovies] = useState(movies)

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

    if (searchTerm) {
      filtered = filtered.filter((movie) =>
        movie.title.toLowerCase().includes(searchTerm.toLowerCase())
      )
    }

    if (filterTerm) {
      filtered = filtered.filter(
        (movie) => movie.genre.toLowerCase().includes(filterTerm.toLowerCase()) // Adjust based on your movie properties
      )
    }

    setFilteredMovies(filtered)
  }

  useEffect(() => {
    if (movies) filterMovies(search, filter)
  }, [movies]) // Apply filtering when movies are fetched

  return (
    <div className="page">
      <header>
        <h1>Buscador de peliculas</h1>
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
        {/* <div>
          <label htmlFor="filter">Filtrar por género:</label>
          <select id="filter" value={filter} onChange={handleFilterChange}>
            <option value="">Todos</option>
            <option value="action">Acción</option>
            <option value="comedy">Comedia</option>
            <option value="drama">Drama</option>
        </div> */}
      </header>

      <main>
        {loading ? <p>Cargando...</p> : <Movies movies={filteredMovies} />}
      </main>
    </div>
  )
}

export default Film
