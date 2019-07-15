<%@page import="com.database.web.ExerCompletarFrase"%>
<%@page import="com.database.web.InclusaoExercTurma"%>
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

<%  String erro = null;
    String cpf = (String) session.getAttribute("me.cpf");
    try {
        int codTurma = (Integer) session.getAttribute("me.cdTurm");

        if (request.getParameter("inserir") != null) {
            int cdExer = Integer.parseInt(request.getParameter("codExer"));

            InclusaoExercTurma inclus = InclusaoExercTurma.PesquisarVincExer(codTurma, cdExer);
            if (inclus == null) {
                InclusaoExercTurma.inserirExercicio(cdExer, codTurma);
                response.sendRedirect("turmasCadastradasProfessor.jsp");
            } else {
                erro = "Exercicio já incluído!";
            }
        }
            if(request.getParameter("voltarList")!=null){
                response.sendRedirect("turmasCadastradasProfessor.jsp");
            }

    } catch (Exception e) {
        erro = e.getMessage();
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
        <title>Adicionar exercícios</title>
        <%@include file="jspf/favicon.jspf"%>
    </head>
    <body>
        <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h2 class="ui center aligned icon header">
                <i class="circular file alternate icon"></i>
                Inserir exercício
            </h2>

            <%if (erro != null) {%>
            <div class="ui error message">
                <%=erro%>
            </div>
            <%}%>

            <table  class="ui table center aligned">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Texto</th>
                        <th>Classificação</th>
                        <th>
                            <form>
                                <button type="submit" name="voltarList" class="ui labeled icon button yellow">
                                    <i class="chevron left icon"></i>
                                    Voltar
                                </button>
                            </form>
                            <!--AQUI RODRIGO-->
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            for (int i = 0; i < ExerCompletarFrase.listarExProf(cpf).size(); i++) {
                                ExerCompletarFrase lista = ExerCompletarFrase.listarExProf(cpf).get(i);%>
                    <tr>
                        <td><%=lista.getCodigo()%></td>
                        <td><%=lista.getTextoArea()%></td>
                        <td><%=lista.getClassif()%></td>
                        <td>
                            <form>
                                <input type="hidden" name="codExer" value="<%=lista.getCodigo()%>"/>
                                <button type="submit" name="inserir" class="ui labeled icon button green">
                                    <i class="plus icon"></i>
                                    Inserir
                                </button>
                            </form>
                        </td>
                        <%}
                            } catch (Exception e) {
                            }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
