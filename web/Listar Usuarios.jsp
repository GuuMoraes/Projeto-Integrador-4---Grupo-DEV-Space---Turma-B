<%-- 
    Document   : Listar Usuarios
    Created on : 03/04/2021, 15:45:58
    Author     : Gustavo Moraes
--%>

<%@page import="java.security.MessageDigest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.senac.sp.utils.Upload"%>
<%@page import="br.senac.sp.bd.ConexaoDB"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link href="CSS/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
        <link href="CSS/navBar.css" rel="stylesheet">
        <link href="CSS/table.css" rel="stylesheet">
        <link href="CSS/Cadastro.css" rel="stylesheet"> 
        <title>Listar Usuarios</title>   
    </head>
    <body>

        <%
            Statement st = null;
            ResultSet rs = null;

            String nomeUsuario = (String) session.getAttribute("nomeUsuario");
            String tipo = (String) session.getAttribute("tipo");

            if (nomeUsuario == null) {%>
        <meta http-equiv="refresh" content="0; URL='http://localhost:8080/Projeto-PI4-DevSpace/Login.jsp'"/>
        <%}
        %> 

        <div id="flipkart-navbar">
            <div class="container">
                <div class="row row2" id="nav">
                    <div class="col-sm-2">                    
                        <div id="logo" style="padding-left: 70Px"">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="147" height="68.399" viewBox="0 0 147 68.399">
                            <defs>
                            <pattern id="pattern" preserveAspectRatio="none" width="100%" height="100%" viewBox="0 0 168 313">
                                <image width="168" height="313" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKgAAAE5CAYAAAAEBmvmAAABN2lDQ1BBZG9iZSBSR0IgKDE5OTgpAAAokZWPv0rDUBSHvxtFxaFWCOLgcCdRUGzVwYxJW4ogWKtDkq1JQ5ViEm6uf/oQjm4dXNx9AidHwUHxCXwDxamDQ4QMBYvf9J3fORzOAaNi152GUYbzWKt205Gu58vZF2aYAoBOmKV2q3UAECdxxBjf7wiA10277jTG+38yH6ZKAyNguxtlIYgK0L/SqQYxBMygn2oQD4CpTto1EE9AqZf7G1AKcv8ASsr1fBBfgNlzPR+MOcAMcl8BTB1da4Bakg7UWe9Uy6plWdLuJkEkjweZjs4zuR+HiUoT1dFRF8jvA2AxH2w3HblWtay99X/+PRHX82Vun0cIQCw9F1lBeKEuf1UYO5PrYsdwGQ7vYXpUZLs3cLcBC7dFtlqF8hY8Dn8AwMZP/fNTP8gAAAAJcEhZcwAADiYAAA4mAaLvJfwAAAa9aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA2LjAtYzAwMiA3OS4xNjQ0NjAsIDIwMjAvMDUvMTItMTY6MDQ6MTcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9IkFkb2JlIFJHQiAoMTk5OCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6YTBlNjEzMDctYjMyYi01NzQ1LTlhN2MtYWYzMDkxYzUxNDhkIiB4bXBNTTpEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6MmE3MTBjNTktNzk0ZC05YjRhLWJkOTAtN2VhYmNlMDc2NjEwIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6YTI2M2QyYTQtNmIzZC1iYjQ5LTgwYjEtZjgwMjFkYjgwODk2Ij4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDphMjYzZDJhNC02YjNkLWJiNDktODBiMS1mODAyMWRiODA4OTYiIHN0RXZ0OndoZW49IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjZkMjQ4ZGMtMTMxYi1lMTRiLWExNmUtMTRmOWY5NDdhZGU2IiBzdEV2dDp3aGVuPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHN0RXZ0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"/>
                            </pattern>
                            <pattern id="pattern-2" width="1" height="1" patternTransform="matrix(-1, 0, 0, 1, 38, 0)" viewBox="0 0 19 35.399">
                                <image preserveAspectRatio="none" width="19" height="35.399" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKgAAAE5CAYAAAAEBmvmAAABN2lDQ1BBZG9iZSBSR0IgKDE5OTgpAAAokZWPv0rDUBSHvxtFxaFWCOLgcCdRUGzVwYxJW4ogWKtDkq1JQ5ViEm6uf/oQjm4dXNx9AidHwUHxCXwDxamDQ4QMBYvf9J3fORzOAaNi152GUYbzWKt205Gu58vZF2aYAoBOmKV2q3UAECdxxBjf7wiA10277jTG+38yH6ZKAyNguxtlIYgK0L/SqQYxBMygn2oQD4CpTto1EE9AqZf7G1AKcv8ASsr1fBBfgNlzPR+MOcAMcl8BTB1da4Bakg7UWe9Uy6plWdLuJkEkjweZjs4zuR+HiUoT1dFRF8jvA2AxH2w3HblWtay99X/+PRHX82Vun0cIQCw9F1lBeKEuf1UYO5PrYsdwGQ7vYXpUZLs3cLcBC7dFtlqF8hY8Dn8AwMZP/fNTP8gAAAAJcEhZcwAADiYAAA4mAaLvJfwAAAa9aVRYdFhNTDpjb20uYWRvYmUueG1wAAAAAAA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA2LjAtYzAwMiA3OS4xNjQ0NjAsIDIwMjAvMDUvMTItMTY6MDQ6MTcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIgeG1wOkNyZWF0ZURhdGU9IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHhtcDpNb2RpZnlEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBkYzpmb3JtYXQ9ImltYWdlL3BuZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgcGhvdG9zaG9wOklDQ1Byb2ZpbGU9IkFkb2JlIFJHQiAoMTk5OCkiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6YTBlNjEzMDctYjMyYi01NzQ1LTlhN2MtYWYzMDkxYzUxNDhkIiB4bXBNTTpEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6MmE3MTBjNTktNzk0ZC05YjRhLWJkOTAtN2VhYmNlMDc2NjEwIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6YTI2M2QyYTQtNmIzZC1iYjQ5LTgwYjEtZjgwMjFkYjgwODk2Ij4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDphMjYzZDJhNC02YjNkLWJiNDktODBiMS1mODAyMWRiODA4OTYiIHN0RXZ0OndoZW49IjIwMjAtMTEtMDlUMjA6NTE6NDctMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4yIChXaW5kb3dzKSIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjZkMjQ4ZGMtMTMxYi1lMTRiLWExNmUtMTRmOWY5NDdhZGU2IiBzdEV2dDp3aGVuPSIyMDIwLTExLTA5VDIwOjU2OjM5LTAzOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjEuMiAoV2luZG93cykiIHN0RXZ0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"/>
                            </pattern>
                            </defs>
                            <g id="Grupo_9" data-name="Grupo 9" transform="translate(-110 -36)">
                            <text id="DEV_space" data-name="DEV
                                  space" transform="translate(132 40)" fill="#fff" font-size="25" font-family="ArialMT, Arial"><tspan x="0" y="23">DEV</tspan><tspan fill="#504f4f"><tspan x="0" y="52" xml:space="preserve">     </tspan><tspan y="52" fill="#005038" font-family="Arial-ItalicMT, Arial" font-style="italic">space</tspan></tspan></text>
                            <rect id="codificacao-html2" width="19" height="35" transform="translate(110 36)" fill="url(#pattern)"/>
                            <rect id="codificacao-html2-2" data-name="codificacao-html2" width="19" height="35.399" transform="translate(238 69)" fill="url(#pattern-2)"/>
                            </g>
                            </svg>
                        </div>
                    </div>
                    <div class="col-sm-10" style="text-align: end; margin-top: 10px" >
                        <a type="button" class="btn btn-secondary" style="color: #000; background-color: #00A172" href="Ajax/logout.jsp">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"></path>
                            <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"></path>
                            </svg>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="Gerenciar.jsp">Home</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        <a class="nav-link active" aria-current="page" href="Listar%20Cursos.jsp">Cursos</a>
                        <a class="nav-link active" href="Listar Usuarios.jsp">Usuários</a>
                        <a class="nav-link" href="#"></a>        
                    </div>
                </div>
            </div>
        </nav>
        <div id="pesquisa" class="container-fluid" style="position: absolute; width: 400px; margin-left: 160px; margin-bottom: -55px">
            <form class="d-flex" method="post">
                <input class="form-control me-2" type="search" placeholder="Buscar por Nome do Usuário" aria-label="Search" name="txtBuscar">
                <button type="submit" class="btn btn-outline-success" name="btnBuscar" id="add" >Buscar</button>
            </form>
        </div>
        <table class="table "   style="position: relative; margin-left: auto; margin-right: auto;margin-top: 70px; text-align: center; vertical-align: middle" method="post">
            <%
                if (tipo.equals("Administrador")) {%>
            <a href="Listar Usuarios.jsp?funcao=novo" type="button" class="btn btn-outline-success" id="add"  style="position: absolute; margin-left: 990px" ><b>+</b> Cadastrar Novo Usuário</a>
            <%}

            %>
            <thead>
                <tr>
                    <th scope="col" class="text-center">#ID</th>
                    <th scope="col" class="text-center">Foto</th>
                    <th scope="col" class="text-center">Nome do Usuário</th>
                    <th scope="col" class="text-center">Tipo</th>
                    <th scope="col" class="text-center">Status</th>              
                    <th></th>
                        <%                        if (tipo.equals("Administrador")) {%>
                    <th scope="col" class="text-center">Ação<th>
                        <%}
                        %>


                </tr>
            </thead>
            <tbody>
                <%                    try {
                        st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                        if (request.getParameter("btnBuscar") != null) {
                            String busca = '%' + request.getParameter("txtBuscar") + '%';
                            rs = st.executeQuery("SELECT * FROM usuario where nome LIKE '" + busca + "'");
                        } else {
                            rs = st.executeQuery("SELECT * FROM usuario limit 10");
                        }

                        while (rs.next()) {%>
                <tr style="vertical-align: middle">
                    <td style="vertical-align: middle"><%= rs.getInt(1)%></td>
                    <td><img src="fotos/<%= rs.getString(7)%>"  width="50" height="50"></td>
                    <td style="vertical-align: middle"><%= rs.getString(2)%></td>
                    <td style="vertical-align: middle"><%= rs.getString(6)%></td>
                    <td style="vertical-align: middle"><%= rs.getString(5)%></td>
                    <td></td>
                    <%
                        if (tipo.equals("Administrador")) {%>

                    <td style="vertical-align: middle" class="text-center">
                        <a href="Listar Usuarios.jsp?funcao=editar&id=<%= rs.getString(1)%>" class='btn btn-info btn-xs'><span class="glyphicon glyphicon-edit"></span> Editar</a> 
                        <a class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Deletar</a>
                        <a href="Visualizar Curso.jsp?id=<%= rs.getString(1)%>" id="bntVer" class="btn btn-success btn-xs" style="background-color: #198754"><span class="glyphicon glyphicon-eye-open" ></span> Ver</a> 
                        <a href="Listar Usuarios.jsp?funcao=on-off&id=<%= rs.getString(1)%>" class='btn btn-light btn-xs'><span class="glyphicon glyphicon-retweet"></span> On/Off</a> 
                    </td>
                    <%}

                    %>
                </tr>
                <% }

                    } catch (Exception e) {
                        out.print(e);
                    }

                %>
            </tbody>          
        </table>
    </div>
    <div id="bntFinal" class="container-fluid" style="display: flex; flex-direction: row; justify-content: center; align-items: center">
        <button type="button" class="btn btn-success" style="background-color: #198754; border-color: #198754;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"></path>
            </svg>
        </button>
        <button type="button" class="btn btn-success" style="background-color: #198754; border-color: #198754; margin: 1%">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-square-fill" viewBox="0 0 16 16">
            <path d="M16 14a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12zm-4.5-6.5H5.707l2.147-2.146a.5.5 0 1 0-.708-.708l-3 3a.5.5 0 0 0 0 .708l3 3a.5.5 0 0 0 .708-.708L5.707 8.5H11.5a.5.5 0 0 0 0-1z"></path>
            </svg>
            Anterior
        </button>
        <button type="button" class="btn btn-success" style="background-color: #198754; border-color: #198754; margin: 1%">
            Próximo
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square-fill" viewBox="0 0 16 16">
            <path d="M0 14a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v12zm4.5-6.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5a.5.5 0 0 1 0-1z"></path>
            </svg>     
        </button>
        <button type="button" class="btn btn-success" style="background-color: #198754; border-color: #198754;">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-right-square" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm4.5 5.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"></path>
            </svg>
        </button>
    </div>
</body>
</html>

<div class="modal" id="Modal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" >
        <div class="modal-content">
            <div class="modal-body">
                <div style="display: flex; flex-direction: row; justify-content: center; align-items: center">
                    <%                        String n = "forme";

                        if (request.getParameter(
                                "funcao") != null && request.getParameter("funcao").equals("editar") || request.getParameter("funcao") != null && request.getParameter("funcao").equals("on-off")) {
                            n = "form";
                        }
                    %>
                    <form id="<%= n%>" class="form-horizontal" style="width: 1000px;" method="post">
                        <fieldset>
                            <%  String titulo = "";
                                String btn = "";
                                String Eid = "";
                                String Enome = "";
                                String Email = "";
                                String Esenha = "";
                                String Estatus = "Ativo";
                                String Etipo = "Administrador";
                                String Eimg = "";
                                String off = "";
                                String off2 = "";
                                String cami = "";

                                if (request.getParameter(
                                        "funcao") != null && request.getParameter("funcao").equals("editar") || request.getParameter("funcao") != null && request.getParameter("funcao").equals("on-off")) {
                                    titulo = "Editar Usuário";
                                    btn = "Editar";
                                    Eid = request.getParameter("id");
                                    off2 = "disabled=\" \"";

                                    try {
                                        st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                                        rs = st.executeQuery("SELECT * FROM usuario where codusuario = '" + Eid + "' ");
                                        while (rs.next()) {
                                            Enome = rs.getString(2);
                                            Email = rs.getString(3);
                                            Esenha = rs.getString(4);
                                            Estatus = rs.getString(5);
                                            Etipo = rs.getString(6);
                                            Eimg = rs.getString(7);
                                        }
                                    } catch (Exception e) {
                                        out.print(e);
                                    }
                                    if (request.getParameter("funcao").equals("on-off")) {
                                        if (Estatus.equals("Ativo")) {
                                            titulo = "Inativar Usuário";
                                        } else {
                                            titulo = "Ativar Usuário";
                                        }
                                        off2 = " ";
                                        off = "disabled=\" \"";
                                        btn = "Ativar/Inativar";

                                    }

                                    cami = "src=\"fotos/" + Eimg + "\" ";

                                } else {
                                    titulo = "Cadastrar Usuário";
                                    btn = "Cadastrar";

                                }


                            %>
                            <div class="panel panel-primary">
                                <div class="panel-heading"><%=titulo%></div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <div class="col-md-11 control-label">
                                            <p class="help-block"><h11>*</h11> Campo Obrigatório </p>
                                        </div>
                                    </div>
                                    <input value="<%= Eid%>" type="hidden" id="txtid" name="txtid" >
                                    <div class="form-group mb-11 xl">
                                        <label class="col-md-2 control-label" for="img">Adicionar Foto</label>
                                        <div class="col-md-6">
                                            <div class="col-md-6 mb-2" style="margin-left: 215px">
                                                <img <%= cami%> id="target" width="130" height="130">
                                            </div>
                                            <div class="input-group col-md-6">
                                                <input <%=off%> <%=off2%> type="file" class="form-control" id="inputGroupFile02" id="imagem" name="imagem[]" onchange="uploadImagem();">
                                            </div>          
                                        </div>
                                    </div>  
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="Nome">Nome do Usuário <h11>*</h11></label>  
                                        <div class="col-md-8">
                                            <input <%=off%> value="<%=Enome%>" id="Nome" name="txtNome" placeholder="Nome do Usuário" class="form-control input-md" required="" type="text" minlength="5" maxlength="280">
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="Email">E-mail <h11>*</h11></label>  
                                        <div class="col-md-8">
                                            <input <%=off%>  <%= off2%> value="<%=Email%>" id="Email" name="txtEmail" placeholder="E-mail" class="form-control input-md" required="" type="text" minlength="5" maxlength="300"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        </div>
                                    </div> 

                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="Status">Status <h11>*</h11></label>
                                        <div class="col-md-2">
                                            <select <%= off2%>   required="" class="form-select form-select-lg mb-3" aria-label="Selecione" name="txtstatus">
                                                <option  value="<%=Estatus%>"><%=Estatus%></option>
                                                <%

                                                    if (!Estatus.equals(
                                                            "Ativo")) {
                                                        out.print(" <option>Ativo</option>");
                                                    } else if (!Estatus.equals(
                                                            "Inativo")) {
                                                        out.print(" <option>Inativo</option>");
                                                    }


                                                %>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="tipo">Tipo <h11>*</h11></label>
                                        <div class="col-md-2">
                                            <select <%=off%> required="" class="form-select form-select-lg mb-3" aria-label="Selecione" name="txtTipo">
                                                <option  value="<%=Etipo%>"><%=Etipo%></option>
                                                <%

                                                    if (!Etipo.equals(
                                                            "Administrador")) {
                                                        out.print(" <option>Administrador</option>");
                                                    } else if (!Etipo.equals(
                                                            "Suporte")) {
                                                        out.print(" <option>Suporte</option>");
                                                    }


                                                %>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="Senha">Senha <h11>*</h11></label>  
                                        <div class="col-md-3">
                                            <input <%=off%> value="<%=Esenha%>" id="senha" name="txtSenha" placeholder="***************" class="form-control input-md" required="" type="password" minlength="3" maxlength="16">
                                        </div>

                                        <label class="col-md-2 control-label" for="Senha">Confirme a Senha <h11>*</h11></label>  
                                        <div class="col-md-3">
                                            <input <%=off%> value="<%=Esenha%>" id="senha2" name="txtSenha2" placeholder="***************" class="form-control input-md" required="" type="password" minlength="3" maxlength="16" onblur=validarSenha()>
                                        </div>
                                    </div> 
                                    <br>


                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="Cadastrar"></label>
                                        <div class="col-md-10">

                                            <button  id="Cadastrar" name="<%=btn%>" class="btn btn-success" type="submit" style="background-color: #198754; border-color: #198754;"><%=titulo%> </button>   
                                            <a id="Cancelar" name="Cancelar" class="btn btn-danger" href="Listar Usuarios.jsp">Cancelar</a>
                                        </div>
                                    </div>
                                </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%
    if (tipo.equals("Administrador")) {
        if (request.getParameter(
                "funcao") != null && request.getParameter("funcao").equals("novo")) {
            out.print("<script>$('#Modal').modal({backdrop: 'static', keyboard: false});</script>");
        }

        if (request.getParameter(
                "funcao") != null && request.getParameter("funcao").equals("editar")) {
            out.print("<script>$('#Modal').modal({backdrop: 'static', keyboard: false});</script>");
        }

        if (request.getParameter(
                "funcao") != null && request.getParameter("funcao").equals("on-off")) {
            out.print("<script>$('#Modal').modal({backdrop: 'static', keyboard: false});</script>");
        }
    }
%>

<script>
    function validarSenha() {
        NovaSenha = document.getElementById('senha').value;
        CNovaSenha = document.getElementById('senha2').value;
        if (NovaSenha != CNovaSenha) {
            alert("Senhas Diferentes!\npor favor digite novamente");
            return off = "disabled=\" \"";
        } else {

        }
    }
</script>
}
<%      if (request.getParameter(
            "Editar") != null) {

        String nome = request.getParameter("txtNome");
        String senha = request.getParameter("txtSenha");
        String tipo2 = request.getParameter("txtTipo");
        String id = request.getParameter("id");

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte messageDigest[] = md.digest(senha.getBytes("UTF-8"));

        StringBuilder sb = new StringBuilder();
        String senhaHex = "";
        for (byte b : messageDigest) {
            sb.append(String.format("%02X", 0xff & b));

        }
        senhaHex = sb.toString();

        try {
            st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            st.executeUpdate("UPDATE usuario SET nome = '" + nome + "', senha = '" + senhaHex + "', tipo = '" + tipo2 + "'  where codusuario = '" + id + "'");
%>
<meta http-equiv="refresh" content="0; URL='http://localhost:8080/Projeto-PI4-DevSpace/Listar Usuarios.jsp'"/>
<%        } catch (Exception e) {
            out.print(e);
        }

    }

%>
<%      if (request.getParameter(
            "Ativar/Inativar") != null) {

        String status = request.getParameter("txtstatus");
        String id = request.getParameter("id");

        try {
            st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            st.executeUpdate("UPDATE usuario SET estado = '" + status + "' where codusuario = '" + id + "'");
            out.print("<script>$('#Modal').modal('hide');</script>");
%>
<meta http-equiv="refresh" content="0; URL='http://localhost:8080/Projeto-PI4-DevSpace/Listar Usuarios.jsp'"/>
<%        } catch (Exception e) {
            out.print(e);
        }

    }

%>

<script src="JS/jquery-3.6.0.js"></script>

<script type="text/javascript">

    function uploadImagem() {
        var target = document.getElementById('target');
        var file = document.querySelector("input[type=file]").files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            target.src = reader.result;
        };

        if (file) {
            reader.readAsDataURL(file);


        } else {
            target.src = "";
        }
    }

</script>

<script type="text/javascript">
    $("#forme").submit(function () {
        event.preventDefault();
        var formData = new FormData(this);

        $.ajax({
            url: "Ajax/inserirUsuario.jsp",
            type: 'POST',
            data: formData,

            success: function (mensagem) {

                $('#mensagem').removeClass()
                if (mensagem.trim() == "Cadastrado Realizado com Sucesso!!") {
                    alert(mensagem);
                    window.location.href = "Listar Usuarios.jsp";
                } else if (mensagem.trim() == "Editado com Sucesso!!") {
                    alert(mensagem);
                    window.location.href = "Listar Usuarios.jsp";
                } else {
                    alert(mensagem);
                }

            },

            cache: false,
            contentType: false,
            processData: false,
            xhr: function () {
                var myXhr = $.ajaxSettings.xhr();
                if (myXhr.Upload) {
                    myXhr.Upload.addEventListener('progress', function () {
                    }, false);
                }
                return myXhr;
            }
        });
    });
</script>
