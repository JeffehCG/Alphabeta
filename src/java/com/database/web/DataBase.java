package com.database.web;
import java.sql.Connection;
import java.sql.DriverManager;

public class DataBase {
    private static Connection connection;
    private static Exception connectionException;
       
    public static Connection getConnection(){
       if(connection == null){
           try{
            Class.forName("com.mysql.jdbc.Driver");
               String url = "jdbc:mysql://localhost:333/alphabeta?zeroDateTimeBehavior=convertToNull";
               connection = DriverManager.getConnection(url,"root","1234");
               connectionException = null;
               System.out.println("CONEXAO EFETUADA COM SUCESSO");
           }catch(Exception ex){
               connection = null;
               connectionException = ex;
               System.out.println("CONEXAO NAO EFETUADA");
           }
       }
       return connection;
    }
    
    public static Exception getConnectionException(){
        return connectionException;
    }
}

