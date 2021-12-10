<%--
  Created by IntelliJ IDEA.
  User: Zsolt
  Date: 2021. 12. 09.
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <title>Napi Hírlevél</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js">
    </script>
</head>
<body>
<c:if test="${! empty param.errorMsg}" >
    <font color="red"> <b> ${param.errorMsg}     </b></font>
</c:if>
<input type="checkbox" id="show">
<label for="show" class="show-btn">Napi Hírlevél megtekintése!</label>

<div class="container">
    <label for="show" class="close-btn fas fa-times" title="close"></label>
    <div class="text">
       Bejelentkezés</div>
    <form action="check.jsp" method="post">
        <div class="data">

            <label>Felhasználónév</label> <input type="text" required name="userName">

        </div>
        <div class="data">

            <label>Jelszó</label> <input type="password" required name="password">

        </div>
        <div class="forgot-pass">

            <a href="#">Elfelejtett jelszó?</a></div>

        <div class="btn">
            <div class="inner">
            </div>
            <button type="submit" > Belépés </button>
        </div>
        <div class="signup-link">
            Nincs fiókod?<a href="signup.jsp">Regisztráció most</a></div>
    </form>
</div>
</body>
</html>
