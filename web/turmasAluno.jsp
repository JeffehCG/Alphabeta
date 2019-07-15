<%@page import="com.database.web.ExerCompletarFrase"%>
<%@page import="com.database.web.Turma"%>
<%@page import="com.database.web.Aluno"%>
<%@page import="com.database.web.Professor"%>
<%@page import="com.database.web.ExercicioCompletoAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% try {
        if (session.getAttribute("me.cpf") == null) {
            response.sendRedirect(request.getContextPath());
        }
        if (session.getAttribute("me.nivel").equals("professor")) {
            response.sendRedirect(request.getContextPath());
        }
    } catch (Exception e) {
    }
%>

<%
    String cpf = (String) session.getAttribute("me.cpf");

%>

<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <%@include file="/jspf/semantic.jsp"%>
        <link rel="stylesheet" type="text/css" href="src/style/perfil-professor.css">
        <link rel="stylesheet" type="text/css" href="src/Semantic-UI/dist/components/menu.css">
        <title>Turmas</title>
        <%@include file="jspf/favicon.jspf"%>
    </head>
    <body>
        <%@include file="jspf/head.jsp"%>
        <div class="ui main segment text center aligned container" style="margin-top: 90px;">
            <%try {             
            %>
            <h2>Turmas Cadastradas</h2>

            <%if (request.getParameter("exerTurma") == null) {%>
            <table class="ui celled padded table center aligned">
                <thead>
                    <tr><th class="single line">Código da Turma</th>
                        <th >Nível</th>
                        <th>Ano de inicio</th>
                        <th></th>
                    </tr></thead>
                <tbody>
                    <%
                        try {
                            for (int i = 0; i < Turma.PesquisarTurmasAluno(cpf).size(); i++) {
                                Turma lista = Turma.PesquisarTurmasAluno(cpf).get(i);%>
                    <tr>
                        <td>
                            <h2 class="ui center aligned header">
                                <%=lista.getCodTurma()%>
                            </h2>
                        </td>
                        <td class="single line">
                            <%=lista.getNvTurma()%>
                        </td>
                        <td>
                            <%=lista.getAnoInicio()%>
                        </td>
                        <td class="right aligned">
                            <form>
                                <input type="hidden" name="idTurma" value="<%=lista.getCodTurma()%>"/>
                                <button type="submit" name="exerTurma" class="ui basic button">
                                    <i class="icon user"></i>
                                    Exercicios da Turma
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%}%></tbody><%
                        } catch (Exception e) {
                        }
                    } 
            if(request.getParameter("exerTurma")!=null) {
                        int cdTurm = Integer.parseInt(request.getParameter("idTurma"));
                        Turma AlunTurm = Turma.PesquisarTurmaCod(cdTurm);
                    %>
            </table>

            <table class="ui celled padded table center aligned">
                <thead>
                    <tr>
                        <th class="single line">Codigo Turma</th>
                        <th>Nivel</th>
                        <th>Ano Inicio</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <h2 class="ui center aligned header">
                                <%=AlunTurm.getCodTurma()%>
                            </h2>
                        </td>
                        <td><%=AlunTurm.getNvTurma()%></td>
                        <td><%=AlunTurm.getAnoInicio()%></td>
                        <td>
                            <form>
                                <button type="submit" name="voltarList" class="ui labeled icon button yellow">
                                    <i class="chevron left icon"></i>
                                    Voltar
                                </button>
                            </form>
                            <%if (request.getParameter("voltarList") != null) {
                                    response.sendRedirect(request.getRequestURI());
                                }%>
                        </td>
                </tbody>
            </table>

            <table class="ui celled padded table center aligned">
                <thead>
                    <tr><th class="single line">Codigo</th>
                        <th >Texto</th>
                        <th>Classificação</th>
                        <th></th>
                    </tr></thead>
                <tbody>
                    <%
                        try {
                            for (int i = 0; i < ExerCompletarFrase.PesquisarExercTurma(cdTurm).size(); i++) {
                                ExerCompletarFrase listaExer = ExerCompletarFrase.PesquisarExercTurma(cdTurm).get(i);%>
                    <tr>
                        <td  class="single line">
                            <%=listaExer.getCodigo()%>
                        </td>
                        <td class="single line">
                            <%=listaExer.getTextoArea()%>
                        </td>
                        <td>
                            <%=listaExer.getClassif()%>
                        </td>
                        <td>
                            <%ExercicioCompletoAluno exer =ExercicioCompletoAluno.PesquisarExConcluidos(listaExer.getCodigo(), cpf);
                              String conclusao = "Pendente";
                                if(exer != null){
                                  conclusao = "Concluido";  
                             }%>
                             <%=conclusao%>
                        </td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                        }%>
                </tbody>
            </table>  
            <%}%>
            <br>
            <%
                } catch (Exception e) {
                }%>
        </div>
    </body>
</html>
