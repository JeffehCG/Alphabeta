package com.database.web;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;


public class Matricula {
    private Date matricula ;
    private String cfpAluno;
    private String estadoMatricula;
    private int cdTurma;

    //Metodo para inserir matricula
    public static void inserirMatricula(String cpf, int cdTurma)throws Exception{
        Date atual = new Date(Calendar.getInstance().getTimeInMillis());
        String estado = "ativo";
        String SQL = "INSERT INTO matricula VALUES(?,?,?,?)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setDate(1,atual);
        s.setString(2,cpf);
        s.setString(3,estado );
        s.setInt(4,cdTurma);
        s.execute();
        s.close();
    }
    //Metodo para deletar matricula
    public static void DeletarMatricula (int cdTurm, String cpfAlu)throws Exception{
        String SQL = "DELETE FROM matricula WHERE cd_turma = ? AND cd_cpf_aluno = ? " ;
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
                    s.setInt(1,cdTurm);
                    s.setString(2,cpfAlu);
                    s.execute();
                    s.close();
             
    }
    //Metodo para Pesquisar aluno em determinada turma
    public static Matricula PesquisarAluno(int cdTurm, String cpfAlu) throws Exception{
        Matricula matric = null;
        String SQL = "SELECT * FROM matricula WHERE cd_turma = ? AND cd_cpf_aluno = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, cdTurm);
        s.setString(2,cpfAlu);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            matric = new Matricula(
                     rs.getDate("dt_matricula")
                    ,rs.getString("cd_cpf_aluno")
                    ,rs.getString("ic_estado_matricula")
                    ,rs.getInt("cd_turma"));  
        }
        rs.close();
        s.close();
        return matric;
    }
    
    public Matricula(Date matricula, String cfpAluno, String estadoMatricula, int cdTurma) {
        this.matricula = matricula;
        this.cfpAluno = cfpAluno;
        this.estadoMatricula = estadoMatricula;
        this.cdTurma = cdTurma;
    }

    public Date getMatricula() {
        return matricula;
    }

    public void setMatricula(Date matricula) {
        this.matricula = matricula;
    }

    public String getCfpAluno() {
        return cfpAluno;
    }

    public void setCfpAluno(String cfpAluno) {
        this.cfpAluno = cfpAluno;
    }

    public String getEstadoMatricula() {
        return estadoMatricula;
    }

    public void setEstadoMatricula(String estadoMatricula) {
        this.estadoMatricula = estadoMatricula;
    }

    public int getCdTurma() {
        return cdTurma;
    }

    public void setCdTurma(int cdTurma) {
        this.cdTurma = cdTurma;
    }
    
    
}
