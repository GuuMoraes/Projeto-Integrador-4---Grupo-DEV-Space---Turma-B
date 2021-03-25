<%@page import="br.senac.sp.utils.Upload" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="br.senac.sp.bd.ConexaoDB"%>



<%
    Statement st = null;
    ResultSet rs = null;

    String imagem = null;

    String idCurso = null;
    String principal = "0";
    int linhas = 0;

    Upload up = new Upload();
    up.setFolderUpload("Imagens");

    if (up.formProcess(getServletContext(), request)) {

        try {
            imagem = up.getFiles().get(0).toString();

            st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = st.executeQuery("SELECT * FROM curso order by codCurso desc limit 1");
            while (rs.next()) {
                idCurso = rs.getString(1);
            }
            rs = st.executeQuery("SELECT * FROM imagens where curso_codCurso = '" + idCurso + "'");
            while (rs.next()) {
                linhas = rs.getRow();
            }
            if (linhas == 0) {
                st.executeUpdate("insert into imagens (caminho, curso_codCurso, principal) "
                        + "VALUES('" + imagem + "', '" + idCurso + "', '" + 1 + "')");
            } else {
                st.executeUpdate("insert into imagens (caminho, curso_codCurso, principal) "
                        + "VALUES('" + imagem + "', '" + idCurso + "', '" + principal + "')");
            }

        } catch (Exception e) {

        }

    }

%>