const ListOfMovie = ({ movies }) => {
  return (
    <ul className="movies">
      {movies?.map((movie) => (
        <li className="movie" key={movie.id}>
          <h3>{movie.title}</h3>
          <p>{movie.year}</p>
          <img src={movie.img} alt={movie.title} />
        </li>
      ))}
    </ul>
  )
}

const ErrorMovies = () => {
  return <h3>No se ecnotraron peliculas</h3>
}

export function Movies({ movies }) {
  const hasMovie = movies?.length > 0
  return hasMovie ? <ListOfMovie movies={movies} /> : <ErrorMovies />
}
