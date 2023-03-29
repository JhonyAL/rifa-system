const express = require('express')
const app = express()
const cors = require('cors')
const mysql = require('mysql')

app.use(cors())
app.use(express.json())

const dataBase = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'rifa'
})

app.get('/:nome', (req, res) => {
    const sql = `SELECT * FROM usuario WHERE usuario.nome = '${req.params.nome}'`

    dataBase.query(sql, (err, rows) => {
        if (err) console.log(err)
        else res.json(rows[0])
    })
})

app.listen(3000)