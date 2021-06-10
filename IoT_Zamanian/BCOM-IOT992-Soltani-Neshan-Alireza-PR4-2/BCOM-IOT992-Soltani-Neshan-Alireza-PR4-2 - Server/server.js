const express = require("express")
const app = express()
const PORT = 4001
const data = require("./data")

app.get("/:id", (req, res)=>{
    const reqId = req.params.id
    res.status(200).json(data[reqId])
})

app.listen(PORT, () => {
    console.log("Host is ready")
})