package br.senac.sp.bd;

import java.sql.*;
/**
 *
 * @author Gustavo Moares
 */
public class Conexao {
    
    private String url;
    private String usuario;
    private String senha;
    private Connection con;
    
    public Conexao(){
        url = "jdbc:postgresql://localhost:5432/devspace";
        usuario ="postgres";
        senha = "postgre";
        
        try{
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, usuario, senha);
            System.out.println("Conexão realizada");
        }catch(Exception e){
            
        }
    }
}
