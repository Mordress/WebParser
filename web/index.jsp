<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
    <head>
        <title>WebParserApp</title>
    </head>
    <c:if test="${er}">
        <label>Введен неправильный URL</label>
    </c:if>
    <body>
        <div id="urlInput">
            <form action="Controller" method="post">
                <label for="paste">Анализируемая страница</label>
                <br>
                <input type="url" name="urlForParse" id="paste">
                <br>
                <input type="submit" value="Анализировать">
            </form>
        </div>

        <div id="resultTable">
            <table border="1">
                <caption>Обнаруженные ссылки</caption>
                <%--<script>alert("!")</script>--%>
                <tr>
                    <th>№ П/П</th>
                    <th>Имя ссылки</th>
                    <th>Адрес ссылки</th>
                </tr>
                <c:if test="${not empty parsedLinks}">
                    <c:forEach items="${parsedLinks}" var="link" varStatus="linkCounter">
                        <tr>
                            <td>
                                ${linkCounter.count}
                            </td>
                            <td>
                                ${link.key}</td>
                            <td>
                                <a href="${link.value}"/>${link.value}
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

        </div>
        <br>
        <div id="resultClear">
            <form action="Controller" method="post">
                <input type="submit" value="Сбросить" name="reset">
            </form>
        </div>
    </body>
</html>
<script type="text/javascript" src="/js/main.js"></script>