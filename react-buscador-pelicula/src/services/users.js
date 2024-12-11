export const fetchUser = async () => {
  try {
    const res = await fetch(`http://127.0.0.1:5000/usuarios`)
    const data = await res.json()
    const mapperUser = data?.map((user) => ({
      id: user.id,
      name: user.name,
    }))

    return mapperUser
  } catch (error) {
    throw new Error('Error user')
  }
}
