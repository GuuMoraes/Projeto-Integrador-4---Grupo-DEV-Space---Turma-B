<%@page import="java.security.MessageDigest"%>
<%@page import="br.senac.sp.utils.Upload" %>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="br.senac.sp.bd.ConexaoDB"%>

<%

    Statement st = null;
    ResultSet rs = null;

    String nome = null;
    String email = null;
    String status = null;
    String tipo = null;
    String senha = null;
    String imagem = null;

    String id = null;

    Upload up = new Upload();
    up.setFolderUpload("fotos");

    if (up.formProcess(getServletContext(), request)) {

        try {
            nome = up.getForm().get("txtNome").toString();
            email = up.getForm().get("txtEmail").toString();
            status = up.getForm().get("txtstatus").toString();
            tipo = up.getForm().get("txtTipo").toString();
            senha = up.getForm().get("txtSenha").toString();
            id = up.getForm().get("txtid").toString();
            imagem = up.getFiles().get(0).toString();

        } catch (Exception e) {
            imagem = "semfoto.png";
        }

        try {

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte messageDigest[] = md.digest(senha.getBytes("UTF-8"));

            StringBuilder sb = new StringBuilder();
            String senhaHex = "";
            for (byte b : messageDigest) {
                sb.append(String.format("%02X", 0xff & b));

            }
            senhaHex = sb.toString();
            st = ConexaoDB.conectar().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = st.executeQuery("SELECT * FROM usuario where email = '" + email + "'");

            if (id.equals("")) {
                while (rs.next()) {
                    rs.getRow();
                    if (rs.getRow() > 0) {
                        out.print("E-mail Já Cadastrado!");
                        return;
                    }
                }
            }

            if (id.equals("")) {
                st.executeUpdate("insert into usuario (nome, email, senha, estado, tipo, caminhoImg) "
                        + "VALUES('" + nome + "', '" + email + "', '" + senhaHex + "', '" + status + "', '" + tipo + "', '" + imagem + "')");
                out.print("Cadastrado Realizado com Sucesso!!");
            }

        } catch (Exception e) {

        }
    }


%>