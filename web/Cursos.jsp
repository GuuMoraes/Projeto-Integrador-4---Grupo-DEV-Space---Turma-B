<%-- 
    Document   : Cursos
    Created on : 28 de fev de 2021, 21:30:41
    Author     : Gustavo Moraes
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="br.senac.sp.bd.ConexaoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Produtos</title>
    </head>
    <body>
        <%
            Statement st = null;
            ResultSet rs = null;

            int codigo;
            String nome;
            try {

                st = new ConexaoDB().conectar().createStatement();
                rs = st.executeQuery("SELECT * FROM CURSO");

                while (rs.next()) {
                    codigo = rs.getInt(1);
                    nome = rs.getString(2);
                    out.println(rs.getInt(1) + " " + rs.getString(2));
                }
            } catch (Exception e) {
            }
        %>
    </body>
</html>
