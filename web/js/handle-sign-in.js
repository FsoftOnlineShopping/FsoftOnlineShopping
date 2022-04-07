/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const authenAPI = 'http://localhost:8084/FsoftOnlineShopping/api-authen';
const formMessage = document.querySelector(".form-message");
var myStorage = window.sessionStorage;

function login(data) {
    let formSignIn = document.querySelector('#form-1');
    const processing = document.querySelector(".processing");
    formSignIn.style.display = 'none';
    processing.style.display = 'block';
    console.log("1");
    fetch(authenAPI, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
                    // 'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: JSON.stringify(data)
    })
            .then(function (response) {
//                console.log(response.json());
                return response ? response.json() : null;
            })
            .then(function (currentAccount) {
                console.log(currentAccount);
                if (currentAccount) {
                    myStorage.setItem('currentAccount', JSON.stringify(currentAccount));
                    if (currentAccount.userRole === 1) {
                        window.location.href = "admin-dashboard.jsp";
                    } else {
                        window.location.href = "index.jsp";
                    }
                } else {
                    formMessage.innerText = 'The username or password you entered is not matched to any account.';
                    formMessage.classList.add('invalid');
                }
                processing.style.display = 'none';
                formSignIn.style.display = 'block';
            })
            .catch(function (error) {                        // catch
                console.log('Request failed', error);
                processing.style.display = 'none';
                formSignIn.style.display = 'block';
                formMessage.innerText = 'The username or password you entered is not matched to any account.';
                formMessage.classList.add('invalid');
            });
}


