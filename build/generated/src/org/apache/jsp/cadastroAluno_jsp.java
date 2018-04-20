package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.database.web.Aluno;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import java.util.Date;

public final class cadastroAluno_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    String enterParkingErrorMessage = null;
    //Grava Aluno no banco
    
    try{
        if(request.getParameter("cadastrar")!=null){
            String nome = request.getParameter("nome");
            String sobrenome = request.getParameter("sobrenome");
            int cpf = Integer.parseInt(request.getParameter("cpf"));
            SimpleDateFormat form = new SimpleDateFormat("dd/MM/yyyy");
            String date = (request.getParameter("dia")+"/"+request.getParameter("mes")+"/"+request.getParameter("ano"));
            Date dts = form.parse(date);
            String rua = request.getParameter("rua");
            String bairro = request.getParameter("bairro");
            int numero = Integer.parseInt(request.getParameter("numero"));
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            int cep = Integer.parseInt(request.getParameter("cep"));
            int telefone = Integer.parseInt(request.getParameter("telefone"));
            String nmResp = request.getParameter("nmresp");
            int cpfResp = Integer.parseInt(request.getParameter("cpfresp"));
            String senha = request.getParameter("senha");
            
            try{
                Aluno.inserirAluno(nome, sobrenome, cpf, dts, rua, bairro, numero, cidade, estado, cep, telefone, nmResp, cpfResp, senha);
                response.sendRedirect(request.getRequestURI());
            }catch(Exception e){
                enterParkingErrorMessage = e.getMessage();
            }
            
        }
        
    }catch(Exception e){
        enterParkingErrorMessage = e.getMessage();
    }


      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Cadastro Aluno</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Cadastrar Aluno</h1>\n");
      out.write("        <h3>");
      out.print(enterParkingErrorMessage);
      out.write("</h3>\n");
      out.write("        <form>\n");
      out.write("            <p>Nome:</p>\n");
      out.write("            <input type=\"text\" name=\"nome\"/><br>\n");
      out.write("            <p>SobreNome:</p>\n");
      out.write("            <input type=\"text\" name=\"sobrenome\"/><br>\n");
      out.write("            <p>CPF:</p>\n");
      out.write("            <input type=\"text\" name=\"cpf\"/><br>\n");
      out.write("            <p>Data Nascimento:</p>\n");
      out.write("            <input type=\"text\" name=\"dia\">\n");
      out.write("            <p>/</p>\n");
      out.write("            <input type=\"text\" name=\"mes\">\n");
      out.write("            <p>/</p>\n");
      out.write("            <input type=\"text\" name=\"ano\"><br>\n");
      out.write("            <p>Rua:</p>\n");
      out.write("            <input type=\"text\" name=\"rua\"/><br>\n");
      out.write("            <p>Bairro:</p>\n");
      out.write("            <input type=\"text\" name=\"bairro\"/><br>\n");
      out.write("            <p>Numero:</p>\n");
      out.write("            <input type=\"text\" name=\"numero\"/><br>\n");
      out.write("            <p>Cidade:</p>\n");
      out.write("            <input type=\"text\" name=\"cidade\"/><br>\n");
      out.write("            <p>Estado:</p>\n");
      out.write("            <input type=\"text\" name=\"estado\"/><br>\n");
      out.write("            <p>CEP:</p>\n");
      out.write("            <input type=\"text\" name=\"cep\"/><br>\n");
      out.write("            <p>Telefone:</p>\n");
      out.write("            <input type=\"text\" name=\"telefone\"/><br>\n");
      out.write("            <p>Nome Responsavel:</p>\n");
      out.write("            <input type=\"text\" name=\"nmresp\"/><br>\n");
      out.write("            <p>CPF Responsavel:</p>\n");
      out.write("            <input type=\"text\" name=\"cpfresp\"/><br>\n");
      out.write("            <p>Senha:</p>\n");
      out.write("            <input type=\"text\" name=\"senha\"/><br>\n");
      out.write("            <input type=\"submit\" name=\"cadastrar\" value=\"Cadastrar\"/>      \n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
