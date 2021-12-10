<%--
  Created by IntelliJ IDEA.
  User: Zso
  Date: 2021.12.10.
  Time: 12:45
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
<html>
<head>
  <title>Title</title>
</head>
<body>
<sql:query var="username" dataSource="${adatbazis}">
  SELECT username FROM USERS where username = '${param.userName}'
</sql:query>

<c:choose>
  <c:when test="${empty param.password || empty param.userName}">
    <jsp:forward page="admin.jsp" >
      <jsp:param name="errorMsg" value="Kérlek töltsd ki a mezőket"/>
    </jsp:forward>
  </c:when>
  <c:when test="${username.rowCount ne 0}">
    <jsp:forward page="admin.jsp" >
      <jsp:param name="errorMsg" value="Ez a felhasználónév már foglalt"/>
    </jsp:forward>
  </c:when>
  <c:otherwise>
    <sql:update var="regisztracio" dataSource="${adatbazis}">
      INSERT INTO App."USERS" (username, password) VALUES ('${param.userName}', '${param.password}')
    </sql:update>
    <jsp:forward page="admin.jsp" >
      <jsp:param name="errorMsg" value="Sikeres regisztráció"/>
    </jsp:forward>
  </c:otherwise>
</c:choose>



</body>
</html>
