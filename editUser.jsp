<%@ page import="com.example.crudapp.User" %>
<html>
<body>
    <h2>Edit User</h2>
    <form action="user?action=update" method="post">
        <input type="hidden" name="id" value="<%= ((User)request.getAttribute("user")).getId() %>"/>
        Name: <input type="text" name="name" value="<%= ((User)request.getAttribute("user")).getName() %>"/><br/>
        Email: <input type="text" name="email" value="<%= ((User)request.getAttribute("user")).getEmail() %>"/><br/>
        <input type="submit" value="Update"/>
    </form>
</body>
</html>
