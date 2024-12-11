import { useState, useEffect } from 'react'
import { fetchFilmAll } from '../services/movies' // Asegúrate de importar correctamente la función

const useFilms = () => {
  const [films, setFilms] = useState([]) // Para almacenar las películas
  const [loading, setLoading] = useState(true) // Para manejar el estado de carga
  const [error, setError] = useState(null) // Para manejar los posibles errores

  useEffect(() => {
    const getFilms = async () => {
      try {
        setLoading(true) // Inicia el estado de carga
        const filmsData = await fetchFilmAll()
        console.log(filmsData)
        setFilms(filmsData) // Guarda las películas en el estado
      } catch (err) {
        setError(err.message) // Si ocurre un error, guarda el mensaje
      } finally {
        setLoading(false) // Termina el estado de carga
      }
    }

    getFilms() // Llama a la función cuando el componente se monte
  }, []) // El array vacío hace que se ejecute solo una vez al montar el componente

  return { films, loading, error } // Devuelve los valores que se usarán en el componente
}

export default useFilms
