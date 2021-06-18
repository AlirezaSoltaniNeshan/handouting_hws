const express = require('express')
const socketio = require('socket.io')
const app = express()
app.use(express.static('public'))

const namespaces = require('./data/namespaces');
// console.log(namespaces[1].rooms)

const expressServer = app.listen(9000) // HTTP 

const io = socketio(expressServer) // HTTP to WS

// Main namespace
io.on('connection', (socket)=>{
    // Create an [array] to storage image
    const nsData = namespaces.map((ns)=>{
        return {
            img: ns.img,
            endpoint: ns.endpoint
        }
    })
    // console.log(nsData)
    // for sending data to client, i used socket because i want to have in 
    // any client side and i pose the nsData to client with socket
    socket.emit('nsList', nsData);
})
// namespaces of /wiki, /mozilla, /linux
namespaces.forEach(namespace=>{
    // console.log(namespace.endpoint);
    // Create a individual endpoints for any namespaces
    io.of(namespace.endpoint).on('connection', (nsSocket)=>{
        // Will show to client side
        // console.log(`${nsSocket.id} has join with ${namespace.endpoint}`);

        nsSocket.emit("nsRoomLoad", namespace.rooms);
        // Grab the all message + room of chat!
        nsSocket.on('joinRoom', (roomToJoin, numberOfUsersCallback)=>{
            // Before of join to any homes, we should to leave from current room!
            // Getting current room
            const roomTitle = Object.keys(nsSocket.rooms)[1];
            nsSocket.leave(roomTitle);
            nsSocket.join(roomToJoin);
            // io.of(namespace.endpoint).in(roomToJoin).clients((err, clients)=>{
            //     // console.log(clients.length); 
            //     numberOfUsersCallback(clients.length);
            // });
            // *******NEXT OF ANY THINGS AND IMPORTANT LINE FOR LOADING ANYTHINGS ABOUT USERS HISTORY!***********
            const nsRoom = namespace.rooms.find(room=>{
                return room.roomTitle === roomToJoin;
            });
            nsSocket.emit('historyCatchUp', nsRoom.history)
            // sync server to client for getting number of users in real time...
            io.of(namespace.endpoint).in(roomToJoin).clients((err, clients)=>{
                io.of(namespace.endpoint).in(roomToJoin).emit("updateUsersNumber", clients.length)
            });
        });
        nsSocket.on('userMessage', msg =>{
            
            const fullMsg = {
                text: msg.text,
                time: Date.now(),
                username: `${msg.username}`,
                avatar: 'http://via.placeholder.com/30'
            };
            // console.log(msg);
            // console.log(nsSocket.rooms)
            // Where room you send your message? 
            const roomTitle = Object.keys(nsSocket.rooms)[1];
            // console.log(roomTitle);
            // Get instance of Room class object.
            // If room class object equal to getting join room
            const nsRoom = namespace.rooms.find((room)=>{
                return room.roomTitle === roomTitle;
            })
            // console.log(nsRoom);
            nsRoom.addMessage(fullMsg);

            io.of(namespace.endpoint).to(roomTitle).emit("serverMessage", fullMsg);
        })
    });
});
