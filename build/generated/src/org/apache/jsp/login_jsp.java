package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.database.web.Aluno;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");

//Session Aluno
    String erro = null ;
    try{
            if(request.getParameter("entrar")!=null){
                    int cpf = Integer.parseInt(request.getParameter("cpf"));
                    String senha = request.getParameter("senha");
                    Aluno a = Aluno.PesquisarAlunoCpf(cpf);
                    String senhuser = a.getSenha();
                    if(a.getNome()!=null && senhuser == senha){
                 session.setAttribute("me.id",request.getParameter("cpf"));
                response.sendRedirect("home.jsp");}
                }
    }catch(Exception e){
        erro= "Usuario Invalido";
    }

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Login</h1>\n");
      out.write("        <h4>Digite seu usuario e senha para entrar</h4>\n");
      out.write("        \n");
      out.write("        <form>\n");
      out.write("            <p>CPF:</p>\n");
      out.write("            <input type=\"text\" name=\"cpf\"/>\n");
      out.write("            <p>Senha</p>\n");
      out.write("            <input type=\"text\" name=\"senha\"/>\n");
      out.write("            <input type=\"submit\" name=\"entrar\" value=\"Acessar\"/>\n");
      out.write("        </form>\n");
      out.write("        <br>\n");
      out.write("        <br>\n");
      out.write("        <a href=\"cadastroAluno.jsp\">Cadastrar</a>\n");
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
