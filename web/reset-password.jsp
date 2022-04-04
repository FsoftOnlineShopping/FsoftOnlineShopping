<%-- 
    Document   : reset-password
    Created on : Feb 9, 2022, 10:26:02 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>COZA STORE FORGOT PASSWORD</title>
        <style>
            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
            }

            html {
                color: #333;
                font-size: 62.5%;
                font-family: "Open Sans", sans-serif;
            }

            .main {
                background: #f1f1f1;
                min-height: 100vh;
                display: flex;
                justify-content: center;
            }

            .form {
                width: 360px;
                min-height: 100px;
                padding: 32px 24px;
                text-align: center;
                background: #fff;
                border-radius: 2px;
                margin: 24px;
                align-self: center;
                box-shadow: 0 2px 5px 0 rgba(51, 62, 73, 0.1);
            }

            .form .heading {
                font-size: 2rem;
            }

            .form .desc {
                text-align: center;
                color: #636d77;
                font-size: 1.6rem;
                font-weight: lighter;
                line-height: 2.4rem;
                margin-top: 16px;
                font-weight: 300;
            }

            .form-group {
                display: flex;
                margin-bottom: 16px;
                flex-direction: column;
            }

            .form-label,
            .form-message {
                text-align: left;
            }

            .form-label {
                font-weight: 700;
                padding-bottom: 6px;
                line-height: 1.8rem;
                font-size: 1.4rem;
            }

            .form-control {
                height: 40px;
                padding: 8px 12px;
                border: 1px solid #b3b3b3;
                border-radius: 3px;
                outline: none;
                font-size: 1.4rem;
            }

            .form-control:hover {
                border-color: #717fe0;
            }

            .form-group.invalid .form-control {
                border-color: #f33a58;
            }

            .form-group.invalid .form-message {
                color: #f33a58;
            }

            .form-message {
                font-size: 1.2rem;
                line-height: 1.6rem;
                padding: 4px 0 0;
            }
            .form-message.invalid{
                color: #f33a58;
            }
            .sign-in-google {
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 25rem;
                border: 1px solid rgba(0, 0, 0, 0.2);
                padding: 0.875rem 0px;
                cursor: pointer;
            }

            .sign-in-google a {
                background-color: #fff;
                font-weight: bold;
                border: none;
                font-size: 1.4rem;
            }

            .google-logo {
                width: 2rem;
                height: 2rem;
                margin-right: 2rem;
            }

            .google-logo img {
                width: 100%;
                height: 100%;
                object-fit: contain;
            }

            .form-submit {
                outline: none;
                background-color: #717fe0;
                margin-top: 12px;
                padding: 12px 16px;
                font-weight: 600;
                color: #fff;
                border: none;
                width: 100%;
                font-size: 14px;
                border-radius: 8px;
                cursor: pointer;
            }

            .form-submit:hover {
                background-color: #1ac7b6;
            }

            .spacer {
                margin-top: 36px;
            }

            .provide-text {
                text-align: center;
                font-size: 1.4rem;
                margin-bottom: 16px;
                font-weight: 300;
            }

            .spacer-line span {
                background-color: #fff;
                padding: 0px 1rem;
            }

            .forgot-pass {
                text-decoration: none;
                color: #717fe0;
            }

            .desc-footer {
                text-align: center;
                color: #636d77;
                font-size: 1.2rem;
                font-weight: lighter;
                line-height: 2.4rem;
                margin-top: 16px;
                font-weight: 300;
            }

            .desc-footer a {
                text-decoration: none;
                color: #717fe0;
            }

            .back-home {
                margin-top: 10px;
                text-decoration: none;


            }

            .back-home a {
                text-decoration: none;
                color: #636d77;
            }

            b {
                color: #717fe0;
            }
            #form-2,
            #form-3 {
                display: none;
            }

            .loader {
                border: 1rem solid #f3f3f3;
                border-radius: 50%;
                border-top: 1rem solid #717fe0;
                border-bottom: 1rem solid #636d77;
                width: 120px;
                height: 120px;
                -webkit-animation: spin 1.5s linear infinite;
                /* Safari */
                animation: spin 1.5s linear infinite;
                margin-bottom: 1rem;
                display:flex;
                justify-content: center;
                align-items: center;
                margin: auto;
            }
            .loader-2 {
                border: 1rem solid #f3f3f3;
                border-radius: 50%;
                border-left: 1rem solid #717fe0;
                border-right: 1rem solid #636d77;
                width: 80px;
                height: 80px;
                -webkit-animation: spin 1.5s linear infinite;
                /* Safari */
                animation: spin 1.5s linear infinite;
            }

            /* Safari */
            @-webkit-keyframes spin {
                0% {
                    -webkit-transform: rotate(0deg);
                }

                100% {
                    -webkit-transform: rotate(360deg);
                }
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }

                100% {
                    transform: rotate(360deg);
                }
            }
            .processing{
                text-align: center;
                margin: auto;
                display: none;
            }
            .processing span{
                font-weight: bold;
                font-size: 2rem;
            }
        </style>
    </head>

    <body>
        <div class="main">

            <form action="" method="POST" class="form" id="form-1">
                <h3 class="heading">Reset password from COZA STORE</h3>
                <p class="desc">Don't be panic! Reset your password within a second.</p>

                <div class="spacer"></div>

                <div class="provide-text">Provide your account's username for which you want to reset your password!</span>
                </div>
                <div class="form-group">
                    <input id="userName" name="userName" type="text" placeholder="Username: cozastore" class="form-control">
                    <span class="form-message"></span>
                </div>
                <button class="form-submit form-submit-1">Next</button>
                <p class="desc-footer">Already have an account? <a href="login.jsp">Login</a></p>
                <div class="back-home"><a href="">Go back Home</a></div>
            </form>
            <form action="" method="POST" class="form" id="form-2">
                <h3 class="heading">Reset password from COZA STORE</h3>
                <p class="desc">Don't be panic! Reset your password within a second.</p>

                <div class="spacer"></div>

                <div class="provide-text">We've sent a six ditgit code to your email address: <span
                        class="emailAddress"></span> </div>
                <div class="form-group">
                    <input id="resetCode" name="resetCode" type="text" placeholder="Code: 123456" class="form-control">
                    <span class="form-message"></span>
                </div>
                <button class="form-submit form-submit-2">Next</button>
                <p class="desc-footer">Already have an account? <a href="login.jsp">Login</a></p>
                <div class="back-home"><a href="">Go back Home</a></div>
            </form>
            <form action="" method="POST" class="form" id="form-3">
                <h3 class="heading">Reset password from COZA STORE</h3>
                <p class="desc">Welcome back, New Credentials!</p>

                <div class="spacer"></div>
                <div class="provide-text">Your identity has been verified. Set your new password!</div>
                <div class="form-group">
                    <label for="userPassword" class="form-label">Password* </label>
                    <input id="userPassword" name="userPassword" type="password" placeholder="New password"
                           class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <label for="password_confirmation" class="form-label">Confirm Password*</label>
                    <input id="password_confirmation" name="password_confirmation" placeholder="Confirm password"
                           type="password" class="form-control">
                    <span class="form-message"></span>
                </div>
                <button class="form-submit form-submit-3">Update</button>
                <p class="desc-footer">Already have an account? <a href="login.jsp">Login</a></p>
                <div class="back-home"><a href="">Go back Home</a></div>
            </form>
            <div class="processing">
                <div class="loader"><div class="loader-2"></div></div>
                <span>Hold on. We are processing...</span>
            </div>

        </div>
        <script src="js/formValidation.js"></script>
        <script>

            // Mong muon của chúng ta khi sử dụng thư viện
            Validator({
                form: '#form-1',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#userName', 'Please fill in required field'),
                ],
                onSubmit: function (data) {
                    console.log(data);
                    handleSendEmail(data);
                }
            });
            var entryLimit = 3;
            var entryCount = 1;
            Validator({
                form: '#form-2',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#resetCode', 'Please fill in required field'),
                ],
                onSubmit: function (data) {
                    console.log(data);
                    if (entryCount <= entryLimit) {
                        var entryLeft = entryLimit - entryCount;
                        var isCodeCheck = handleResetCode(data, entryLeft);
                        if (!isCodeCheck) {
                            entryCount++;
                        } else {
                            // success!
                            entryCount = 0;
                        }
                    } else {
                        document.querySelector("#form-2 .form-message").innerText = "Your trying attempts have exceeded the limit. Please try another time.";
                        removeResetCode({removeResetCode: true});
                    }

                }
            });
            Validator({
                form: '#form-3',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#userPassword', 'Please fill in required field'),
                    Validator.isRequired('#password_confirmation', 'Please fill in required field'),
                    Validator.isConfirmed('#password_confirmation', function () {
                        return document.querySelector('#form-3 #userPassword').value;
                    }, 'Re-entered password is incorrect')
                ],
                onSubmit: function (data) {
                    console.log(data);
                    var {password_confirmation, ...userPassword} = data;
                    console.log(userPassword);
                    handleResetPassword(userPassword);

                }
            });
            // document.querySelector('.form-submit-1').onclick = function () {
            //     var form2 = document.querySelector('#form-2');
            //     var form1 = document.querySelector('#form-1');
            //     form1.style.display = 'none';
            //     // form2.style.display = 'block';
            //     form2.classList.add('visible');
            //     console.log("1")
            // }
        </script>
        <script src="js/handle-reset-password.js"></script>
    </body>

</html>