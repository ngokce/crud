- Proje Yapısı:
/CRUDApp
    /src
        /com/example/crudapp
            DBUtil.java
            User.java
            UserServlet.java
    /web
        /WEB-INF
            web.xml
        /views
            listUsers.jsp
            addUser.jsp
            editUser.jsp
- Terminalde WAR dosyası oluştur:
jar -cvf CRUDApp.war *
- Tomcat deploy ve MSSQL bağlantısı:
scp CRUDApp.war username@remote_server:/path/to/tomcat/webapps/
- MSSQL JDBCyi Tomcat lib dizinine yükle:
scp mssql-jdbc-x.x.x.jre8.jar username@remote_server:/path/to/tomcat/lib/
- Tarayıcıda test:
http://<ip>:8080/CRUDApp/
