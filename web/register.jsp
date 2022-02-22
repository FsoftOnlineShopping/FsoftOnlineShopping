<%-- 
    Document   : registerForm
    Created on : Feb 8, 2022, 3:12:41 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>COZA STORE REGISTER</title>
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
            .sign-in-google, .sign-in-facebook {
                display: flex;
                justify-content: flex-start;
                align-items: center;
                border-radius: 25rem;
                border: 1px solid rgba(0, 0, 0, 0.2);
                padding: 0.875rem 5rem;
                cursor: pointer;
            }

            .sign-in-google a, .sign-in-facebook a {
                background-color: #fff;
                font-weight: bold;
                border: none;
                font-size: 1.4rem;
            }

            .google-logo, .facebook-logo {
                width: 2rem;
                height: 2rem;
                margin-right: 2.5rem;
            }

            .google-logo img, .facebook-logo img {
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

            .spacer-line {
                width: 100%;
                height: 50px;
                text-align: center;
                font-size: 1.2rem;
                position: relative;
                margin-top: 20px;
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 20;
                background-color: #fff
            }

            .spacer-line:before {
                content: "";
                width: 100%;
                height: 1px;
                border-bottom: solid 1px rgba(0, 0, 0, 0.2);
                position: absolute;
                left: 0;
                top: 50%;
                /* transform: translateY(50%, 0%); */
                z-index: -1;
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
            a{
                text-decoration: none;
            }
        </style>
    </head>

    <body>
        <div class="main">

            <form action="" method="POST" class="form" id="form-1">
                <h3 class="heading">Register to COZA STORE</h3>
                <p class="desc">A better apperance with Coza Store!</p>

                <div class="spacer"></div>
                <div class="">
                    <div class="sign-in-google">
                        <div class="google-logo"><img src="images/google-logo.png" alt=""></div>
                        <a  href="https://accounts.google.com/o/oauth2/auth?scope=openid%20profile%20email&redirect_uri=http://localhost:8080/FsoftOnlineShopping/login-google&response_type=code
                            &client_id=699455472549-dhljh9s6ik6rrk5n75cpqf26p7qs1v79.apps.googleusercontent.com&approval_prompt=force">Continue with Google</a>
                    </div>
                </div>
                <div class="" style="margin-top: 1rem">
                    <div class="sign-in-facebook">
                        <div class="facebook-logo"><img src="images/facebook-logo.png" alt=""></div>
                        <a  href="https://www.facebook.com/v13.0/dialog/oauth?client_id=1345343302557931&redirect_uri=https://localhost:8443/FsoftOnlineShopping/login-facebook&scope=email,user_link">Continue with Facebook</a>
                    </div>
                </div>
                <div class="spacer-line"><span>or Register in with Username</span></div>
                <div class="form-group">
                    <label for="userName" class="form-label">Username* </label>
                    <input id="userName" name="userName" type="text" placeholder="VD: cozastore" class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <label for="userEmail" class="form-label">Email*</label>
                    <input id="userEmail" name="userEmail" type="text" placeholder="EX: cozaonlinestore@gmail.com"
                           class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <label for="userPassword" class="form-label">Password* </label>
                    <input id="userPassword" name="userPassword" type="password" placeholder="Enter your password"
                           class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <label for="password_confirmation" class="form-label">Confirm Password*</label>
                    <input id="password_confirmation" name="password_confirmation" placeholder="Confirm your password"
                           type="password" class="form-control">
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <div style="display: flex; align-items: center;">
                        <input style="margin-right: 1rem;" id="privacy_confirmation" name="privacy_confirmation"
                               placeholder="Nhập lại mật khẩu" type="checkbox" class="form-control">
                        <label for="privacy_confirmation" class="form-label" style="font-weight: normal; padding: 0;">I
                            accept the
                            <b>Terms of Use</b> & <b>Privacy Policy</b>
                        </label>
                    </div>
                    <span class="form-message"></span>
                </div>
                <button class="form-submit">Create Account</button>
                <p class="desc-footer">Already have an account? <a href="login.jsp">Login</a></p>
                <div class="back-home"><a href="">Go back Home</a></div>
            </form>

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
                    Validator.isRequired('#userPassword', 'Please fill in required field'),
                    Validator.minLength('#userPassword', 6, 'Please enter password at least 6 characters'),
                    // Validator.isRequired('#avatar'),
                    Validator.isRequired('#userEmail', 'Please fill in required field'),
                    Validator.isEmail('#userEmail', 'Please enter valid email address'),
                    Validator.isRequired('#password_confirmation', 'Please fill in required field'),
                    Validator.isConfirmed('#password_confirmation', function () {
                        return document.querySelector('#form-1 #userPassword').value;
                    }, 'Re-entered password is incorrect'),
                    // Validator.isRequired('input[name="gender"]'),
                    Validator.isRequired('input[name="privacy_confirmation"]', 'Please accept Terms of Use & Privacy Policy'),
                ],
                onSubmit: function (userInputData) {
                    console.log(userInputData);
                    var {password_confirmation, privacy_confirmation, ...creatAccountData} = userInputData;
                    console.log(creatAccountData);
                    register(creatAccountData);
                }
            })
        </script>
        <script src="js/handle-register.js"></script>

    </body>

</html>
