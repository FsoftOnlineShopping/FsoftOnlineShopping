/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const resetPasswordAPI = 'http://localhost:8080/FsoftOnlineShopping/api-resetPassword';

// username, mat khau moi, bien checkReset = true;
// Khi ma

const resetPasswordEmailAPI = 'http://localhost:8080/FsoftOnlineShopping/api-resetPasswordEmail';
var form1 = document.querySelector('#form-1');
const formMessage1 = document.querySelector("#form-1 .form-message");
var form2 = document.querySelector('#form-2');
const formMessage2 = document.querySelector("#form-2 .form-message");
var form3 = document.querySelector('#form-3');
const formMessage3 = document.querySelector("#form-3 .form-message");
const processing = document.querySelector(".processing");
const emailAddress = document.querySelector(".emailAddress");
function handleSendEmail(data) {
    form1.style.display = 'none';
    processing.style.display = 'block';
    fetch(resetPasswordEmailAPI, {
        method: 'POST',
        headers: {'Content-Type': 'application'},
        body: JSON.stringify(data)
    })
            .then(function (response) {
                return response ? response.json() : null;
            })
            .then(function (response) {
                console.log(response);
                if (response.isHaveUserName) {
                    emailAddress.innerText = hideEmail(response.userEmail);
                    processing.style.display = 'none';
                    form2.style.display = 'block';
                } else {
                    processing.style.display = 'none';
                    form1.style.display = 'block';
                    formMessage1.innerText = `${data.userName} doesn't match with any Coza Store's accounts.`;
                    formMessage1.classList.add('invalid');
                }
            })
            .catch(function (error) {
                console.log(error);
                processing.style.display = 'none';
                form1.style.display = 'block';
                formMessage1.innerText = `Something wrong. Can not find your account.`;
                formMessage1.classList.add('invalid');
            })
}

function hideEmail(email) {
        let hide = email.split("@")[0].length - 2;//<-- number of characters to hide
        var r = new RegExp(".{" + hide + "}@", "g");
        email = email.replace(r, "***@");
    return email;
}

