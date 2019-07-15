<%@page import="com.sun.org.apache.xpath.internal.compiler.Keywords"%>
<%@page import="com.database.web.ParametroCompletarFrase"%>
<%@page import="com.database.web.ExerCompletarFrase"%>
<%@page import="com.database.web.Aluno"%>
<%@page import="com.database.web.Turma"%>
<%@page import="com.database.web.Professor"%>
<%@page import="com.database.web.ExercicioCompletoAluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% try {
        if (session.getAttribute("me.cpf") == null) {
            response.sendRedirect(request.getContextPath());

        }
//        if (session.getAttribute("me.nivel").equals("aluno")) {
//            response.sendRedirect(request.getContextPath());
//        }

    } catch (Exception e) {
    }
%>
<%
    try {
        if (request.getParameter("excluir") != null) {
            int cdExer = Integer.parseInt(request.getParameter("exeExerId"));
            ExerCompletarFrase.DeletarExercicio(cdExer);
            response.sendRedirect(request.getRequestURI());
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
        <title>Perfil Professor</title>
    </head>
    <body>
        <%@include file="jspf/head.jsp"%>
        <div class="ui main segment text center aligned container">
            <h1 class="header">Exercicios</h1>
            <div class="ui items">
                <%try{
                    
                    if(session.getAttribute("me.nivel").equals("professor")){
                    
                    for (int i = 0; i < ExerCompletarFrase.listarExProf(session.getAttribute("me.cpf").toString()).size(); i++) {
                    
                        ExerCompletarFrase listaExer = ExerCompletarFrase.listarExProf(session.getAttribute("me.cpf").toString()).get(i);
                %>

                <div class="ui padded left aligned clearing segment">

                    <div class="content">
                        <div class="header">
                            <h2 class="ui header"><%=listaExer.getTextoArea()%></h2>
                        </div>
                        <div class="description">

                            <p><h4>Palavras: 
                                <%for (int j = 0; j < ParametroCompletarFrase.listarParExerView(listaExer.getCodigo()).size(); j++) {
                                        ParametroCompletarFrase keyWords = ParametroCompletarFrase.listarParExerView(listaExer.getCodigo()).get(j);
                                        out.println(keyWords.getFrase() + " ");
                                    }%>
                            </h4></p>
                        </div>
                            <div class="description">

                            <p><h4>Quantidade Conclusões: 
                                <%int qtConc = 0;
                                qtConc = ExercicioCompletoAluno.PesquisarQuantExConcluidosExer(listaExer.getCodigo());
                                %>
                                <%=qtConc%>
                            </h4></p>
                        </div>
                            <div class="description">

                            <p><h4>Quantidade Erros: 
                                <%int qtErr = 0;
                                qtErr = ExercicioCompletoAluno.PesquisarQuantErrosExer(listaExer.getCodigo());
                                %>
                                <%=qtErr%>
                            </h4></p>
                        </div>
                        <div class="extra">
                            <div class="ui right floated ">
                                <form method="POST" action="completePalavraView.jsp">
                                    <input type="hidden" name="exeId" value="<%=listaExer.getCodigo()%>"/>
                                    <button class="ui fluid large blue submit button" type="submit" name="gravar" value="Cadastrar">Ver Exercicio</button>
                                </form>
                            </div>
                        </div>
                        <div class="extra">
                            <div class="ui right floated ">
                                <form>
                                    <input type="hidden" name="exeExerId" value="<%=listaExer.getCodigo()%>"/>
                                    <button class="ui fluid large red submit button" type="submit" name="excluir" value="Excluir">Excluir Exercicio</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <%}
}else{
    for (int i = 0; i < ExerCompletarFrase.PesquisarExercAlun(session.getAttribute("me.cpf").toString()).size(); i++) {
                    
                        ExerCompletarFrase listaExer = ExerCompletarFrase.PesquisarExercAlun(session.getAttribute("me.cpf").toString()).get(i);
                %>

                <div class="ui padded left aligned clearing segment">

                    <div class="content">
                        <div class="header">
                            <h2 class="ui header"><%=listaExer.getTextoArea()%></h2>
                        </div>
                        <div class="description">

                            <p><h4>Palavras: 
                                <%for (int j = 0; j < ParametroCompletarFrase.listarParExerView(listaExer.getCodigo()).size(); j++) {
                                        ParametroCompletarFrase keyWords = ParametroCompletarFrase.listarParExerView(listaExer.getCodigo()).get(j);
                                        out.println(keyWords.getFrase() + " ");
                                    }%>
                            </h4></p>
                        </div>
                            <div class="description">

                            <p><h4>Status: 
                                <%ExercicioCompletoAluno exercomp = ExercicioCompletoAluno.PesquisarExConcluidos(listaExer.getCodigo(), session.getAttribute("me.cpf").toString());
                                  String status = "Pendente";
                                  if(exercomp != null){
                                      status = "Concluido";
                                  }
                                %>
                                <%=status%>
                            </h4></p>
                        </div>
                        <div class="extra">
                            <div class="ui right floated ">
                                <form method="POST" action="completePalavraView.jsp">
                                    <input type="hidden" name="exeId" value="<%=listaExer.getCodigo()%>"/>
                                    <button class="ui fluid large blue submit button" type="submit" name="gravar" value="Cadastrar">Ver Exercicio</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <%}
}}catch(Exception e){

}%>
            </div>
        </div>
    </body>
</html>

