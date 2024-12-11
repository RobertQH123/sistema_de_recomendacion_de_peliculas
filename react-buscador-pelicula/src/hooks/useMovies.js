import { useRef, useState, useMemo } from 'react'
import { fetchFilm } from '../services/movies'

export function useMovies({ search, sort }) {
  const [loading, setLoading] = useState(false)
  const [movies, setMovies] = useState([])
  const [error, setError] = useState(null)
  const previiusSearch = useRef()
  const getMovies = useMemo(() => {
    return async ({ search }) => {
      if (search === previiusSearch.current) return
      try {
        setLoading(true)
        setError(null)
        previiusSearch.current = search
        setMovies(await fetchFilm({ search }))
      } catch (error) {
        setError(error.messagge)
      } finally {
        setLoading(false)
      }
    }
  }, [])
  const sortedMovies = useMemo(() => {
    return sort
      ? [...movies].sort((a, b) => a.title.localeCompare(b.title))
      : movies
  }, [sort, movies])

  return { movies: sortedMovies, getMovies, loading, error }
}
