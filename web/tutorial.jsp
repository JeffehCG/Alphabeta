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

<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <%@include file="/jspf/semantic.jsp"%>
        <link rel="stylesheet" type="text/css" href="src/style/perfil-professor.css">
        <link rel="stylesheet" type="text/css" href="src/Semantic-UI/dist/components/menu.css">
        <title>Tutorial</title>
        <%@include file="jspf/favicon.jspf"%>
    </head>
    <body>
        <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h1 class="ui center aligned icon header">
                Tutotial Exercício de substituição de palavras
            </h1>
        </div>
        <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h2 class="ui center aligned icon header">
                Escrevendo a frase 
            </h2>
            <h4 class="ui main text center aligned container">
                Para inicializar o exercício é preciso escrever a frase desejada, e as palavras que serão utilizadas como parâmetro devem ser substituídas pelo símbolo # como no exemplo abaixo.
Obs: O limite de parâmetros, ou seja o símbolos # na frase são 10.
            </h4>
                <div>
                    <img src="src/tutorial/tutorial1.PNG"/>
                </div>
        </div>
            <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h2 class="ui center aligned icon header">
                Liberação dos parâmetros
            </h2>
            <h4 class="ui main text center aligned container">
                Após a inserção da frase, serão liberados parâmetros onde devem ser colocado as palavras respectivas que completam a frase utilizada anteriormente, e imagens escolhidas pelo próprio usuário, simplesmente clicando em cima do símbolo de adição irá exibir uma tela para selecionar a imagem.
Obs: essas imagens devem ser baixada pelo usuário no próprio dispositivo e depois salva no exercício, e os parâmetros devem ser completados respectivamente na ordem da frase escrita, exemplo : o primeiro símbolo # e relacionado com o primeiro parâmetro “palavra 1” e assim por diante.
            </h4>
                <div>
                    <img src="src/tutorial/tutorial2.PNG"/>
                </div>
        </div>
            <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h2 class="ui center aligned icon header">
                Preenchendo os parâmetros
            </h2>
            <h4 class="ui main text center aligned container">
                Após preencher os parâmetros com a imagem e frase o usuário terá duas opções, salvar o exercício em “Gravar” ou visualizar o exercício em “Visualizar”.
            </h4>
                <div>
                    <img src="src/tutorial/tutorial3.PNG"/>
                </div>
        </div>
            <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h2 class="ui center aligned icon header">
                Visualizar exercício
            </h2>
            <h4 class="ui main text center aligned container">
                Selecionando a opção visualizar será exibido a forma  com que  exercício aparecerá para o aluno, nesse exercício deve ser arrastado a palavra respectiva para o lugar certo na frase.
            </h4>
                <div>
                    <img src="src/tutorial/tutorial4.PNG"/>
                </div>
        </div>
            <div class="ui main text center aligned container" style="margin-top: 90px;">
            <h2 class="ui center aligned icon header">
                Exercício Concluído
            </h2> 
            <h4 class="ui main text center aligned container">
                O exemplo abaixo exibe como o exercício fica concluído no final pelo aluno.
            </h4>
                <div>
                    <img src="src/tutorial/tutorial5.PNG"/>
                </div>
        </div>
             <div class="extra">
                            <div class="ui right floated ">
                                <form action="dragDrop.jsp">
                                    <button class="ui fluid large blue submit button" type="submit" name="gravar" value="Voltar">Voltar</button>
                                </form>
                            </div>
            </div>
    </body>
</html>
