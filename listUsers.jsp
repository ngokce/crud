<%@ page import="com.example.crudapp.User" %>
<%@ page import="java.util.List" %>
<html>
<body>
    <h2>Users List</h2>
    <a href="user?action=new">Add New User</a>
    <table border="1">
        <tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>
        <%
            List<User> users = (List<User>) request.getAttribute("users");
            for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td>
                <a href="user?action=edit&id=<%= user.getId() %>">Edit</a>
                <a href="user?action=delete&id=<%= user.getId() %>">Delete</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
