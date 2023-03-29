import { useEffect, useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [input, setInput] = useState('')
  const [data, setData] = useState({})

  const fetchAPI = () =>  {
    const url = `http://localhost:3000/${input}`

    fetch(url)
      .then(response => response.json())
      .then(data => setData(data))
  }
  
  // console.log(input)
  console.log(data)
  // console.log(data.nome)

  return (
    <div className="App">
      <div>
        <a href="https://vitejs.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://reactjs.org" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <input type="text" className='inputTeste' value={input} onChange={e => setInput(e.target.value)} />
        <button onClick={fetchAPI}>
          count is
        </button>
        <p>
          Edit <code>src/App.tsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        {data.nome}
      </p>
    </div>
  )
}

export default App
