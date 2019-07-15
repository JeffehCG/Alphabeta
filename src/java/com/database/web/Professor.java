package com.database.web;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;

public class Professor {
  private String nome;
  private String sobrenome;
  private String cpf;
  private Date dtNasc ;
  private String rua;
  private String bairro;
  private int numero ;
  private String cidade;
  private String estado;
  private int cep;
  private String telefone;
  private String email;
  private String senha;
  
  //Metodo para inserir professor
    public static void inserirProfessor (String nome,String sobrenome,String cpf, Date dtNasc ,String rua,String bairro, int numero, String cidade,String estado, int cep, String telefone,String email ,String senha) throws Exception{
        String SQL = "INSERT INTO professor VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1,nome);
        s.setString(2,sobrenome);
        s.setString(3,cpf);
        s.setDate(4,dtNasc);
        s.setString(5,rua);
        s.setString(6, bairro);
        s.setInt(7,numero);
        s.setString(8,cidade);
        s.setString(9,estado);
        s.setInt(10, cep);
        s.setString(11,telefone);
        s.setString(12,email);
        s.setString(13,senha);
        s.execute();
        s.close();
    }
    //Metodo para listar Professores do banco 
    public static ArrayList<Professor> getStayList() throws Exception{
        ArrayList<Professor> list = new ArrayList<>();
        Statement s = DataBase.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM professor");
        while(rs.next()){
            Professor pr = new Professor(
                     rs.getString("nm_nome")
                    ,rs.getString("nm_sobrenome")
                    ,rs.getString("cd_cpf")
                    ,rs.getDate("dt_nascimento")
                    ,rs.getString("nm_endereco_rua")
                    ,rs.getString("nm_endereco_bairro")
                    ,rs.getInt("nm_endereco_num")
                    ,rs.getString("nm_cidade")
                    ,rs.getString("nm_estado")
                    ,rs.getInt("cd_cep")
                    ,rs.getString("cd_telefone")
                    ,rs.getString("nm_email")
                    ,rs.getString("cd_senha"));
            list.add(pr);
        }
        rs.close();
        s.close();
        return list;
    }
    
    //Metodo para pesquisar professor atravez do cpf 
    public static Professor PesquisarProfessorCpf(String cpf) throws Exception{
        Professor professor = null;
        String SQL = "SELECT * FROM professor WHERE cd_cpf=?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, cpf);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            professor = new Professor(
                     rs.getString("nm_nome")
                    ,rs.getString("nm_sobrenome")
                    ,rs.getString("cd_cpf")
                    ,rs.getDate("dt_nascimento")
                    ,rs.getString("nm_endereco_rua")
                    ,rs.getString("nm_endereco_bairro")
                    ,rs.getInt("nm_endereco_num")
                    ,rs.getString("nm_cidade")
                    ,rs.getString("nm_estado")
                    ,rs.getInt("cd_cep")
                    ,rs.getString("cd_telefone")
                    ,rs.getString("nm_email")
                    ,rs.getString("cd_senha"));   
        }
        rs.close();
        s.close();
        return professor;
    }
    
    //Metodo para excluir professor
    public static void excluirProfessor(String cpf)throws Exception{
        String SQL = "DELETE FROM professor WHERE cd_cpf = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, cpf);
        s.execute();
        s.close();
    }

    //Metodo para alterar professor
    public static void AlterarProfessor (String nome,String sobrenome,String cpf,String rua,String bairro, int numero, String cidade,String estado, int cep, String telefone, String email)throws Exception{
        String SQL = "UPDATE professor SET nm_nome = ? , nm_sobrenome = ? , nm_endereco_rua = ? , nm_endereco_bairro = ? , nm_endereco_num = ? , nm_cidade = ? , nm_estado = ? , cd_cep = ? , cd_telefone = ? , nm_email = ? WHERE cd_cpf = ? " ;
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
                    s.setString(1,nome);
                    s.setString(2,sobrenome);
                    s.setString(3,rua);
                    s.setString(4,bairro);
                    s.setInt(5,numero);
                    s.setString(6,cidade);
                    s.setString(7,estado);
                    s.setInt(8,cep);
                    s.setString(9,telefone);
                    s.setString(10,email);  
                    s.setString(11,cpf);
                    s.execute();
                    s.close();
             
    }

    public Professor(String nome, String sobrenome, String cpf, Date dtNasc, String rua, String bairro, int numero, String cidade, String estado, int cep, String telefone, String email, String senha) {
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.cpf = cpf;
        this.dtNasc = dtNasc;
        this.rua = rua;
        this.bairro = bairro;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.cep = cep;
        this.telefone = telefone;
        this.email = email;
        this.senha = senha;
    }
  
  

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public Date getDtNasc() {
        return dtNasc;
    }

    public void setDtNasc(Date dtNasc) {
        this.dtNasc = dtNasc;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getCep() {
        return cep;
    }

    public void setCep(int cep) {
        this.cep = cep;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
  
  
}
