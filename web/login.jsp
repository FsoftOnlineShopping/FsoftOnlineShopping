<%-- 
    Document   : login
    Created on : Feb 8, 2022, 8:56:41 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
        .forgot-pass{
            text-decoration: none;
            color: #717fe0;
        }
        .desc-footer{
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
        .back-home{
            margin-top: 10px;
            text-decoration: none;
           

        }
        .back-home a{
            text-decoration: none;
            color: #636d77;
        }
    </style>
</head>

<body>
    <div class="main">

        <form action="" method="POST" class="form" id="form-1">
            <h3 class="heading">Login to COZA STORE</h3>
            <p class="desc">Buy everything you need!</p>

            <div class="spacer"></div>
            <div class="">
                <div class="sign-in-google">
                    <div class="google-logo"><img src="images/google-logo.png" alt=""></div>
                    <a>Sign in with Google</a>
                </div>
            </div>
            <div class="spacer-line"><span>or Sign in with Username</span></div>
            <div class="form-group">
                <label for="userName" class="form-label">Username* </label>
                <input id="userName" name="userName" type="text" placeholder="VD: cozastore" class="form-control">
                <span class="form-message"></span>
            </div>
            <div class="form-group">
                <label for="userPassword" class="form-label">Password* </label>
                <input id="userPassword" name="userPassword" type="password" placeholder="Enter your password"
                    class="form-control">
                <span class="form-message"></span>
            </div>
            <div class="form-group" >
                <div style="display: flex; flex-direction: row; justify-content: space-between">
                    <div style="display: flex; align-items: center;">
                        <input style="margin-right: 1rem;" id="rememberMe"
                            placeholder="Nhập lại mật khẩu" type="checkbox" class="form-control">
                        <label for="rememberMe" class="form-label" style="font-weight: normal; padding: 0;">
                            Remember me
                        </label>
                    </div>
                    <div style="display: flex; align-items: center;">
                        <label for="" class="form-label" style="font-weight: normal; padding: 0;">
                           <a class="forgot-pass" href="">Forgot Password?</a> 
                        </label>
                    </div>
                </div>
                <span class="form-message"></span>
            </div>
            <button class="form-submit">Login</button>
            <p class="desc-footer">Not created yet? <a href="register.jsp">Create an account</a></p>
            <div class="back-home"><a href="" >Go back Home</a></div>
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
                Validator.isRequired('#userName'),
                Validator.isRequired('#userPassword'),
                // Validator.isRequired('#avatar'),
                // Validator.isRequired('#password'),
                // Validator.minLength('#password', 6),
                // Validator.isRequired('#password_confirmation'),
                // Validator.isConfirmed('#password_confirmation', function () {
                //     return document.querySelector('#form-1 #password').value;
                // }, 'Mật khẩu nhập lại không chính xác'),
                // Validator.isRequired('input[name="gender"]'),
                // Validator.isRequired('input[name="privacy_confirmation"]', 'Please accept Terms of Use & Privacy Policy'),
            ],
            onSubmit: function (data) {
                console.log(data);
                login(data);
            }
        })
    </script>
    <script src="js/handle-sign-in.js"></script>
</body>

</html>
