<%-- 
    Document   : testLogin
    Created on : Feb 18, 2022, 10:42:23 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id"
              content="----- your google client id here -----------">
    </head>
    <body>
        <h1>Hello World!</h1>
        <div class="g-signin2" data-onsuccess="onSignIn"></div>
        <a href="https://accounts.google.com/o/oauth2/auth?scope=openid%20profile%20email&redirect_uri=http://localhost:8080/FsoftOnlineShopping/login-google&response_type=code
           &client_id=699455472549-dhljh9s6ik6rrk5n75cpqf26p7qs1v79.apps.googleusercontent.com&approval_prompt=force">Login With Google</a> 
        <a href="https://www.facebook.com/v13.0/dialog/oauth?client_id=1345343302557931&redirect_uri=https://localhost:8443/FsoftOnlineShopping/login-facebook&scope=email,user_link">Login With FB</a> 

        <%
            if (request.getAttribute("id") != null) {
                String id = request.getAttribute("id").toString();
                String name = request.getAttribute("name").toString();
                String email = request.getAttribute("email").toString();
                out.print("Id: " + id);
                out.print("<br/>Name: " + name);
                out.print("<br/>Email: " + email);
            }

        %>
    </body>
</html>
