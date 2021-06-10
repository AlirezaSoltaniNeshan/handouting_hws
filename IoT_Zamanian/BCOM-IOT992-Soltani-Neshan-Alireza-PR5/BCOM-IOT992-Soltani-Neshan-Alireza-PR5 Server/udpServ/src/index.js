const path = require("path")
const express = require("express")
const dgram = require("dgram")
const app = express()
app.set("view engine", "ejs")
app.set('views', path.join(__dirname, './views'))


const client = dgram.createSocket('udp4')


app.get('/', (req, res)=>{
    res.render("index")
});

app.get('/turnOn', (req, res)=>{
    // res.render("resultBackward")
    client.send("turnOn", 4210, "192.168.1.5", (err, bytes) =>{
        if (err) return err
        else 
        console.log("Success !")
    })
});

app.get('/turnOff', (req, res)=>{
    // res.render("resultBackward")
    client.send("turnOff", 4210, "192.168.1.5", (err, bytes) =>{
        if (err) return err
        else 
        console.log("Success !")
    })
});

app.listen(9000, ()=> {
    console.log("Your port is 9000")
})