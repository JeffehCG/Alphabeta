<%-- 
    Document   : home
    Created on : 19/04/2018, 19:12:03
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("me.cpf")==null){
        response.sendRedirect(request.getContextPath());
        
    }
    %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1>Bem Vindo <%=session.getAttribute("me.nome")%></h1>
    </body>
    <a href="perfilAluno.jsp">Perfil</a>
</html>
