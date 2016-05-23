<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert operation</title>
        <script>
            function post_value()
            {
                self.close();
            }
        </script>
    </head>
    <body>
        
         <sql:setDataSource var="con" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/lockedfolder"
                           user="root" password="ganeshji"/>
        <sql:update dataSource="${con}" var="count">
            insert into passwords(fname,pwd,pQues,pans) values(?,?,?,?);
            <sql:param value="${param.fname}"/>
            <%--<sql:param value="${param.email}"/>--%>
            <sql:param value="${param.pwd}"/>
            <sql:param value="${param.pQues}"/>
            <sql:param value="${param.pans}"/>
           
        </sql:update>
           
          <center>  <c:if test="${count>=1}">
            <font size="15" color='blue'> Congratulations ! Password Set
            successfully.</font>
              </c:if> <br/>
              <button><a style="font-size: 20px;" href="lockPassword.jsp" onclick="post_value();">Go back for login</a></button>
          </center>
    
    </body>
</html>

