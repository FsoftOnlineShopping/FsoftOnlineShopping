/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function signOut(){
    let myStorage = window.sessionStorage;
    let nav__items = document.querySelectorAll('.nav__item');
    nav__items[nav__items.length - 1].onclick = function(){
        if (myStorage.getItem("currentAccount")) {
            myStorage.removeItem("currentAccount");
            window.location.href = 'SignOut';
        }
    }
}
signOut();

