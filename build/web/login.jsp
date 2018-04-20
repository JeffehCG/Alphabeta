<%@page import="com.database.web.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//Session Aluno
    String erro = null ;
    try{
            if(request.getParameter("entrar")!=null){
                    int cpf = Integer.parseInt(request.getParameter("cpf"));
                    String senha = request.getParameter("senha");
                    Aluno a = Aluno.PesquisarAlunoCpf(cpf);
                    if(a.getNome()!=null){
                        if(a.getSenha().equals(senha)){
                 session.setAttribute("me.id",request.getParameter("cpf"));
                response.sendRedirect("home.jsp");}}
                }
    }catch(Exception e){
        erro= "Usuario Invalido";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <h4>Digite seu usuario e senha para entrar</h4>
        
        <form>
            <p>CPF:</p>
            <input type="text" name="cpf"/>
            <p>Senha</p>
            <input type="text" name="senha"/>
            <input type="submit" name="entrar" value="Acessar"/>
        </form>
        <br>
        <br>
        <a href="cadastroAluno.jsp">Cadastrar</a>
    </body>
</html>
