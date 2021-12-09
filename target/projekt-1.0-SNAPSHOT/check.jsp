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

<c:choose>
    <c:when test="${(empty param.userName) || (empty param.password)}">
        <jsp:forward page="index.jsp" >
            <jsp:param name="errorMsg" value="Valós felhasznalói név és jelszó megadása kötelező."/>
        </jsp:forward>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${param.password eq \"jsp\"}">
                <% session.setAttribute("validUser", request.getParameter("userName"));%>
                <jsp:forward page="index.jsp" />
            </c:when>
            <c:otherwise>
                <jsp:forward page="index.jsp" >
                    <jsp:param name="errorMsg" value="A megadott jelszó helytelen. Probálja meg a 'jsp' jelszóval."/>
                </jsp:forward>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>

</body>
</html>
