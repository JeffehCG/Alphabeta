package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Turma {
    private int nvTurma;
    private String cpfProfessor;
    private int anoInicio;
    private int codTurma;
    
    //Metodo para inserir turma
    public static void inserirTurma(String cpf,int nvTurma)throws Exception{
        Calendar cal = GregorianCalendar.getInstance();
        int ano = cal.get(Calendar.YEAR);
        String SQL = "INSERT INTO turma VALUES(?,?,?,default)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, nvTurma);
        s.setString(2,cpf);
        s.setInt(3, ano);
        s.execute();
        s.close();
    }
    
    //Metodo para listar Turmas de determinado professor 
    public static ArrayList<Turma> getStayList(String cpf) throws Exception{
        ArrayList<Turma> list = new ArrayList<>();
        String SQL = "SELECT * FROM turma WHERE cd_cpf_professor = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1,cpf);
        ResultSet rs = s.executeQuery();
        while(rs.next()){
            Turma tur = new Turma(
                     rs.getInt("nivel_turma")
                    ,rs.getString("cd_cpf_professor")
                    ,rs.getInt("aa_inicio")
                    ,rs.getInt("cd_turma"));
            list.add(tur);
        }
        rs.close();
        s.close();
        return list;
    }
    //Metodo para pesquisar Turma atravez do codigo 
    public static Turma PesquisarTurmaCod(int cdTurm) throws Exception{
        Turma turm = null;
        String SQL = "SELECT * FROM turma WHERE cd_turma = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, cdTurm);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            turm = new Turma(
                     rs.getInt("nivel_turma")
                    ,rs.getString("cd_cpf_professor")
                    ,rs.getInt("aa_inicio")
                    ,rs.getInt("cd_turma"));  
        }
        rs.close();
        s.close();
        return turm;
    }
    
    //Metodo para listar turmas de determinada aluno
    public static ArrayList<Turma>PesquisarTurmasAluno(String cpf) throws Exception{
        ArrayList<Turma> list = new ArrayList<>();
        String SQL = "SElECT * FROM aluno, matricula,turma "
                + "WHERE aluno.cd_cpf = matricula.cd_cpf_aluno "
                + "AND turma.cd_turma = matricula.cd_turma "
                + "AND aluno.cd_cpf = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1,cpf);
        ResultSet rs = s.executeQuery();
            while(rs.next()){
            Turma tur = new Turma(
                     rs.getInt("nivel_turma")
                    ,rs.getString("cd_cpf_professor")
                    ,rs.getInt("aa_inicio")
                    ,rs.getInt("cd_turma"));
            list.add(tur);
        }
        rs.close();
        s.close();
        return list;
    }
    
    //Metodo para alterar nivel turma
    public static void AlterarTurma (int cdTurm, int nivel)throws Exception{
        String SQL = "UPDATE turma SET nivel_turma = ? WHERE cd_turma = ? " ;
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
                    s.setInt(1,nivel);
                    s.setInt(2,cdTurm);
                    s.execute();
                    s.close();
             
    }

    public Turma(int nvTurma, String cpfProfessor, int anoInicio, int codTurma) {
        this.nvTurma = nvTurma;
        this.cpfProfessor = cpfProfessor;
        this.anoInicio = anoInicio;
        this.codTurma = codTurma;
    }    
    
    public int getNvTurma() {
        return nvTurma;
    }

    public void setNvTurma(int nvTurma) {
        this.nvTurma = nvTurma;
    }

    public String getCpfProfessor() {
        return cpfProfessor;
    }

    public void setCpfProfessor(String cpfProfessor) {
        this.cpfProfessor = cpfProfessor;
    }

    public int getAnoInicio() {
        return anoInicio;
    }

    public void setAnoInicio(int anoInicio) {
        this.anoInicio = anoInicio;
    }

    public int getCodTurma() {
        return codTurma;
    }

    public void setCodTurma(int codTurma) {
        this.codTurma = codTurma;
    }
    
    
}
