<%--
  Created by IntelliJ IDEA.
  User: Zso
  Date: 2021.12.10.
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>

<sql:setDataSource var="adatbazis"
                   driver="org.apache.derby.jdbc.ClientDriver"
                   url="jdbc:derby://localhost:1527/db_bead"
                   scope="session"/>

<sql:query var="delaccount" dataSource="${adatbazis}">
    SELECT username FROM USERS WHERE username = '${param.deleteuser}'
</sql:query>

<c:choose>
    <c:when test="${empty param.deleteuser}">
        <jsp:forward page="admin.jsp" >
            <jsp:param name="errorMsg" value="Kérlek add meg a törölni kívánt user-t"/>
        </jsp:forward>
    </c:when>
    <c:when test="${delaccount.rowCount eq 0}">
        <jsp:forward page="admin.jsp" >
            <jsp:param name="errorMsg" value="Ez a felhasználónév nem létezik"/>
        </jsp:forward>
    </c:when>
    <c:otherwise>
        <sql:update var="delaccount" dataSource="${adatbazis}">
            DELETE FROM USERS WHERE username = '${param.deleteuser}'
        </sql:update>
        <jsp:forward page="admin.jsp" >
            <jsp:param name="errorMsg" value="Sikeres törlés"/>
        </jsp:forward>
    </c:otherwise>
</c:choose>




<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
