/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



const userImg = document.querySelector(".user-image img");
const userName = document.querySelector(".user-content .user-name");
let currentAccount;
let myStorage = window.sessionStorage;
if (myStorage.getItem("currentAccount")) {
    currentAccount = JSON.parse(myStorage.currentAccount);
}
if (currentAccount) {
    userImg.src = currentAccount.userAvatar;
    userImg.alt = currentAccount.userAvatar;
    userName.innerText = currentAccount.userFullname;
    console.log([currentAccount]);
} else {
    window.location.href = 'login.jsp';
}