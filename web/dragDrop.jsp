<%@page import="java.io.InputStream"%>
<%@page import="com.database.web.ExerCompletarFrase"%>
<%@page import="com.database.web.ParametroCompletarFrase"%>
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

<html lang="pt-br">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <%@include file="/jspf/semantic.jsp"%>
        <link rel="stylesheet" type="text/css" href="src/style/perfil-professor.css">
        <link rel="stylesheet" type="text/css" href="src/Semantic-UI/dist/components/menu.css">
        <title>Exercício</title>
        <%@include file="jspf/favicon.jspf"%>
        <link href="src/style/completePalavraView.css" rel="stylesheet" type="text/css" />
        <link href="src/style/dragDrop.css" rel="stylesheet" type="text/css" />
        <script src="js/app.js" type="text/javascript" defer="defer"></script>
        <script src="js/touch-punch.js"></script>
        <script src="src/Semantic-UI/dist/components/dropdown.js"></script>
    </head>
    <body>
        <%@include file="jspf/head.jsp"%>
        </br>
        </br>
        </br>
        </br>
        <div class="extra">
                <div class="ui right floated ">
                    <form action="tutorial.jsp">
                            <button class="ui fluid large blue submit button" type="submit" name="gravar" value="Tutorial">Tutorial</button>
                    </form>
                </div>
            </div>




        <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>-->
        <!--<script src="http://code.jquery.com/ui/1.8.24/jquery-ui.min.js" type="text/javascript"></script>-->
        <!--<script src="jquery/jquery-1.8.3.js" type="text/javascript"></script>-->
        <!--<link href="http://code.jquery.com/ui/1.8.24/themes/blitzer/jquery-ui.css" rel="stylesheet" type="text/css" />-->
        <!--<link href="jquery/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />-->

        <!--<link href="design.css" rel="stylesheet" type="text/css" />-->
         <!-- <<<<<permite drag and drop do jquery funcionar em mobile -->

<div class="ui main segment text center aligned container" style="margin-top: 90px;">
        <div id="menu" class="form" style="margin-top: 90px;margin-left: 100px; margin-right: 100px;">

            
            
            <form action="processImage" method="POST" enctype='multipart/form-data'>
                <div class='exeContainer ui form' id="e1">
                    <h2 class="ui center aligned icon header">
                        <i class="circular pencil alternate icon"></i>
                        Exercício de substituição de palavras
                    </h2>


                    <!-- Texto<input type='text' class='texto' value=''/>&nbsp;  -->

                    <div class="field">
                        <textarea name="areaTexto" rows="6" class="texto" placeholder="Digite a frase aqui..." required></textarea>
                    </div>
                    
                    <div class="exe-cards ui  cards field">
                    <!--ESSE É O CARD XABLOCKS-->
                        <div class="ui card form keyWord">
                            <input type="file"  name="ex1wo1" id="ex1wo1" required/>
                            <label class="lblFile" for="ex1wo1">
                                <i class='plus icon'></i>
                            </label>
                            <input name="palavra1" type='text' class='palavra' placeholder="Palavra #1" required/>
                        </div>
                    </div>
                    <!--FIM DO CARD XABLOCKS-->
                </div>
                <br>
                <div class="ui center aligned container">
                        <button class="ui big labeled icon green button" type="submit" name="gravar" value="Gravar">
                            <i class="save icon"></i>
                            Gravar  
                        </button>
                </div>
                <!--<input type="submit" name="gravar" value="Gravar" class="ui labeled icon button"/>-->
            </form>
            <!-- Texto<input type="text" class="texto" value="aa # aa # aa # aa # aa # aa # aa # aa # aa # aa # aa # aa # aa # aa # aa # aa # "/>&nbsp;
            Palavra<input type="text" class="palavra"/><br>  -->

        </div>
        <div class="ui center aligned basic segment">
            <div class="ui horizontal divider">
                Ou
            </div>
        </div>

        <div class="ui center aligned container">
                <button class="ui big labeled icon yellow button " id="sub" disabled>
                    <i class="eye icon"></i>
                    Visualizar
                </button>
        </div>



                <!--<div class="ui segment" id="content">-->
                <div class="ui segment text center aligned" id="result"></div>
                <div class="ui segment" id="ans"></div>

                <div id="successMessage">
                    <h2>You did it!</h2>
                    <button onclick="init()">Play Again</button>
                </div>
                <!--</div>-->
</div>
    </body>
</html>
