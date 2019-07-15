<%@page import="com.database.web.Professor"%>
<%@page import="com.database.web.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//Session Aluno
    String erro = null;
    try {
        if (request.getParameter("entrar") != null) {
            String cpf = request.getParameter("cpf");
            String senha = request.getParameter("senha");
            Aluno a = Aluno.PesquisarAlunoCpf(cpf);
            Professor p = Professor.PesquisarProfessorCpf(cpf);
            if (a != null) {
                if (a.getSenha().equals(senha)) {
                    session.setAttribute("me.cpf", String.valueOf(a.getCpf()));
                    session.setAttribute("me.nome", a.getNome());
                    session.setAttribute("me.nivel", String.valueOf("aluno"));
                    response.sendRedirect("home.jsp");
                }
            }
            if (p != null) {
                if (p.getSenha().equals(senha)) {
                    session.setAttribute("me.cpf", String.valueOf(p.getCpf()));
                    session.setAttribute("me.nome", p.getNome());
                    session.setAttribute("me.nivel", String.valueOf("professor"));
                    response.sendRedirect("home.jsp");
                }

            }
        }
    } catch (Exception e) {
        erro = "Usuario Invalido";
    }
%>
<html>
    <head>

        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <%@include file="/jspf/semantic.jsp"%>
        <link rel="stylesheet" type="text/css" href="src/style/login.css">      
        <title>Tela de Login</title>
        <%@include file="jspf/favicon.jspf"%>
    </head>
    <body style="
          background-image:  url('src/img/beta4.png');
          background-size: cover;">
        <div class="ui middle aligned center aligned grid">
            <div class="column ui active">
                <img class="ui image" src="src/img/alphabeta.png">
                <form class="ui large form">
                    <div class="ui stacked segment">
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="user icon"></i>
                                <input type="text" name="cpf" placeholder="CPF" maxlength="11"/>
                            </div>
                        </div>
                        <div class="field">
                            <div class="ui left icon input">
                                <i class="lock icon"></i>
                                <input type="password" name="senha" placeholder="Senha"/>
                            </div>
                        </div>
                        <button class="ui right labeled icon button fluid large green" type="submit" name="entrar" value="Acessar">
                            <i class="right arrow icon"></i>
                            Entrar
                        </button>
                    </div>

                    <div class="ui error message"></div>
                </form>
                <div class="ui message">
                    É novo(a) aqui? Cadastre-se como <a href="cadastroAluno.jsp">Aluno</a> ou <a href="cadastroProfessor.jsp"> Professor</a>
                </div>
            </div>
        </div>
    </body>
</html>
