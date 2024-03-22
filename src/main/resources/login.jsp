<form method="post" action="login.jsp">
    Email: <input type="text" name="email" /><br/>
    Password: <input type="password" name="password" /><br/>
    <input type="submit" value="Register" />
</form>
<%@ page import="javax.servlet.*,javax.servlet.http.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    Cookie[] cookies = request.getCookies();
    String emailCookie = null;
    String passwordCookie = null;

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                emailCookie = cookie.getValue();
            }
            if (cookie.getName().equals("password")) {
                passwordCookie = cookie.getValue();
            }
        }
    }

    if (email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
        if (email.equals(emailCookie) && password.equals(passwordCookie)) {
            response.sendRedirect("home.jsp");
        } else {
            out.println("Podaci nisu validni. Pokusajte ponovo.");
        }
    } else {
        out.println("Molimo vas da popunite sva polja.");
    }
%>
