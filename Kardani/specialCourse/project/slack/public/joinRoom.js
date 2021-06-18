function joinRoom(roomName){
    // This line will send to server:
    // Update number of users
    nsSocket.emit('joinRoom', roomName, (newNumberOfMember)=>{
        document.querySelector('.curr-room-num-users').innerHTML = `${newNumberOfMember}<span class="glyphicon glyphicon-user"></span>`
    });
    nsSocket.on('historyCatchUp', (history)=>{
        // console.log(history)
        const messagesUI = document.querySelector('#messages');
        messagesUI.innerHTML = "";
        history.forEach(msg => {
            const newMsg = HTMLTemp(msg);
            messagesUI.innerHTML += newMsg;
        });
        messagesUI.scrollTo(0, messagesUI.scrollHeight); //usersNumber
    })
            
    nsSocket.on('updateUsersNumber', (userCount)=>{
        document.querySelector('.curr-room-num-users').innerHTML = `${userCount}<span class="glyphicon glyphicon-user"></span>`
        document.querySelector('.curr-room-text').innerText = `${roomName}`
    })
}