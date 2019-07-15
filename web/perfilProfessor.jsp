<%@page import="com.database.web.ExerCompletarFrase"%>
<%@page import="com.database.web.Aluno"%>
<%@page import="com.database.web.Turma"%>
<%@page import="com.database.web.Professor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% try {
        if (session.getAttribute("me.cpf") == null) {
            response.sendRedirect(request.getContextPath());
        }
        if (session.getAttribute("me.nivel").equals("aluno")) {
            response.sendRedirect(request.getContextPath());
        }
    } catch (Exception e) {
    }
%>

<%
    String cpf = (String) session.getAttribute("me.cpf");
    Professor p = Professor.PesquisarProfessorCpf(cpf);
    try {
        if (request.getParameter("salvar") != null) {
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            String rua = request.getParameter("rua");
            String bairro = request.getParameter("bairro");
            int numero = Integer.parseInt(request.getParameter("numero"));;
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            int cep = Integer.parseInt(request.getParameter("cep"));;
            String telefone = request.getParameter("telefone");;
            String email = request.getParameter("email");
            Professor.AlterarProfessor(nome, sobrenome, cpf, rua, bairro, numero, cidade, estado, cep, telefone, email);
            response.sendRedirect(request.getRequestURI());
        }
    } catch (Exception e) {

    }
    try {
        if (request.getParameter("gravarTurma") != null) {
            int nvTurma = Integer.parseInt(request.getParameter("nvTurma"));
            Turma.inserirTurma(cpf, nvTurma);
        }
    } catch (Exception e) {
    }

    try {
        if (request.getParameter("adicionarAluno") != null) {
            int codigoTurma = Integer.parseInt(request.getParameter("codigoTurma"));
            session.setAttribute("me.cdTurm", Integer.valueOf(codigoTurma));
            response.sendRedirect("adAlunoTurma.jsp");
        }
        if(request.getParameter("adicionarExecicior")!=null){
            int codigoTurma = Integer.parseInt(request.getParameter("codigoTurma"));
            session.setAttribute("me.cdTurm", Integer.valueOf(codigoTurma));
            response.sendRedirect("adExercicioTurma.jsp");
            }
    } catch (Exception e) {
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
        <title>Perfil do professor</title>
        <%@include file="jspf/favicon.jspf"%>
    </head>
    <body>
        <%@include file="jspf/head.jsp"%>
        <div class="ui main segment text center aligned container" style="margin-top: 90px;">
            <%try{%>
            <h1>Perfil do(a) <%=p.getNome()%></h1>
            <%
                    if (request.getParameter("alterar") == null) {
            %>
            <div class="ui two column grid data-professor">


                <div class="sixteen wide column stackable">
                    <img class="ui small centered circular image" src="src/images/square-image.png">
                </div>
                <div class="eight wide column">
                    <p>Nome</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getNome()%></p>
                </div>

                <div class="eight wide column">
                    <p>Sobrenome</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getSobrenome()%></p>
                </div>
                <div class="eight wide column">
                    <p>Data Nascimento</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getDtNasc()%></p>
                </div>
                <div class="eight wide column">
                    <p>Rua</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getRua()%></p>
                </div>
                <div class="eight wide column">
                    <p>Bairro</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getBairro()%></p>
                </div>
                <div class="eight wide column">
                    <p>Numero</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getNumero()%></p>
                </div>
                <div class="eight wide column">
                    <p>Cidade</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getCidade()%></p>
                </div>
                <div class="eight wide column">
                    <p>Estado</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getEstado()%></p>
                </div>
                <div class="eight wide column">
                    <p>CEP</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getCep()%></p>
                </div>
                <div class="eight wide column">
                    <p>Telefone</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getTelefone()%></p>
                </div>
                <div class="eight wide column">
                    <p>E-mail</p>
                </div>
                <div class="eight wide column">
                    <p><%=p.getEmail()%></p>
                </div>
                <div class="sixteen wide column stackable">
                    <form><button class="ui fluid large blue submit basic button" type="submit" name="alterar" value="Alterar Dados">Alterar Perfil</button></form>
                </div>
            </div>


            <%}
                if (request.getParameter("alterar") != null) {
            %>
            <form class="ui equal width form form-cadastro">
                <div class="fields">
                    <div class="six wide field">
                        <label>Nome</label>
                        <input type="text" name="nome" maxlength="50" value="<%=p.getNome()%>"/>
                    </div>

                    <div class="nine wide field">
                        <label>Sobrenome</label>
                        <input type="text" name="sobrenome" maxlength="50" value="<%=p.getSobrenome()%>"/>
                    </div>
                </div>
                <div class="fields">
                    <div class="seven wide field">
                        <label>Rua</label>
                        <input type="text" name="rua" maxlength="50" value="<%=p.getRua()%>"/>
                    </div>
                    <div class="five wide field">
                        <label>Bairro</label>
                        <input type="text" name="bairro" maxlength="50" value="<%=p.getBairro()%>"/>
                    </div>
                    <div class="three wide field">
                        <label>Numero</label>
                        <input type="text" name="numero" maxlength="10"  value="<%=p.getNumero()%>"/>
                    </div>
                </div>

                <div class="fields">
                    <div class="eight wide field">
                        <label>Cidade</label>
                        <input type="text" name="cidade" maxlength="50" value="<%=p.getCidade()%>"/><br>
                    </div>
                    <div class="three wide field">
                        <label>Estado</label>
                        <input type="text" name="estado" maxlength="50" value="<%=p.getEstado()%>"/><br>
                    </div>
                    <div class="five wide field">
                        <label>CEP</label>
                        <input type="text" name="cep" maxlength="8" value="<%=p.getCep()%>"/><br>
                    </div>
                </div>

                <div class="fields">
                    <div class="six wide field">
                        <label>Telefone</label>
                        <input type="tel" name="telefone" maxlength="11" value="<%=p.getTelefone()%>"/><br>
                    </div>
                    <div class="twelve wide field">
                        <label>Email</label>
                        <input type="email" name="email" maxlength="50" value="<%=p.getEmail()%>"/><br>
                    </div>
                </div>
                <button class="ui fluid large blue submit basic button" type="submit" name="salvar">Salvar Alterações</button>
            </form>
            <%}%>
            <%
                } catch (Exception e) {
                }%>
        </div>
    </body>
</html>
