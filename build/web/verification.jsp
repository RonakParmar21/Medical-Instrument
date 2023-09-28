<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Email Verification</title>
</head>
<body>
    <form action="VerificationServlet" method="post">
        Enter Verification Code: <input type="text" name="verificationCode"><br>
        <input type="submit" value="Verify">
    </form>
</body>
</html>
