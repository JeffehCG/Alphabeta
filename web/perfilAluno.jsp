
<%@page import="com.database.web.Aluno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if(session.getAttribute("me.cpf")==null){
        response.sendRedirect(request.getContextPath());
    }
    %>
    
    <% 
        String cpf = (String)session.getAttribute("me.cpf");
        Aluno a = Aluno.PesquisarAlunoCpf(cpf);
       try{ 
        if(request.getParameter("salvar")!=null){
            String nome = request.getParameter("nome") ;
            String sobrenome = request.getParameter("sobrenome");
            String rua = request.getParameter("rua");
            String bairro = request.getParameter("bairro");
            int numero = Integer.parseInt(request.getParameter("numero"));;
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado") ;
            int cep = Integer.parseInt(request.getParameter("cep"));;
            String telefone = request.getParameter("telefone");;
            String nmresp = request.getParameter("nmresp");
            String cfpresp = request.getParameter("cpfresp");
            Aluno.AlterarAluno(nome, sobrenome, cpf, rua, bairro, numero, cidade, estado, cep, telefone, nmresp, cfpresp);
            response.sendRedirect(request.getRequestURI());
        }
    }catch(Exception e){
        
    }
        %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Aluno</title>
    </head>
    <body>
        <h1>Perfil Aluno</h1>
        <%
            if(request.getParameter("alterar")==null){
            %>
        <table border="1">
            <tbody>
                <tr>
                    <td>Nome</td>
                    <td><%=a.getNome()%></td>
                </tr>
                <tr>
                    <td>Sobrenome</td>
                    <td><%=a.getSobreNome()%></td>
                </tr>
                <tr>
                    <td>Rua</td>
                    <td><%=a.getRua()%></td>
                </tr>
                <tr>
                    <td>Bairro</td>
                    <td><%=a.getBairro()%></td>
                </tr>
                <tr>
                    <td>Numero</td>
                    <td><%=a.getNumero()%></td>
                </tr>
                <tr>
                    <td>Cidade</td>
                    <td><%=a.getCidade()%></td>
                </tr>
                <tr>
                    <td>Estado</td>
                    <td><%=a.getEstado()%></td>
                </tr>
                <tr>
                    <td>Cep</td>
                    <td><%=a.getCep()%></td>
                </tr>
                <tr>
                    <td>Telefone</td>
                    <td><%=a.getTelefone()%></td>
                </tr>
                <tr>
                    <td>Nome Responsavel</td>
                    <td><%=a.getNomeResponsavel()%></td>
                </tr>
                <tr>
                    <td>CPF Responsavel</td>
                    <td><%=a.getCpfresponsavel()%></td>
                </tr> 
            </tbody>
        </table>
                    <%}if(request.getParameter("alterar")!=null){
                %>
                <form>
                    Nome:<input type="text" name="nome" value="<%=a.getNome()%>"/><br>
                    Sobrenome:<input type="text" name="sobrenome" value="<%=a.getSobreNome()%>"/><br>
                    Rua:<input type="text" name="rua" value="<%=a.getRua()%>"/><br>
                    Bairro:<input type="text" name="bairro" value="<%=a.getBairro()%>"/><br>
                    Numero:<input type="text" name="numero" value="<%=a.getNumero()%>"/><br>
                    Cidade:<input type="text" name="cidade" value="<%=a.getCidade()%>"/><br>
                    Estado:<input type="text" name="estado" value="<%=a.getEstado()%>"/><br>
                    CEP:<input type="text" name="cep" value="<%=a.getCep()%>"/><br>
                    Telefone:<input type="text" name="telefone" value="<%=a.getTelefone()%>"/><br>
                    Nome Responsavel:<input type="text" name="nmresp" value="<%=a.getNomeResponsavel()%>"/><br>
                    CPF Responsavel:<input type="text" name="cpfresp" value="<%=a.getCpfresponsavel()%>"/><br>
                    <input type="submit" name="salvar" value="Salvar Alterações"/>
                </form>
                <%}%>
                <form><input type="submit" name="alterar" value="Alterar Dados"/></form>
                
                
    </body>
</html>
