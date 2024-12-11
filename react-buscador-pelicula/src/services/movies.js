export const fetchFilm = async ({ search }) => {
  if (search === '') return null
  try {
    const res = await fetch(
      `https://www.omdbapi.com/?apikey=4287ad07&s=${search}`
    )
    const data = await res.json()
    const movies = data.Search
    const mapperMovies = movies?.map((movie) => ({
      title: movie.Title,
      year: movie.Year,
      id: movie.imdbID,
      type: movie.Type,
      img: movie.Poster,
    }))
    return mapperMovies
  } catch (error) {
    throw new Error('Error search movies')
  }
}

export const fetchFilmAll = async () => {
  try {
    const res = await fetch(`http://127.0.0.1:5000/recomendaciones/mejores/`)
    const movies = await res.json()

    const mapperMovies = movies?.map((movie) => ({
      title: movie.movie_title,
      genero: movie.genre,
      id: movie.movie_id,
      img: movie.img,
    }))
    return mapperMovies
  } catch (error) {
    throw new Error('Error search movies')
  }
}

export const fetchReco = async ({ id }) => {
  try {
    const res = await fetch(
      `http://127.0.0.1:5000/recomendaciones/usuario/${id}`
    )
    const data = await res.json()
    const mapperUser = data?.map((moive) => ({
      id: moive.movie_id,
      title: moive.movie_title,
      img: moive.img,
    }))

    return mapperUser
  } catch (error) {
    throw new Error('Error user')
  }
}
