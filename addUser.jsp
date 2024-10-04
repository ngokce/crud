<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.example.crudapp.DBUtil" %>
<html>
<head>
    <title>Kullanıcı Ekle</title>
</head>
<body>
<h2>Kullanıcı Ekle</h2>
<%
    // Kullanıcı ekleme işlemi
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    if (name != null && email != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection(); // DBUtil sınıfından bağlantıyı al
            String sql = "INSERT INTO Users (name, email) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.executeUpdate();
            response.sendRedirect("listUsers.jsp"); // Kullanıcı ekledikten sonra listeye yönlendir
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>
<form action="addUser.jsp" method="post">
    <label>İsim:</label>
    <input type="text" name="name" required>
    <label>Email:</label>
    <input type="email" name="email" required>
    <input type="submit" value="Ekle">
</form>
<a href="listUsers.jsp">Geri Dön</a>
</body>
</html>
