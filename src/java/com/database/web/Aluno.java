package com.database.web;
import java.math.BigInteger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

public class Aluno {
    private String nome ;
    private String sobreNome;
    private String cpf;
    private String rua;
    private String bairro;
    private int numero;
    private String cidade;
    private String estado;
    private int cep;
    private String telefone;
    private String nomeResponsavel;
    private String cpfresponsavel;
    private String senha;
    
    //Metodo para inserir aluno
    public static void inserirAluno (String nome,String sobrenome,String cpf,String rua,String bairro, int numero, String cidade,String estado, int cep, String telefone, String nomeres,String cpfres,String senha) throws Exception{
        String SQL = "INSERT INTO aluno VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1,nome);
        s.setString(2,sobrenome);
        s.setString(3,cpf);
        s.setString(4,rua);
        s.setString(5, bairro);
        s.setInt(6,numero);
        s.setString(7,cidade);
        s.setString(8,estado);
        s.setInt(9, cep);
        s.setString(10,telefone);
        s.setString(11,nomeres);
        s.setString(12,cpfres);
        s.setString(13,senha);
        s.execute();
        s.close();
    }
    //Metodo para listar Alunos do banco 
    public static ArrayList<Aluno> getStayList() throws Exception{
        ArrayList<Aluno> list = new ArrayList<>();
        Statement s = DataBase.getConnection().createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM aluno");
        while(rs.next()){
            Aluno al = new Aluno(
                     rs.getString("nm_nome")
                    ,rs.getString("nm_sobrenome")
                    ,rs.getString("cd_cpf")
                    ,rs.getString("nm_endereco_rua")
                    ,rs.getString("nm_endereco_bairro")
                    ,rs.getInt("nm_endereco_num")
                    ,rs.getString("nm_cidade")
                    ,rs.getString("nm_estado")
                    ,rs.getInt("cd_cep")
                    ,rs.getString("cd_telefone")
                    ,rs.getString("nm_reponsavel")
                    ,rs.getString("cd_cpf_responsavel")
                    ,rs.getString("cd_senha"));
            list.add(al);
        }
        rs.close();
        s.close();
        return list;
    }
    
    //Metodo para pesquisar aluno atravez do cpf 
    public static Aluno PesquisarAlunoCpf(String cpf) throws Exception{
        Aluno aluno = null;
        String SQL = "SELECT * FROM aluno WHERE cd_cpf=?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, cpf);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            aluno = new Aluno(
                     rs.getString("nm_nome")
                    ,rs.getString("nm_sobrenome")
                    ,rs.getString("cd_cpf")
                    ,rs.getString("nm_endereco_rua")
                    ,rs.getString("nm_endereco_bairro")
                    ,rs.getInt("nm_endereco_num")
                    ,rs.getString("nm_cidade")
                    ,rs.getString("nm_estado")
                    ,rs.getInt("cd_cep")
                    ,rs.getString("cd_telefone")
                    ,rs.getString("nm_responsavel")
                    ,rs.getString("cd_cpf_responsavel")
                    ,rs.getString("cd_senha")   
            );
        }
        rs.close();
        s.close();
        return aluno;
    }
    
    //Metodo para excluir aluno
    public static void excluirAluno(String cpf)throws Exception{
        String SQL = "DELETE FROM aluno WHERE cd_cpf = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setString(1, cpf);
        s.execute();
        s.close();
    }

    //Metodo para alterar aluno
    public static void AlterarAluno (String nome,String sobrenome,String cpf,String rua,String bairro, int numero, String cidade,String estado, int cep, String telefone, String nomeres, String cpfres,String senha)throws Exception{
        String SQL = "UPDATE aluno SET nm_nome = ? , nm_sobrenome = ? , nm_endereco_rua = ? , nm_endereco_bairro = ? , nm_endereco_num = ? , nm_cidade = ? , nm_estado = ? , cd_cep = ? , cd_telefone = ? , nm_responsavel = ? , cd_cpf_responsavel = ? , cd_senha = ? WHERE cd_cpf = ? " ;
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
                    s.setString(10,nomeres);
                    s.setString(11,cpfres);
                    s.setString(12,senha);  
                    s.setString(13,cpf);
            
    }
    public Aluno(String nome, String sobreNome, String cpf, String rua, String bairro, int numero, String cidade, String estado, int cep, String telefone, String nomeResponsavel, String cpfresponsavel, String senha) {
        this.nome = nome;
        this.sobreNome = sobreNome;
        this.cpf = cpf;
        this.rua = rua;
        this.bairro = bairro;
        this.numero = numero;
        this.cidade = cidade;
        this.estado = estado;
        this.cep = cep;
        this.telefone = telefone;
        this.nomeResponsavel = nomeResponsavel;
        this.cpfresponsavel = cpfresponsavel;
        this.senha = senha;
    }
    
    

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobreNome() {
        return sobreNome;
    }

    public void setSobreNome(String sobreNome) {
        this.sobreNome = sobreNome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
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

    public String getNomeResponsavel() {
        return nomeResponsavel;
    }

    public void setNomeResponsavel(String nomeResponsavel) {
        this.nomeResponsavel = nomeResponsavel;
    }

    public String getCpfresponsavel() {
        return cpfresponsavel;
    }

    public void setCpfresponsavel(String cpfresponsavel) {
        this.cpfresponsavel = cpfresponsavel;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
