<%--
  Created by IntelliJ IDEA.
  User: Zso
  Date: 2021.12.10.
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Zsolt
  Date: 2021. 12. 09.
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <title>Admin</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js">
    </script>
</head>
<body>
<c:if test="${! empty param.errorMsg}" >
    <font color="red"> <b> ${param.errorMsg}     </b></font>
</c:if>

    <div class="text">
        <h1>Új fiók bevitele:</h1>
    </div>

    <br>

    <form action="adduseradmin.jsp" method="post">
        <div class="data">
            <label>Felhasználónév:</label> <input type="text" required name="userName"><br/>
        </div>

        <br>

        <div class="data">
            <label>Jelszó:</label> <input type="password" required name="password" ><br/>
        </div>

        <br>

        <div class="separate">
            <button type="submit" > Bevitel </button>
            <br>
        </div>

    </form>

<sql:setDataSource var="adatbazis"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/db_bead"
                   scope="session"/>

<sql:query var="allusers" dataSource="${adatbazis}">
    SELECT * FROM USERS WHERE username <> 'admin'
</sql:query>

<br>
<h1>Felhasználók:</h1>
<br>
<table border="1">
    <tr>
        <c:forEach var="columnName" items="${allusers.columnNames}">
            <th><c:out value="${columnName}"/></th>
        </c:forEach>
    </tr>

    <c:forEach var="row" items="${allusers.rowsByIndex}">
        <tr>
            <c:forEach var="column" items="${row}">
                <td><c:out value="${column}"/></td>
            </c:forEach>
        </tr>
    </c:forEach>
</table>

<br>

<form action="deletuser.jsp" method="post">
    Felhasználónév:<input type="text" name="deleteuser">
    <input type="submit" value="Töröl">

    <br>
    <br>
    <br>

    <a href="login.jsp">  <button type="button" > Kilépés  </button></a>
</form>

</body>
</html>
