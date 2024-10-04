<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.example.crudapp.DBUtil" %>
<%@ page import="java.io.*" %>
<html>
<head>
    <title>Kullanıcı Düzenle</title>
</head>
<body>
<h2>Kullanıcı Düzenle</h2>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int id = Integer.parseInt(request.getParameter("id")); // ID'yi URL'den al

    // Kullanıcı bilgilerini al
    try {
        conn = DBUtil.getConnection();
        String sql = "SELECT * FROM Users WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
%>
            <form action="editUser.jsp?id=<%= id %>" method="post">
                <label>İsim:</label>
                <input type="text" name="name" value="<%= name %>" required>
                <label>Email:</label>
                <input type="email" name="email" value="<%= email %>" required>
                <input type="submit" value="Güncelle">
            </form>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }

    // Kullanıcı güncelleme işlemi
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    if (name != null && email != null) {
        try {
            conn = DBUtil.getConnection();
            String sql = "UPDATE Users SET name = ?, email = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setInt(3, id);
            pstmt.executeUpdate();
            response.sendRedirect("listUsers.jsp"); // Güncellemeden sonra listeye yönlendir
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>
<a href="listUsers.jsp">Geri Dön</a>
</body>
</html>
