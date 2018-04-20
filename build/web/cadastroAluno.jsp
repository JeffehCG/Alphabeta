<%@page import="java.math.BigInteger"%>
<%@page import="com.database.web.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String erro = null;

    try{
        if(request.getParameter("gravar")!=null){
        String nome = request.getParameter("nome") ;
        String sobrenome = request.getParameter("sobrenome");
        String cpf = request.getParameter("cpf");
        String rua = request.getParameter("rua");
        String bairro = request.getParameter("bairro");
        int numero = Integer.parseInt(request.getParameter("numero"));;
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado") ;
        int cep = Integer.parseInt(request.getParameter("cep"));;
        String telefone = request.getParameter("telefone");;
        String nmresp = request.getParameter("nmresp");
        String cfpresp = request.getParameter("cpfresp");;
        String senha = request.getParameter("senha");
    
            Aluno.inserirAluno(nome, sobrenome, cpf, rua, bairro, numero, cidade, estado, cep, telefone, nmresp, cfpresp, senha);
            response.sendRedirect(request.getRequestURI());
            }}catch(Exception e){
                erro = e.getMessage();
    }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Aluno</title>
    </head>
    <body>
        <h1>Cadastro Aluno</h1>
        <%if(erro != null){%>
        <h4><%=erro%></h4><%}%>
        <form>
            <p>Nome:</p>
            <input type="text" name="nome"/><br>
            <p>Sobrenome:</p>
            <input type="text" name="sobrenome"/><br>
            <p>CPF:</p>
            <input type="text" name="cpf"/><br>
            <p>Rua:</p>
            <input type="text" name="rua"/><br>
            <p>Bairro:</p>
            <input type="text" name="bairro"/><br>
            <p>Numero:</p>
            <input type="text" name="numero"/><br>
            <p>Cidade:</p>
            <input type="text" name="cidade"/><br>
            <p>Estado:</p>
            <input type="text" name="estado"/><br>
            <p>CEP:</p>
            <input type="text" name="cep"/><br>
            <p>Telefone:</p>
            <input type="text" name="telefone"/><br>
            <p>Nome Responsavel:</p>
            <input type="text" name="nmresp"/><br>
            <p>CPF Responsavel:</p>
            <input type="text" name="cpfresp"/><br>
            <p>Senha:</p>
            <input type="text" name="senha"/><br>
            <input type="submit" name="gravar" value="Cadastrar"/>
        </form>
        <a href="login.jsp">Voltar para o</a>
    </body>
</html>
