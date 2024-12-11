import { useEffect, useMemo, useRef, useState } from 'react'
import './App.css'
import { Movies } from './components/Movies'
import { useMovies } from './hooks/useMovies'
import debounce from 'just-debounce-it'

function useSearch() {
  const [search, updateSearch] = useState('')
  const [error, setError] = useState(null)
  const firstInput = useRef(true)

  const validateSearch = (search) => {
    if (search === '') {
      return 'No se puede buscar una película vacía'
    } else if (search.match(/^\d+$/)) {
      return 'No se puede buscar una película con un número'
    } else if (search.length < 3) {
      return 'No se puede buscar una película con menos de tres caracteres'
    } else {
      return null
    }
  }

  useEffect(() => {
    if (firstInput.current) {
      firstInput.current = search === ''
      if (!firstInput.current) {
        setError(validateSearch(search))
      }
    } else {
      setError(validateSearch(search))
    }
  }, [search])

  return { search, updateSearch, error }
}

function Movie() {
  const [sort, setSort] = useState(false)
  const { search, updateSearch, error } = useSearch()
  const { movies, getMovies, loading } = useMovies({ search, sort })
  // const inputRef = useRef()

  const debouncedGetMovie = useMemo(() => {
    return debounce((search) => {
      getMovies({ search })
    }, 300)
  }, [getMovies])

  const handleSubmit = (event) => {
    event.preventDefault()
    getMovies({ search })
  }
  const handleChange = (event) => {
    const newSearch = event.target.value
    updateSearch(newSearch)
    debouncedGetMovie(newSearch)
  }

  const handleSort = () => {
    setSort(!sort)
  }

  return (
    <div className="page">
      <header>
        <h1>Buscador de peliculas</h1>
        <form className="form" onSubmit={handleSubmit}>
          <input
            type="text"
            value={search}
            name="query"
            onChange={handleChange}
            placeholder="Avenger, Start Wars,The Matrix .."
          />
          <input
            type="checkbox"
            onChange={handleSort}
            checked={sort}
            name="sort"
          />
          <button type="submit">Buscar</button>
        </form>
        {error && <p style={{ color: 'red' }}>{error}</p>}
      </header>

      <main>{loading ? <p>cargando ...</p> : <Movies movies={movies} />}</main>
    </div>
  )
}

export default Movie
