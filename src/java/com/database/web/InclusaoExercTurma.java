
package com.database.web;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

public class InclusaoExercTurma {
    private int codExer;
    private int codTurm;

    public static void inserirExercicio(int codExer, int cdTurma)throws Exception{
        String SQL = "INSERT INTO inclcompfrase VALUES(?,?)";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1,codExer);
        s.setInt(2,cdTurma);
        s.execute();
        s.close();
    }
    
    //Metodo para deletar vinculaçao exercicio
    public static void DeletarVincExercicio (int cdTurm, int cdExer)throws Exception{
        String SQL = "DELETE FROM inclcompfrase WHERE cd_turma = ? AND cd_exercicio = ? " ;
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
                    s.setInt(1,cdTurm);
                    s.setInt(2,cdExer);
                    s.execute();
                    s.close();
             
    }
    //Metodo para Pesquisar Vinculação exercicio
    public static InclusaoExercTurma PesquisarVincExer(int cdTurm, int cdExer) throws Exception{
        InclusaoExercTurma inclus = null;
        String SQL = "SELECT * FROM inclcompfrase WHERE cd_turma = ? AND cd_exercicio = ?";
        PreparedStatement s = DataBase.getConnection().prepareStatement(SQL);
        s.setInt(1, cdTurm);
        s.setInt(2,cdExer);
        ResultSet rs = s.executeQuery();
        if(rs.next()){
            inclus = new InclusaoExercTurma(
                     rs.getInt("cd_exercicio")
                    ,rs.getInt("cd_turma"));  
        }
        rs.close();
        s.close();
        return inclus;
    }
    
    public InclusaoExercTurma(int codExer, int codTurm) {
        this.codExer = codExer;
        this.codTurm = codTurm;
    }

    public int getCodExer() {
        return codExer;
    }

    public void setCodExer(int codExer) {
        this.codExer = codExer;
    }

    public int getCodTurm() {
        return codTurm;
    }

    public void setCodTurm(int codTurm) {
        this.codTurm = codTurm;
    }
    
    
}
