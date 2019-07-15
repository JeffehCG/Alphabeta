<%-- 
    Document   : head
    Created on : May 1, 2018, 11:32:38 PM
    Author     : rodrigo
--%>
<%try {
        if (session.getAttribute("me.cpf") == null) {
            response.sendRedirect(request.getContextPath());
        }
    } catch (Exception e) {

    }
%>
<link rel="stylesheet" type="text/css" href="src/style/menu.css">

<style>
    .ui.secondary.pointing.fixed.menu{
        background-color: #ffffff;
    }
</style>
<div class="ui huge secondary pointing fixed menu top-menu" style="background-image: url('src/img/betaheader.png'); background-size: cover;">
        <div class="item">
            <img src="src/img/alphabetahand.png"/>
        </div>
        <a href="home.jsp" class="item">
            Início
        </a>
        <%try {%>
        <%if (session.getAttribute("me.nivel").equals("aluno")) {
            out.println();%>
        <a href="perfilAluno.jsp" class="item">Perfil</a>
        <a href="turmasAluno.jsp" class="item">Turmas e Exercicios</a>
        <a href="exercicios.jsp"class="item">Exercicios</a>
        <%}
        if (session.getAttribute("me.nivel").equals("professor")) {%>
        <a href="perfilProfessor.jsp" class="item">Perfil</a>
        <a href="dragDrop.jsp"class="item">Novo Exercicio</a>
        <a href="turmasCadastradasProfessor.jsp"class="item">Turmas</a>
        <a href="exercicios.jsp"class="item">Exercicios</a>
        <% }
            } catch (Exception e) {
            } %>


        <div class="right menu">
            <a class="ui item">
                <form><button class="ui button labeled icon red" type="submit" name="logoff" value="Encerrar Sessão">
                        <i class="power off icon"></i>
                        Encerrar Sessão
                    </button>
                </form>
            </a>
        </div>
            
    </div>

    <div class="ui huge secondary pointing fixed menu top-menu-responsive" style="background-image: url('src/img/betaheader.png'); background-size: cover;">
        <div class="item">
            <img src="src/img/alphabetahand.png"/>
        </div>
        
        
        
        <div class=" ui dropdown item">
            <!--<button class="ui icon button men">-->
            <a class="item"><button class="tiny ui button icon men"><i class="bars icon"></i></button></a>
            <!--</button>-->
            <div class="menu">
            <a href="home.jsp" class="item">
                Início
            </a>
            <%try {%>
            <%if (session.getAttribute("me.nivel").equals("aluno")) {
                out.println();%>
            <a href="perfilAluno.jsp" class="item">Perfil</a>
            <a href="turmasAluno.jsp" class="item">Turmas e Exercicios</a>
            <a href="exercicios.jsp"class="item">Exercicios</a>
            <%}
            if (session.getAttribute("me.nivel").equals("professor")) {%>
            <a href="perfilProfessor.jsp" class="item">Perfil</a>
            <a href="dragDrop.jsp"class="item">Novo Exercicio</a>
            <a href="turmasCadastradasProfessor.jsp"class="item">Turmas</a>
            <a href="exercicios.jsp"class="item">Exercicios</a>
            <% }
                } catch (Exception e) {
                } %>
          </div>
        </div>
        
        <div class="right menu item">
            <a class="ui item">
                <form><button class="medium ui button labeled icon red" type="submit" name="logoff" value="Encerrar Sessão">
                        <i class="power off icon"></i>
                        Sair
                    </button>
                </form>
            </a>
        </div>
            
    </div>

<script type="text/javascript">
    $(".ui.secondary.pointing.menu").on("click", ".item", function () {
        if (!$(this).hasClass("active")) {
            $(this).addClass("active").siblings('.item').removeClass('active');
        }
    });
    
    $('.ui.dropdown').dropdown();
</script>

<%if (request.getParameter("logoff") != null) {
        response.sendRedirect("login.jsp");
        session.setAttribute("me.cpf", null);
        session.setAttribute("me.nome", null);
        session.setAttribute("me.nivel", null);

    }%>
