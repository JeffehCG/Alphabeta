
package com.database.web;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

public class ExercicioCompletoAluno {
    private int cdExer;
    private String cpfAlu;
    private Date conclusao;
    private int qtErros;

    //Metodo para inserir conclusao exercicio
    public static void inserirConclusao(String cpf, int cdExer,int qtErros)throws Exception{
        Date atual = new Date(Calendar.getInstance().getTimeInMillis());
        String SQL = "INSERT INTO exercicioConcAluno VALUES(?,?,?,?)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,cdExer);
        s.setString(2,cpf);
        s.setDate(3,atual);
        s.setInt(4,qtErros);
        s.execute();
        s.close();
    }
    //Metodo para pesquisar se determinado exercicio foi concluido por determinado aluno 
    public static ExercicioCompletoAluno PesquisarExConcluidos(int cdExer , String cpf) throws Exception{
        ExercicioCompletoAluno exerComp = null;
        String SQL = "SELECT * FROM exercicioConcAluno WHERE cd_exercicio = ? AND cd_cpf_aluno = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, cdExer);
        s.setString(2, cpf);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            exerComp = new ExercicioCompletoAluno(
                     rs.getInt("cd_exercicio")
                    ,rs.getString("cd_cpf_aluno")
                    ,rs.getDate("dt_conclusao")
                    ,rs.getInt("qt_erros"));  
        }
        rs.close();
        s.close();
        return exerComp;
    } 
    //Metodo para verificar quantidade de exercicios concluidos por determinado aluno 
    public static int PesquisarQuantExConcluidos(String cpf) throws Exception{
        int qt = 0;
        String SQL = "SELECT count(cd_exercicio) FROM exercicioConcAluno WHERE cd_cpf_aluno = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, cpf);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
             qt = rs.getInt("count(cd_exercicio)");
        }
        rs.close();
        s.close();
        return qt;
    }
    //Metodo para verificar quantidade de exercicios concluidos por determinado exercicio 
    public static int PesquisarQuantExConcluidosExer(int cdExer) throws Exception{
        int qt = 0;
        String SQL = "SELECT count(cd_exercicio) FROM exercicioConcAluno WHERE cd_exercicio = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, cdExer);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
             qt = rs.getInt("count(cd_exercicio)");
        }
        rs.close();
        s.close();
        return qt;
    }
    //Metodo para verificar quantidade de erros por determinado aluno 
    public static int PesquisarQuantErros(String cpf) throws Exception{
        int qt = 0;
        String SQL = "SELECT sum(qt_erros) FROM exercicioConcAluno WHERE cd_cpf_aluno = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, cpf);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
             qt = rs.getInt("sum(qt_erros)");
        }
        rs.close();
        s.close();
        return qt;
    }
    //Metodo para verificar quantidade de erros por determinado exercicio 
    public static int PesquisarQuantErrosExer(int cdExer) throws Exception{
        int qt = 0;
        String SQL = "SELECT sum(qt_erros) FROM exercicioConcAluno WHERE cd_exercicio = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, cdExer);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
             qt = rs.getInt("sum(qt_erros)");
        }
        rs.close();
        s.close();
        return qt;
    }
    //Metodo para pesquisar quantidade de conclusões de determinado exercicio por turma
    public static int PesquisarQtExerConTurma(int codTurm,int cdExer) throws Exception{
        int qt = 0;
        String SQL = "SELECT count(exercicioConcAluno.cd_exercicio) FROM turma, matricula, aluno , excompfrase, exercicioConcAluno\n" +
"                WHERE aluno.cd_cpf = matricula.cd_cpf_aluno \n" +
"                AND turma.cd_turma = matricula.cd_turma \n" +
"                AND aluno.cd_cpf = exercicioConcAluno.cd_cpf_aluno\n" +
"                AND excompfrase.cd_exercicio = exercicioConcAluno.cd_exercicio\n" +
"                AND turma.cd_turma = ? "
                + "AND excompfrase.cd_exercicio = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,codTurm);
        s.setInt(2, cdExer);
        ResultSet rs = s.executeQuery();
            if(rs.next()){
            qt = rs.getInt("count(exercicioConcAluno.cd_exercicio)");
        }
        rs.close();
        s.close();
        return qt;
    }
    //Metodo para pesquisar quantidade de erros de determinado exercicio por turma
    public static int PesquisarQtExerErrTurma(int codTurm,int cdExer) throws Exception{
        int qt = 0;
        String SQL = "SELECT sum(exercicioConcAluno.qt_erros) FROM turma, matricula, aluno , excompfrase, exercicioConcAluno\n" +
"                WHERE aluno.cd_cpf = matricula.cd_cpf_aluno \n" +
"                AND turma.cd_turma = matricula.cd_turma \n" +
"                AND aluno.cd_cpf = exercicioConcAluno.cd_cpf_aluno\n" +
"                AND excompfrase.cd_exercicio = exercicioConcAluno.cd_exercicio\n" +
"                AND turma.cd_turma = ? "
                + "AND excompfrase.cd_exercicio = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,codTurm);
        s.setInt(2, cdExer);
        ResultSet rs = s.executeQuery();
            if(rs.next()){
            qt = rs.getInt("sum(exercicioConcAluno.qt_erros)");
        }
        rs.close();
        s.close();
        return qt;
    }
    public int getCdExer() {
        return cdExer;
    }

    public void setCdExer(int cdExer) {
        this.cdExer = cdExer;
    }

    public String getCpfAlu() {
        return cpfAlu;
    }

    public void setCpfAlu(String cpfAlu) {
        this.cpfAlu = cpfAlu;
    }

    public Date getConclusao() {
        return conclusao;
    }

    public void setConclusao(Date conclusao) {
        this.conclusao = conclusao;
    }

    public int getQtErros() {
        return qtErros;
    }

    public void setQtErros(int qtErros) {
        this.qtErros = qtErros;
    }

    public ExercicioCompletoAluno(int cdExer, String cpfAlu, Date conclusao, int qtErros) {
        this.cdExer = cdExer;
        this.cpfAlu = cpfAlu;
        this.conclusao = conclusao;
        this.qtErros = qtErros;
    }
  
  
}
