
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
        
        %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil Aluno</title>
    </head>
    <body>
        <h1>Perfil Aluno</h1>
        <table border="1">
            <tbody>
                <tr>
                    <td>Nome</td>
                    <td><%=a.getNome()%></td>
                </tr>
            </tbody>>
            <tbody>
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
                <form><input type="submit" name="alterar" value="Alterar Dados"</form>
    </body>
</html>
