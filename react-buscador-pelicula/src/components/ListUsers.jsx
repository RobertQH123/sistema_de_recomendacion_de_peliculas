import { useUsers } from '../hooks/useUsers'
import { useState, useEffect } from 'react'
import { useNavigate } from 'react-router-dom'

const ListUser = () => {
  const { getFilms, user, loading, error } = useUsers()
  const navigate = useNavigate()

  useEffect(() => {
    getFilms()
  }, [])

  if (loading) return <p>Loading...</p>
  if (error) return <p>Error: {error}</p>

  return (
    <div>
      <h1 style={{ color: 'white', textAlign: 'center', marginBottom: '20px' }}>
        Users
      </h1>
      <ul className="table-user">
        {user?.map((user) => (
          <li
            onClick={() => navigate(`/film/${user.id}`)}
            key={user.id}
            style={{
              cursor: 'pointer',
              padding: '15px',
              background: '#141414',
              color: '#fff',
              borderRadius: '10px',
              marginBottom: '10px',
              textAlign: 'center',
              transition: 'background-color 0.3s',
            }}
            onMouseOver={(e) => (e.target.style.backgroundColor = '#333')}
            onMouseOut={(e) => (e.target.style.backgroundColor = '#141414')}
          >
            {user.name}
          </li>
        ))}
      </ul>
    </div>
  )
}

export default ListUser
