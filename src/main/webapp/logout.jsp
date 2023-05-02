<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.net.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>

<%
    // Invalidate the session
    session.invalidate();

    // Clear the user's cookies
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }
    }
%>

<script type="text/javascript">
function preventBack() {
    window.history.pushState(null, null, window.location.href);
    window.onpopstate = function () {
        window.history.pushState(null, null, window.location.href);
    };
}
preventBack();
    
    setTimeout(function() {
        window.location.href = "index.jsp";
    }, 2000); // Redirect after 2 seconds
</script>

<p>You have successfully logged out.</p>

</body>
</html>
