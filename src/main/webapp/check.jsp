<%--
  Created by IntelliJ IDEA.
  User: Zsolt
  Date: 2021. 12. 09.
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"/>
    <title>Belépési adatok ellenőrzése</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js">
    </script>
</head>
<body>
<% session.removeAttribute("validUser"); %>

<sql:setDataSource var="adatbazis"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/db_bead"
                   scope="session"/>

<sql:query var="account" dataSource="${adatbazis}">
    SELECT username, password FROM USERS where username = '${param.userName}' AND password = '${param.password}'
</sql:query>

<c:choose>
    <c:when test="${(empty param.userName) || (empty param.password)}">
        <jsp:forward page="login.jsp" >
            <jsp:param name="errorMsg" value="Valós felhasznalói név és jelszó megadása kötelező."/>
        </jsp:forward>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${account.rowCount ne 0 && param.userName eq 'admin'}">
                <% session.setAttribute("validUser", request.getParameter("userName"));%>
                <jsp:forward page="admin.jsp" />
            </c:when>
            <c:when test="${account.rowCount ne 0}">
                <% session.setAttribute("validUser", request.getParameter("userName"));%>
                <jsp:forward page="mainuser.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:forward page="login.jsp" >
                    <jsp:param name="errorMsg" value="Hibás felhasználónév vagy jelszó"/>
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>

</body>
</html>
