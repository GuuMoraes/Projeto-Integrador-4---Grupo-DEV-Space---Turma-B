package br.senac.sp.bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author Gustavo Moraes
 */
public class ConexaoDB {

    public static String STATUS = "Não conectado";
    public static String DRIVER = "com.mysql.cj.jdbc.Driver";

    public static String SERVER = "localhost";
    public static String DATABASE = "DEVSpace";

    public static String LOGIN = "root";
    public static String SENHA = "";

    public static String URL = "";

    public static Connection CONEXAO;


    public static Connection abrirConexao() throws ClassNotFoundException, SQLException {

        URL = "jdbc:mysql://" + SERVER + ":3306/" + DATABASE + "?useTimezone=true&serverTimezone=UTC&useSSL=false";

        if (CONEXAO == null) {
            try {

                Class.forName(DRIVER);
                CONEXAO = DriverManager.getConnection(URL, LOGIN, SENHA);

                if (CONEXAO != null) {
                    STATUS = "Conexão realizada com sucesso!";
                } else {
                    STATUS = "Não foi possivel realizar a conexão";
                }

            } catch (ClassNotFoundException e) {

                throw new ClassNotFoundException("O driver expecificado nao foi encontrado.");

            } catch (SQLException e) {

                throw new SQLException("Erro ao estabelecer a conexão! Verifique as informações e tente novamentes.");
            }

        } else {
            try {

                if (CONEXAO.isClosed()) {
                    CONEXAO = DriverManager.getConnection(URL, LOGIN, SENHA);
                }
            } catch (SQLException ex) {
                throw new SQLException("Falha ao fechar a conexão.");
            }
        }
        return CONEXAO;
    }

    public static String getStatusConexao() {
        return STATUS;
    }

    public static boolean fecharConexao() throws SQLException {

        boolean retorno = false;

        try {
            if (CONEXAO != null) {
                if (!CONEXAO.isClosed()) {
                    CONEXAO.close();
                }
            }

            STATUS = "Não conectado";
            retorno = true;

        } catch (SQLException e) {
            retorno = false;
        }

        return retorno;
    }

}

