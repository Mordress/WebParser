<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Internal server error</title>
        <link rel="stylesheet" type="text/css" href="../../css/errors.css" media="all">
    </head>
    <body>
        <div class="error-text">
            <h1>Что-то пошло не так, возможно вы неверно ввели URL (<%=request.getParameter("urlForParse")%>)</h1>
            <a href="../../index.jsp">Вернуться на главную</a>
        </div>
    </body>
</html>
