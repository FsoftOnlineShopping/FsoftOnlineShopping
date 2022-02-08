/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//function register(creatAccountData){
//    
//}
const registerAPI = 'http://localhost:8080/FsoftOnlineShopping/api-register';
var myStorage = window.sessionStorage;
const formMessage = document.querySelector(".form-message");
register = (creatAccountData) =>{
    fetch(registerAPI, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
                    // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: JSON.stringify(creatAccountData)
    })
            .then(function (response) {
//                console.log(response.json());
                return response ? response.json() : null;
            })
            .then(function (dataReturn) {
                console.log(dataReturn);
                if (!dataReturn.isHaveUserName && dataReturn.createState) {
                    myStorage.setItem('currentAccount', JSON.stringify(dataReturn.currentAccount));
                    console.log(dataReturn.currentAccount);
                    window.location.href = "index.jsp";
                } else {
                    if(!dataReturn.createState){
                         formMessage.innerText = 'Something wrong. Can not create your account';
                    }
                    if(dataReturn.isHaveUserName){
                         formMessage.innerText = 'The username is already existed. Please enter another one';
                    }
                    formMessage.classList.add('invalid');
                }
            })
            .catch(function (error) {                        // catch
                console.log('Request failed', error);
                formMessage.innerText = 'Something wrong. Can not create your account';
                formMessage.classList.add('invalid');
            });
}