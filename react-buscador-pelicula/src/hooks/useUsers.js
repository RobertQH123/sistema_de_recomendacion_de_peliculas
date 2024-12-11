import { useState, useEffect } from 'react'
import { fetchUser } from '../services/users' // Asegúrate de importar correctamente la función

export const useUsers = () => {
  const [user, setUser] = useState([]) // Para almacenar las películas
  const [loading, setLoading] = useState(true) // Para manejar el estado de carga
  const [error, setError] = useState(null) // Para manejar los posibles errores

  const getFilms = async () => {
    try {
      setLoading(true) // Inicia el estado de carga
      const filmsData = await fetchUser()
      setUser(filmsData) // Guarda las películas en el estado
    } catch (err) {
      setError(err.message) // Si ocurre un error, guarda el mensaje
    } finally {
      setLoading(false) // Termina el estado de carga
    }
  }

  return { getFilms, user, loading, error }
}

// export default useUsers
