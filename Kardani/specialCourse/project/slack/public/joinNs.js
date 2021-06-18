function joinNs(endpoint) {
    if(nsSocket != ""){
        // check to see if nsSocket actually a socket!s
        nsSocket.close();
        // prevent to listener again again...
        document.querySelector('#user-input').removeEventListener('submit', formSubmission)
    }
    // Create a namespace socket.io
    nsSocket = io(`http://localhost:9000${endpoint}`)

    // Create a listener for any ns and endpoints 
    nsSocket.on('nsRoomLoad', (nsRooms) => {
        const roomList = document.querySelector('.room-list')
        roomList.innerHTML = "";
        nsRooms.forEach((rooms) => {
            var glyph;
            if (rooms.privateRoom) {
                glyph = 'lock'
            } else {
                glyph = 'globe'
            }
            roomList.innerHTML += `<li class="room"><span class="glyphicon glyphicon-${glyph}"></span>${rooms.roomTitle}</li>`;
        });
        Array.from(document.getElementsByClassName('room')).forEach((roomEl) => {
            roomEl.addEventListener('click', e => {
                console.log(e.target.innerText)
                joinRoom(e.target.innerText);
            });
        });
        const topRoom = document.querySelector('.room');
        const topRoomName = topRoom.innerText;
        console.log(topRoomName);
        joinRoom(topRoomName);
    });


    nsSocket.on('serverMessage', (serverMessage) => {
        document.querySelector('#messages').innerHTML += HTMLTemp(serverMessage);
    })
    document.querySelector('.message-form').addEventListener('submit', formSubmission)
}


function formSubmission(event) {
    event.preventDefault()
    const userMessage = document.querySelector('#user-message').value;
    if (userMessage != "")
        nsSocket.emit("userMessage", { text: userMessage, username: username })
} 

function HTMLTemp(msg) {
    // msg.time has a lot a data about time like date year day of week and clock 00:00:00
    const realClockAnd = new Date(msg.time).toLocaleTimeString();
    const realDate = new Date(msg.time).toLocaleDateString();
    const newTemp = `
    <li>
        <div class="user-image">
            <img src="${msg.avatar}" />
        </div>
        <div class="user-message">
            <div class="user-name-time">${msg.username}  <span>${realClockAnd}-${realDate}</span></div>
            <div class="message-text">${msg.text}</div>
        </div>
    </li>
    `
    return newTemp;
}