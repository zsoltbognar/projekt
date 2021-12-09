<%--
  Created by IntelliJ IDEA.
  User: Zsolt
  Date: 2021. 12. 09.
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Regisztráció</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js">
        document.getElementById("text").style.display = "block";
    </script>

</head>
<body>




<div class="container">

    <div class="text">
        Regisztrációs Form
    </div>
    <form action="signup.jsp" method="post">
        Felhasználónév: <input type="text" name="userName"><br/>
        Jelszó: <input type="password" name="psw" ><br/>


    </form>
</div>




</body>
</html>
