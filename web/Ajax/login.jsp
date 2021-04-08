<%@page import="java.security.MessageDigest"%>
<%@page import="br.senac.sp.utils.Upload" %>
<%@page import="br.senac.sp.bd.ConexaoDB"%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>     

<%

    Statement st = null;
    ResultSet rs = null;

    String usuario = "";
    String senha = "";
    String nomeUsuario = "";
    String tipo = "";
    

    int i = 0;

    Upload up = new Upload();
    if (up.formProcess(getServletContext(), request)) {
        try {
            usuario = up.getForm().get("txtEmail").toString();
            senha = up.getForm().get("txtSenha").toString();
            
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte messageDigest[] = md.digest(senha.getBytes("UTF-8"));

            StringBuilder sb = new StringBuilder();
            String senhaHex = "";
            for (byte b : messageDigest) {
                sb.append(String.format("%02X", 0xff & b));

            }
            senhaHex = sb.toString();
            
            st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = st.executeQuery("SELECT * FROM usuario where email = '" + usuario + "' and senha = '" + senhaHex + "' and estado = 'Ativo'");
            while (rs.next()) {
                nomeUsuario = rs.getString(2);
                tipo = rs.getString(6);
                rs.last();
                i = rs.getRow();
            }
        } catch (Exception e) {
            out.print(e);
        }

        if (usuario == null || senha == null) {
            out.println("Preencha os Dados");
        } else {

            if (i > 0) {
                session.setAttribute("nomeUsuario", nomeUsuario);
                session.setAttribute("tipo", tipo);
                out.println("Sucesso!!"); 
            } else {
                out.println("Dados Incorretos");
            }
        }
    }
%>
