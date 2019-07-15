package com.database.web;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ExerCompletarFrase {
    private int codigo ;
    private String textoArea;
    private String url;
    private String cpfProf;
    private String classif;

    //Metodo para inserir exercicio
    public static void inserirExercicio(String texAre,String url,String cpf,String classif)throws Exception{
        String SQL = "INSERT INTO excompfrase VALUES(default,?,?,?,?)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, texAre);
        s.setString(2,url);
        s.setString(3, cpf);
        s.setString(4,classif);
        s.execute();
        s.close();
    }
    //Metodo para listar Exercico de determinado professor 
    public static ArrayList<ExerCompletarFrase> listarExProf(String cpf) throws Exception{
        ArrayList<ExerCompletarFrase> list = new ArrayList<>();
        String SQL = "SELECT * FROM excompfrase "
                + "WHERE cd_professor = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1,cpf);
        ResultSet rs = s.executeQuery();
        while(rs.next()){
            ExerCompletarFrase exer = new ExerCompletarFrase(
                     rs.getInt("cd_exercicio")
                    ,rs.getString("ds_texto")
                    ,rs.getString("nm_url")
                    ,rs.getString("cd_professor")
                    ,rs.getString("ds_classificacao"));
            list.add(exer);
        }
        rs.close();
        s.close();
        return list;
    }
    
    //Metodo para pesquisar ultimo exercicio cadastrado pelo professor 
    public static ExerCompletarFrase ultimoCadastro(String cpf) throws Exception{
        ExerCompletarFrase exer = null;
        String SQL = "SELECT * FROM excompfrase "
                + "WHERE cd_professor = ? "
                + "ORDER BY cd_exercicio DESC LIMIT 1 ;";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, cpf);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            exer = new ExerCompletarFrase(
                     rs.getInt("cd_exercicio")
                    ,rs.getString("ds_texto")
                    ,rs.getString("nm_url")
                    ,rs.getString("cd_professor")
                    ,rs.getString("ds_classificacao")); 
        }
        rs.close();
        s.close();
        return exer;
    }
    
    //Metodo para listar exercicios vinculados a determinada turma
    public static ArrayList<ExerCompletarFrase>PesquisarExercTurma(int codTurm) throws Exception{
        ArrayList<ExerCompletarFrase> list = new ArrayList<>();
        String SQL = "SELECT * FROM excompfrase, turma, inclcompfrase "
                + "WHERE excompfrase.cd_exercicio = inclcompfrase.cd_exercicio "
                + "AND turma.cd_turma = inclcompfrase.cd_turma "
                + "AND turma.cd_turma = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,codTurm);
        ResultSet rs = s.executeQuery();
            while(rs.next()){
            ExerCompletarFrase exer = new ExerCompletarFrase(
                     rs.getInt("cd_exercicio")
                    ,rs.getString("ds_texto")
                    ,rs.getString("nm_url")
                    ,rs.getString("cd_professor")
                    ,rs.getString("ds_classificacao"));
            list.add(exer);
        }
        rs.close();
        s.close();
        return list;
    }
    
    //Metodo para listar exercicios vinculados a determinado aluno
    public static ArrayList<ExerCompletarFrase>PesquisarExercAlun(String cpf) throws Exception{
        ArrayList<ExerCompletarFrase> list = new ArrayList<>();
        String SQL = "SELECT * FROM aluno,matricula,turma,inclcompfrase,excompfrase \n" +
                "WHERE aluno.cd_cpf = matricula.cd_cpf_aluno \n" +
                "AND turma.cd_turma = matricula.cd_turma \n" +
                "AND turma.cd_turma = inclcompfrase.cd_turma \n" +
                "AND excompfrase.cd_exercicio = inclcompfrase.cd_exercicio \n" +
                "AND aluno.cd_cpf = ?\n" +
                "GROUP BY excompfrase.cd_exercicio";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1,cpf);
        ResultSet rs = s.executeQuery();
            while(rs.next()){
            ExerCompletarFrase exer = new ExerCompletarFrase(
                     rs.getInt("cd_exercicio")
                    ,rs.getString("ds_texto")
                    ,rs.getString("nm_url")
                    ,rs.getString("cd_professor")
                    ,rs.getString("ds_classificacao"));
            list.add(exer);
        }
        rs.close();
        s.close();
        return list;
    }
    
    //Metodo para pesquisar exercicio para mostrar na view da execução
    public static ExerCompletarFrase ViewExercicio(int codExer) throws Exception{
        ExerCompletarFrase exer = null;
        String SQL = "SELECT * FROM excompfrase "
                + "WHERE cd_exercicio = ? ";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, codExer);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            exer = new ExerCompletarFrase(
                     rs.getInt("cd_exercicio")
                    ,rs.getString("ds_texto")
                    ,rs.getString("nm_url")
                    ,rs.getString("cd_professor")
                    ,rs.getString("ds_classificacao")); 
        }
        rs.close();
        s.close();
        return exer;
    }
    
    //Metodo para deletar exercicio
    public static void DeletarExercicio (int cdExer)throws Exception{
        String SQL = "DELETE FROM exercicioConcAluno WHERE cd_exercicio = ?" ;
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
                    s.setInt(1,cdExer);
                    s.execute();
                    s.close();
                    
        SQL = "DELETE FROM prcompfrase WHERE cd_exercicio = ? ";
        PreparedStatement x = DataBase.getConnection().prepareStatement(SQL);
                    x.setInt(1,cdExer);
                    x.execute();
                    x.close(); 
                    
        SQL = "DELETE FROM inclcompfrase WHERE cd_exercicio = ?";
        PreparedStatement z = DataBase.getConnection().prepareStatement(SQL);
                    z.setInt(1,cdExer);
                    z.execute();
                    z.close(); 
        SQL = "DELETE FROM excompfrase WHERE cd_exercicio = ? ";
        PreparedStatement y = DataBase.getConnection().prepareStatement(SQL);
                    y.setInt(1,cdExer);
                    y.execute();
                    y.close(); 
    }
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getTextoArea() {
        return textoArea;
    }

    public void setTextoArea(String textoArea) {
        this.textoArea = textoArea;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getCpfProf() {
        return cpfProf;
    }

    public void setCpfProf(String cpfProf) {
        this.cpfProf = cpfProf;
    }

    public ExerCompletarFrase(int codigo, String textoArea, String url, String cpfProf, String classif) {
        this.codigo = codigo;
        this.textoArea = textoArea;
        this.url = url;
        this.cpfProf = cpfProf;
        this.classif = classif;
    }

    public String getClassif() {
        return classif;
    }

    public void setClassif(String classif) {
        this.classif = classif;
    }
    
}
