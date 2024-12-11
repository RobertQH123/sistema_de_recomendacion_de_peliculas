import React from 'react'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom'
import Film from './Film.jsx'
import Home from './Home.jsx'

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        {/* <Route path="/film" element={<Film />} /> */}
        <Route path="/film/:id" element={<Film />} />
      </Routes>
    </Router>
  )
}

export default App
