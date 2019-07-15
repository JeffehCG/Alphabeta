<%@page import="com.database.web.Aluno"%>
<%@page import="com.database.web.Matricula"%>
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
    try {
        int codTurma = (Integer) session.getAttribute("me.cdTurm");

        if (request.getParameter("matricular") != null) {
            String cpfAluo = request.getParameter("cpfAluno");

            Matricula matric = Matricula.PesquisarAluno(codTurma, cpfAluo);
            if (matric == null) {
                Matricula.inserirMatricula(cpfAluo, codTurma);
                response.sendRedirect("turmasCadastradasProfessor.jsp");
            } else {
                erro = "Aluno já matriculado!";
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
        <title>Adicionar alunos</title>
        <%@include file="jspf/favicon.jspf"%>
    </head>
    <body>
        <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h2 class="ui center aligned icon header">
                <i class="circular user icon"></i>
                Matricular Aluno
            </h2>

            <%if (erro != null) {%>
            <div class="ui error message">
                <%=erro%>
            </div>
            <%}%>


            <table class="ui table center aligned">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>CPF</th>
                        <th>Cidade</th>
                        <th>Nome Responsável</th>
                        <th>CPF Responsável</th>
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
                            for (int i = 0; i < Aluno.getStayList().size(); i++) {
                                Aluno lista = Aluno.getStayList().get(i);%>
                    <tr>
                        <td><%=lista.getNome()%></td>
                        <td><%=lista.getSobreNome()%></td>
                        <td><%=lista.getCpf()%></td>
                        <td><%=lista.getCidade()%></td>
                        <td><%=lista.getNomeResponsavel()%></td>
                        <td><%=lista.getCpfresponsavel()%></td>
                        <td>
                            <form>
                                <input type="hidden" name="cpfAluno" value="<%=lista.getCpf()%>"/>
                                <button type="submit" name="matricular"  class="ui labeled icon button green">
                                    <i class="plus icon"></i>
                                    Matricular
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
