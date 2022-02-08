/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const myAccountElements = document.querySelectorAll(".my-account");
const signInOutElements = document.querySelectorAll(".sign-in-out");
var currentAccount;
var myStorage = window.sessionStorage;
if(myStorage.getItem("currentAccount")){
    currentAccount = JSON.parse(myStorage.currentAccount);
}   
if (currentAccount) {
    myAccountElements.forEach((myAccountElement, index) =>{
        myAccountElement.innerText = 'Welcome ' + currentAccount.userFullname;
        
    });
    signInOutElements.forEach((signInOutElement, index) =>{
        signInOutElement.innerText = 'Sign out';
    });
    console.log([currentAccount]);
} else {
     signInOutElements.forEach((signInOutElement, index) =>{
        signInOutElement.innerText = 'Sign in';
        signInOutElement.href = 'login.jsp';
    });
    myAccountElements.forEach((myAccountElement, index) =>{
        myAccountElement.style.display = 'none';
    });
     
}
//var data = {
//    userName: "quang5",
//    userPassword: "quang1"
//};
//fetch(authenAPI, {
//    method: 'POST',
//    headers: {
//      'Content-Type': 'application/json'
//      // 'Content-Type': 'application/x-www-form-urlencoded',
//    },
//    body: JSON.stringify(data)
//})
//        .then(function (response) {
//            return response.json();
//        })
//        .then(function (account) {
//            console.log(account);
//        });