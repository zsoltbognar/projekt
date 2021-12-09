<%--
  Created by IntelliJ IDEA.
  User: borda
  Date: 2021. 12. 09.
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*"%>

<html>
<%
    Calendar c = Calendar.getInstance();
    String[] napNev={"Vasárnap", "Hétfő","Kedd",
            "Szerda","Csütörtök","Péntek","Szombat"};
    int nap = c.get(Calendar.DAY_OF_WEEK)-1;
%>
<head>
    <title><%=napNev[nap]%></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js">
    </script>


</head>
<body>
    <p align="center"><img src="images/<%=(nap)%>.jpg" width="400" alt="<%=(nap)%>.jpg"></p>
    <p align="center"><iframe name="frm" src="texts/<%=(nap)%>.txt" width="400" style="background-color: white" height="250"; ></iframe></p>

    <p align="center"><a href="login.jsp"><button type="button" > Kilépés  </button></a></p>


    </div>
</body>
</html>
