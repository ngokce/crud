<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, com.example.crudapp.DBUtil" %>
<html>
<head>
    <title>Kullanıcı Listesi</title>
</head>
<body>
<h2>Kullanıcı Listesi</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>İsim</th>
        <th>Email</th>
    </tr>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection(); // DBUtil sınıfından bağlantıyı al
            stmt = conn.createStatement();
            String sql = "SELECT * FROM Users"; // Kullanıcılar tablosunu seç
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
    %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
</table>
<a href="addUser.jsp">Kullanıcı Ekle</a>
</body>
</html>
