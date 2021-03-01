<%-- 
    Document   : index
    Created on : 28 de fev de 2021, 18:19:43
    Author     : Gustavo Moraes
--%>



<%@page import="java.sql.Connection"%>
<%@page import="br.senac.sp.bd.ConexaoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <title>DEV Space</title>
    </head>
    <body>
        
        
        <%
            Connection conexao;
            conexao = ConexaoDB.abrirConexao();
            out.println(ConexaoDB.getStatusConexao());
        %>
    </body>
</html>
