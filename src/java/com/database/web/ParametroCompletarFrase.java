
package com.database.web;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.Part;

public class ParametroCompletarFrase{
    private int codParam ;
    private int codExer;
    private String frase;
    private byte[] img ;
    //Metodo para inserir parametro do exercicio
    public static void inserirParametro(int codPar ,int codExer, String frase, Part img)throws Exception{
//        System.out.println(img);
        InputStream inputStream = img.getInputStream();
        
        String SQL = "INSERT INTO prcompfrase VALUES(?,?,?,?)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,codPar);
        s.setInt(2,codExer);
        s.setString(3,frase);
        s.setBinaryStream(4, inputStream, (int) img.getSize());
        s.execute();
        s.close();
    }
    
    //Metodo para listar Parametros de determinado Exercicio
    public static ArrayList<ParametroCompletarFrase> listarParExer(int codExer) throws Exception{
        ArrayList<ParametroCompletarFrase> list = new ArrayList<>();
        
        Blob file = null;
        byte[ ] fileData = null ;
        
        String SQL = "SELECT * FROM prcompfrase WHERE cd_exercicio = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,codExer);
        ResultSet rs = s.executeQuery();
        while(rs.next()){
            file = rs.getBlob("ds_img");
            fileData = file.getBytes(1,(int)file.length());
            ParametroCompletarFrase par = new ParametroCompletarFrase(
                     rs.getInt("cd_parametro")
                    ,rs.getInt("cd_exercicio")
                    ,rs.getString("nm_texto")
                    ,fileData);
            list.add(par);
        }
        rs.close();
        s.close();
        return list;
    }
    public static ArrayList<ParametroCompletarFrase> listarParExerView(int codExer) throws Exception{
        ArrayList<ParametroCompletarFrase> list = new ArrayList<>();
        String SQL = "SELECT cd_parametro, cd_exercicio, nm_texto FROM prcompfrase WHERE cd_exercicio = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,codExer);
        ResultSet rs = s.executeQuery();
        while(rs.next()){
            ParametroCompletarFrase par = new ParametroCompletarFrase(
                     rs.getInt("cd_parametro")
                    ,rs.getInt("cd_exercicio")
                    ,rs.getString("nm_texto"));
            list.add(par);
        }
        rs.close();
        s.close();
        return list;
    }

    public ParametroCompletarFrase(int codParam, int codExer, String frase, byte[] img) {
        this.codParam = codParam;
        this.codExer = codExer;
        this.frase = frase;
        this.img = img;
    }
    
    public ParametroCompletarFrase(int codParam, int codExer, String frase) {
        this.codParam = codParam;
        this.codExer = codExer;
        this.frase = frase;
    }
    public int getCodParam() {
        return codParam;
    }

    public void setCodParam(int codParam) {
        this.codParam = codParam;
    }

    public int getCodExer() {
        return codExer;
    }

    public void setCodExer(int codExer) {
        this.codExer = codExer;
    }

    public String getFrase() {
        return frase;
    }

    public void setFrase(String frase) {
        this.frase = frase;
    }

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte[] img) {
        this.img = img;
    }
    
    
}
