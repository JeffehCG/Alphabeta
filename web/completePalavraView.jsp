<%@page import="java.io.OutputStream"%>
<%@page import="com.database.web.ParametroCompletarFrase"%>
<%@page import="com.database.web.ExerCompletarFrase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% try {
        System.out.println(session.getAttribute("me.cpf"));
        if (session.getAttribute("me.cpf") == null) {
            response.sendRedirect(request.getContextPath());

        }
//        if (session.getAttribute("me.nivel").equals("aluno")) {
//            response.sendRedirect(request.getContextPath());
//        }

    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <%@include file="/jspf/semantic.jsp"%>
        <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>-->
        <!--<script src="src/Semantic-UI/dist/components/dropdown.js"></script>-->
        <!--<link href="design.css" rel="stylesheet" type="text/css" />-->
        <link href="src/style/completePalavraView.css" rel="stylesheet" type="text/css" />
        <script src="js/app2.js" type="text/javascript" defer="defer"></script>
        <script src="js/touch-punch.js"></script> <!-- <<<<<permite drag and drop do jquery funcionar em mobile -->

    </head>
    <body>	
        <%@include file="jspf/head.jsp"%>
        <%try {
                if (session.getAttribute("me.nivel").equals("professor")) {
                    //for (int i = 0; i < ExerCompletarFrase.listarExProf(session.getAttribute("me.cpf").toString()).size(); i++) {
                        //if (ExerCompletarFrase.listarExProf(session.getAttribute("me.cpf").toString()).get(i).getCodigo() == Integer.parseInt(request.getParameter("exeId"))) {
                            //ExerCompletarFrase listaExer = ExerCompletarFrase.listarExProf(session.getAttribute("me.cpf").toString()).get(i);
                            ExerCompletarFrase listaExer = ExerCompletarFrase.ViewExercicio(Integer.parseInt(request.getParameter("exeId")));



        %>
        <div class="params">
            <input type="hidden" id="frase" value="<%=listaExer.getTextoArea()%>"/>

            <%for (int j = 0; j < ParametroCompletarFrase.listarParExer(listaExer.getCodigo()).size(); j++) {
                    ParametroCompletarFrase keyWords = ParametroCompletarFrase.listarParExer(listaExer.getCodigo()).get(j);
            %>
            <input type="hidden" class="word" id="palavra<%=j%>" value="<%=keyWords.getFrase()%>"/>
            
            <%
//                response.setContentType("image/png");
//                response.setHeader("Content-Disposition", "inline");
//                response.setContentLength(keyWords.getImg().length);
//                System.out.println(keyWords.getImg());
//                System.out.println(keyWords.getImg().length);
//                OutputStream output = response.getOutputStream();
//                output.write(keyWords.getImg());
//                
//                output.flush();
                //RequestDispatcher rd = request.getRequestDispatcher("getImage");
                request.getSession().setAttribute("img"+j, keyWords.getImg());
//                request.getSession().setAttribute("img", keyWords.getImg());
//                System.out.println(request.getSession().getAttribute("img"));
                //rd.forward(request, response);
                
                %>
                <!--<img src="getImage?id=" width="200px" height="200px" style="align-content: center; margin-top: 100px;"/>-->
            
                <%}%>
            <%//}
               // }
            } else {
               // for (int i = 0; i < ExerCompletarFrase.PesquisarExercAlun(session.getAttribute("me.cpf").toString()).size(); i++) {
                    //if (ExerCompletarFrase.PesquisarExercAlun(session.getAttribute("me.cpf").toString()).get(i).getCodigo() == Integer.parseInt(request.getParameter("exeId"))) {
                       // ExerCompletarFrase listaExer = ExerCompletarFrase.PesquisarExercAlun(session.getAttribute("me.cpf").toString()).get(i);
                        ExerCompletarFrase listaExer = ExerCompletarFrase.ViewExercicio(Integer.parseInt(request.getParameter("exeId")));


            %>
            <div class="params">
                <input type="hidden" id="frase" value="<%=listaExer.getTextoArea()%>"/>

                <%for (int j = 0; j < ParametroCompletarFrase.listarParExer(listaExer.getCodigo()).size(); j++) {
                        ParametroCompletarFrase keyWords = ParametroCompletarFrase.listarParExer(listaExer.getCodigo()).get(j);
                %>
                <input type="hidden" class="word" id="palavra<%=j%>" value="<%=keyWords.getFrase()%>"/>
                <%
                
                %>

                <%}%>
                <%//}
                            //}
                        }
                    } catch (Exception e) {

                    }%>
            </div>		
            <div class="ui main segment text center aligned container" style="margin-top: 90px;">
                <!--<div class="ui segment" id="content">-->
                <div class="ui segment text center aligned" id="result"></div>
                <div class="ui segment" id="ans"></div>

                <div id="successMessage">
                    <h2>You did it!</h2>
                    <button onclick="init()">Play Again</button>
                </div>
                <!--</div>-->
            </div>

            <div class="ui basic modal">
                <div class="ui icon header">
                    <i class="archive icon"></i>
                    Archive Old Messages
                </div>
                <div class="content">
                    <p>Your inbox is getting full, would you like us to enable automatic archiving of old messages?</p>
                </div>
                <div class="actions">
                    <div class="ui red basic cancel inverted button">
                        <i class="remove icon"></i>
                        No
                    </div>
                    <div class="ui green ok inverted button">
                        <i class="checkmark icon"></i>
                        Yes
                    </div>
                </div>
            </div>
    </body>
</html>
