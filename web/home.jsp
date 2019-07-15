<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("me.cpf") == null) {
        response.sendRedirect(request.getContextPath());
    }
%>

<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <%@include file="/jspf/semantic.jsp"%>
        <link rel="stylesheet" type="text/css" href="src/style/perfil-professor.css">
        <link rel="stylesheet" type="text/css" href="src/Semantic-UI/dist/components/menu.css">
        <title>Início</title>
        <%@include file="jspf/favicon.jspf"%>
        
    </head>

    <body>
        <%@include file="jspf/head.jsp"%>
        <div class="ui main segment text center aligned container" style="margin-top: 90px;">
            <!--<form><input type="submit" name="logoff" value="Encerrar Sessão"/></form>-->

            <h1>Bem vindo <%=session.getAttribute("me.nome")%></h1>



            <div/>
    </body>

</html>

<%/*if (request.getParameter("logoff") != null) {
        session.setAttribute("me.cpf", null);
        session.setAttribute("me.nome", null);
        session.setAttribute("me.nivel", null);
        response.sendRedirect("login.jsp");

}*/%>