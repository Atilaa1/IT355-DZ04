
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form method="post" action="index.jsp">
    Email: <input type="text" name="email" /><br/>
    Password: <input type="password" name="password" /><br/>
    Confirm Password: <input type="password" name="confirmPassword" /><br/>
    <input type="submit" value="Register" />
</form>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");

    if (email != null && !email.isEmpty() && password != null && !password.isEmpty() && confirmPassword != null && !confirmPassword.isEmpty()) {
        if (password.equals(confirmPassword)) {
            Cookie emailCookie = new Cookie("email", email);
            Cookie passwordCookie = new Cookie("password", password);
            response.addCookie(emailCookie);
            response.addCookie(passwordCookie);
            response.sendRedirect("login.jsp");
        } else {
            out.println("Podaci nisu validni. Pokusajte ponovo.");
        }
    } else {
        out.println("Molimo vas da popunite sva polja.");
    }
%>

</body>
</html>