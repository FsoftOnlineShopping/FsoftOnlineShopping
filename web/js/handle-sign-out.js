/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var myStorage = window.sessionStorage;
signInOutElements.forEach((signInOutElement, index) => {
    signInOutElement.addEventListener("click", function () {
        if (myStorage.getItem("currentAccount")) {
            myStorage.removeItem("currentAccount");
            signInOutElement.href = 'SignOut';
        }
    })
});



