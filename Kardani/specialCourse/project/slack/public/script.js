var username = prompt("Enter username", "nickname")

const socket = io('http://localhost:9000');
// Global Ns to Client.
var nsSocket = "";
// getting nsData
socket.on('nsList', (nsData) => {
    const namespacesDiv = document.querySelector('.namespaces');
    namespacesDiv.innerHTML = "";
    nsData.forEach(ns => {
        namespacesDiv.innerHTML += `<div class="namespace" ns="${ns.endpoint}"><img src="${ns.img}"/></div>`;
    })
    // Note:
    // Create listener for each namespace class to click:
    // below we have HTML Collection is not a array list!
    // So we convert to ES6 mechanism
    // console.log(document.getElementsByClassName('namespace'))
    // Add click listener to any namespaces
    Array.from(document.getElementsByClassName('namespace')).forEach((elem) => {
        elem.addEventListener('click', e => {
            nsEndpoint = elem.getAttribute('ns');
            joinNs(nsEndpoint)
        });
    });
    joinNs('/wiki')
});

