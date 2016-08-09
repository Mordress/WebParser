<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
    <head>
        <title>WebParserApp</title>
        <link rel="stylesheet" type="text/css" href="css/index.css" media="all">
    </head>
    <c:if test="${invalidUrl}">
        <div id="errormsg">
            <label>Введен неправильный URL</label>
        </div>
    </c:if>
    <body>
        <div id="urlInput">
            <form action="Controller" method="post">
                <label for="paste">Анализируемая страница</label>
                <input type="url" name="urlForParse" id="paste" required>
                <div>
                    <input type="submit" value="Анализировать">
                </div>
            </form>
        </div>

        <div id="resultTable">
            <table>
                    <caption>Обнаруженные ссылки</caption>
                <tr>
                    <th class="col1">№ П/П</th>
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
        <div id="resultClear">
            <form action="Controller" method="post">
                <input type="submit" value="Очистить" name="reset">
            </form>
        </div>
    </body>
</html>

<script type="text/javascript" src="/js/main.js"></script>
