<%--
  Created by IntelliJ IDEA.
  User: Zsolt
  Date: 2021. 12. 09.
  Time: 15:13
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
    <meta charset="UTF-8">
    <title>Regisztráció</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js">

    </script>
</head>




<body>
<c:if test="${! empty param.errorMsg}" >
    <font color="red"> <b> ${param.errorMsg}     </b></font>
</c:if>
<div class="container" style="display: block">
    <div class="text">
        Regisztrációs Form
    </div>
    <form action="adduser.jsp" method="post">
        <div class="data">
        <label>Felhasználónév</label> <input type="text" required name="userName"><br/>
        </div>
        <div class="data">
        <label>Jelszó</label> <input type="password" required name="password" ><br/>

        </div>

        <div class="separate">

            <button type="submit" > Regisztrálok </button>
            <a href="login.jsp">  <button type="button" > Vissza  </button></a>

        </div>

    </form>
</div>




</body>
</html>
