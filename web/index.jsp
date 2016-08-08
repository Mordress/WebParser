<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
    <head>
        <title>WebParserApp</title>
    </head>
    <body>
        <div id="urlInput">
            <form action="Controller" method="post">
                <label for="paste">Анализируемая страница</label>
                <br>
                <input type="text" name="urlForParse" id="paste">
                <br>
                <input type="submit" value="Анализировать">
            </form>
        </div>

        <div id="resultTable">
            <table border="1">
                <caption>Обнаруженные ссылки</caption>
                <tr>
                    <th>№ П/П</th>
                    <th>Имя ссылки</th>
                    <th>Адрес ссылки</th>
                </tr>
                <c:if test="${not empty parsedLinks}">
                    <c:forEach items="${parsedLinks}" var="link" varStatus="linkCo">
                        <tr>
                            <td>
                                ${linkCo.count}
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
            <input type="button" value="Сбросить">
        </div>
    </body>
</html>
