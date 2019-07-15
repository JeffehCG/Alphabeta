<%@page import="com.database.web.ExerCompletarFrase"%>
<%@page import="com.database.web.Turma"%>
<%@page import="com.database.web.Aluno"%>
<%@page import="com.database.web.Professor"%>
<%@page import="com.database.web.Matricula"%>
<%@page import="com.database.web.InclusaoExercTurma"%>
<%@page import="com.database.web.ExercicioCompletoAluno"%>
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

<%
    String cpf = (String) session.getAttribute("me.cpf");
    try {
        if (request.getParameter("gravarTurma") != null) {
            int nvTurma = Integer.parseInt(request.getParameter("nvTurma"));
            Turma.inserirTurma(cpf, nvTurma);
        }
    } catch (Exception e) {
    }

    try {
        if (request.getParameter("salvarAlt") != null) {
            int nvTurma = Integer.parseInt(request.getParameter("nvAltTurm"));
            int cdTurma = Integer.parseInt(request.getParameter("idTurmaAlt"));
            Turma.AlterarTurma(cdTurma, nvTurma);
        }
    } catch (Exception e) {
    }

    try {
        if (request.getParameter("desmatricular") != null) {
            int cdTurma = Integer.parseInt(request.getParameter("codigoTurmaEx"));
            String cpfAlu = request.getParameter("cpfAluEx");
            Matricula.DeletarMatricula(cdTurma, cpfAlu);
        }
    } catch (Exception e) {
    }

    try {
        if (request.getParameter("ExcluirEx") != null) {
            int cdTurma = Integer.parseInt(request.getParameter("codigoTurmaExi"));
            int cdExer = Integer.parseInt(request.getParameter("codExerEx"));
            InclusaoExercTurma.DeletarVincExercicio(cdTurma, cdExer);
        }
    } catch (Exception e) {
    }

    try {
        if (request.getParameter("adicionarAluno") != null) {
            int codigoTurma = Integer.parseInt(request.getParameter("codigoTurma"));
            session.setAttribute("me.cdTurm", Integer.valueOf(codigoTurma));
            response.sendRedirect("adAlunoTurma.jsp");
        }
        if (request.getParameter("adicionarExecicior") != null) {
            int codigoTurma = Integer.parseInt(request.getParameter("codigoTurma"));
            session.setAttribute("me.cdTurm", Integer.valueOf(codigoTurma));
            response.sendRedirect("adExercicioTurma.jsp");
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
        <title>Turmas</title>
        <%@include file="jspf/favicon.jspf"%>
    </head>
    <body>
        <%@include file="jspf/head.jsp"%>
        <div class="ui main segment text center aligned container" style="margin-top: 90px;">
            <%try {
            %>
            <h2>Turmas Cadastradas</h2>

            <%if (request.getParameter("alunosTurma") == null && request.getParameter("exerTurma") == null && request.getParameter("alterarT") == null) {%>
            <table class="ui  table center aligned" >
                <thead>
                    <tr><th>Código</th>
                        <th >Nível</th>
                        <th>Ano de início</th>
                    </tr></thead>
                <tbody>
                    <%
                        try {
                            for (int i = 0; i < Turma.getStayList(cpf).size(); i++) {
                                Turma lista = Turma.getStayList(cpf).get(i);%>
                    <tr>
                        <td>
                            <%=lista.getCodTurma()%> 
                        </td>
                        <td>
                            <%=lista.getNvTurma()%>
                        </td>
                        <td>
                            <%=lista.getAnoInicio()%>
                        </td>
                        <td class="right aligned single line">
                            <form>
                                <input type="hidden" name="idTurma" value="<%=lista.getCodTurma()%>"/>
                                <button type="submit" name="alunosTurma" class="ui basic button">
                                    <i class="icon user"></i>
                                    Alunos
                                </button>
                            </form>
                        </td>
                        <td class="right aligned single line">
                            <form>
                                <input type="hidden" name="idTurma" value="<%=lista.getCodTurma()%>"/>
                                <button type="submit" name="exerTurma" class="ui basic button">
                                    <i class="icon file alternate"></i>
                                    Exercicios
                                </button>
                            </form>
                        </td>
                        <td class="right aligned single line">
                            <form>
                                <input type="hidden" name="idTurma" value="<%=lista.getCodTurma()%>"/>
                                <button type="submit" name="alterarT" class="ui basic button">
                                    <i class="icon pencil alternate"></i>
                                    Alterar
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%}%></tbody><%
                            } catch (Exception e) {
                            }
                        }
                        if (request.getParameter("alunosTurma") == null && request.getParameter("exerTurma") == null && request.getParameter("alterarT") != null) {
                            int cdTurm = Integer.parseInt(request.getParameter("idTurma"));
                            Turma AlunTurm = Turma.PesquisarTurmaCod(cdTurm);
                    %>
                <form class="ui equal width form form-cadastro">
                    <div class='fields'>
                        <div class="four wide field"></div>
                        <div class='four wide field'>
                            <label>Nivel</label>
                            <input type="hidden" name="idTurmaAlt" value="<%=AlunTurm.getCodTurma()%>"/>
                            <input type="text" name="nvAltTurm" value="<%=AlunTurm.getNvTurma()%>"/>
                        </div>
                        <div class="four wide field"></div>

                    </div>
                    <div>
                        <button class="ui labeled icon green button" type="submit" name="salvarAlt">
                            <i class="save icon"></i>
                            Salvar Alterações
                        </button>
                        <form>
                            <button type="submit" name="voltarList" class="ui labeled icon button yellow">
                                <i class="chevron left icon"></i>
                                Voltar
                            </button>
                        </form>
                        <%if (request.getParameter("voltarList") != null) {
                                response.sendRedirect(request.getRequestURI());
                            }%>
                    </div>
                </form>
                <%
                    }
                    if (request.getParameter("alunosTurma") != null) {
                        int cdTurm = Integer.parseInt(request.getParameter("idTurma"));
                        Turma AlunTurm = Turma.PesquisarTurmaCod(cdTurm);
                %>
            </table>

            <table class="ui table center aligned">
                <thead>
                    <tr>
                        <th>Código</th>
                        <th>Nivel</th>
                        <th>Ano de início</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <%=AlunTurm.getCodTurma()%>
                        </td>
                        <td><%=AlunTurm.getNvTurma()%></td>
                        <td><%=AlunTurm.getAnoInicio()%></td>
                        <td>
                            <form>
                                <button type="submit" name="voltarList" class="ui labeled icon button yellow">
                                    <i class="chevron left icon"></i>
                                    Voltar
                                </button>
                            </form>
                            <%if (request.getParameter("voltarList") != null) {
                                    response.sendRedirect(request.getRequestURI());
                                }%>
                        </td>
                </tbody>
            </table>

            <table class="ui table center aligned">
                <thead>
                    <tr><th>Nome</th>
                        <th>Sobrenome</th>
                        <th>CPF</th>
                        <th>Exercicios Concluidos</th>
                        <th>Quantidade Erros</th>
                        <th></th>
                    </tr></thead>
                <tbody>
                    <%
                        try {
                            for (int i = 0; i < Aluno.PesquisarAlunosTurma(cdTurm).size(); i++) {
                                Aluno listaAlu = Aluno.PesquisarAlunosTurma(cdTurm).get(i);%>
                    <tr>
                        <td  class="single line">
                            <%=listaAlu.getNome()%>
                        </td>
                        <td class="single line">
                            <%=listaAlu.getSobreNome()%>
                        </td>
                        <td>
                            <%=listaAlu.getCpf()%>
                        </td>
                        <td>
                            <%int qtExer = 0;
                            qtExer = ExercicioCompletoAluno.PesquisarQuantExConcluidos(listaAlu.getCpf());%>
                            <%=qtExer%>
                        </td>
                        <td>
                            <%int qtErros = 0;
                            qtErros = ExercicioCompletoAluno.PesquisarQuantErros(listaAlu.getCpf());%>
                            <%=qtErros%>
                        </td>
                        <td class="right aligned">
                            <form>
                                <input type="hidden" name="codigoTurmaEx" value="<%=AlunTurm.getCodTurma()%>"/>
                                <input type="hidden" name="cpfAluEx" value="<%=listaAlu.getCpf()%>"/>
                                <button type="submit" name="desmatricular" class="ui basic button">
                                    <i class="icon trash"></i>
                                    Desmatricular
                                </button>
                            </form>
                        </td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                        }%>
                </tbody>
            </table>  

            <form>
                <input type="hidden" name="codigoTurma" value="<%=AlunTurm.getCodTurma()%>"/>
                <button type="submit" name="adicionarAluno" class="ui green button">
                    <i class="icon user plus"></i>
                    Adicionar Alunos
                </button>
            </form>
            <%}
                if (request.getParameter("exerTurma") != null) {
                    int cdTurm = Integer.parseInt(request.getParameter("idTurma"));
                    Turma AlunTurm = Turma.PesquisarTurmaCod(cdTurm);
            %>
        </table>

        <table class="ui table center aligned">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Nivel</th>
                    <th>Ano de início</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <%=AlunTurm.getCodTurma()%>
                    </td>
                    <td><%=AlunTurm.getNvTurma()%></td>
                    <td><%=AlunTurm.getAnoInicio()%></td>
                    <td>
                        <form>
                            <button type="submit" name="voltarList" class="ui labeled icon button yellow">
                                <i class="chevron left icon"></i>
                                Voltar
                            </button>
                        </form>
                        <%if (request.getParameter("voltarList") != null) {
                                response.sendRedirect(request.getRequestURI());
                            }%>
                    </td>
            </tbody>
        </table>

        <table class="ui table center aligned">
            <thead>
                <tr><th>Código</th>
                    <th>Texto</th>
                    <th>Classificação</th>
                    <th>Quantidade Conclusões</th>
                    <th>Quantidade Erros</th>
                    <th></th>
                </tr></thead>
            <tbody>
                <%
                    try {
                        for (int i = 0; i < ExerCompletarFrase.PesquisarExercTurma(cdTurm).size(); i++) {
                            ExerCompletarFrase listaExer = ExerCompletarFrase.PesquisarExercTurma(cdTurm).get(i);%>
                <tr>
                    <td>
                        <%=listaExer.getCodigo()%>
                    </td>
                    <td>
                        <%=listaExer.getTextoArea()%>
                    </td>
                    <td>
                        <%=listaExer.getClassif()%>
                    </td>
                    <td>
                        <%int qtExerTur = 0;
                        qtExerTur = ExercicioCompletoAluno.PesquisarQtExerConTurma(cdTurm,listaExer.getCodigo());%>
                        <%=qtExerTur%>
                    </td>
                    <td>
                        <%int qtErrTur = 0;
                        qtErrTur = ExercicioCompletoAluno.PesquisarQtExerErrTurma(cdTurm,listaExer.getCodigo());%>
                        <%=qtErrTur%>
                    </td>
                    <td class="right aligned">
                        <form>
                            <input type="hidden" name="codigoTurmaExi" value="<%=AlunTurm.getCodTurma()%>"/>
                            <input type="hidden" name="codExerEx" value="<%=listaExer.getCodigo()%>"/>
                            <button type="submit" name="ExcluirEx" class="ui basic button">
                                <i class="icon trash"></i>
                                Excluir
                            </button>
                        </form>
                    </td>
                </tr>
                <%}
                    } catch (Exception e) {
                    }%>
            </tbody>
        </table>  

        <form>
            <input type="hidden" name="codigoTurma" value="<%=AlunTurm.getCodTurma()%>"/>
            <button type="submit" name="adicionarExecicior" class="ui green button">
                <i class="icon user plus"></i>
                Adicionar Exercicio
            </button>
        </form>
        <%}%>

        <%if (request.getParameter("alunosTurma") == null && request.getParameter("exerTurma") == null && request.getParameter("alterarT") == null) {%>
        <div>
            <form>
                <button type="submit" name="novaTurma" class="ui green button">
                    <i class="icon users"></i>
                    Nova Turma
                </button>
            </form>
        </div>
        <br>
        <%}
            if (request.getParameter("novaTurma") != null) {%>
        <div class="ui action input">
            <form>
                <input type="text" name="nvTurma" placeholder="Nível da turma">
                <button type="submit" name="gravarTurma" class="ui button">Gravar nova turma</button>
            </form>
        </div>

        <%}
            } catch (Exception e) {
            }%>
    </div>
</body>
</html>
