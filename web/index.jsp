<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%! private int linksCounter = 0; %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <div id="userInputFormHeader">
      <form action="Controller" method="post">
          <label>Анализируемая страница</label>
          <br>
          <input type="text" name="urlForParse">
          <br>
          <input type="submit" value="Анализировать">
      </form>
  </div>

  <div id="userInputFormResultTable">
      <table border="1">
          <caption>Обнаруженные ссылки</caption>
          <tr>
              <th>№ П/П</th>
              <th>Имя ссылки</th>
              <th>Адрес ссылки</th>
          </tr>
          <c:if test="${not empty parsedLinks}">

              <c:forEach items="${parsedLinks}" var="link">
                  <tr>
                      <td>
                          <%= ++linksCounter %>
                      </td>
                          <td>${link.key}</td>
                          <td>
                             <a href="${link.value}"/>${link.value}
                          </td>
                  </tr>
              </c:forEach>
          </c:if>
      </table>

  </div>
  <br>
  <div id="userInputResultClear">
      <input type="button" value="Сбросить">
  </div>
  </body>
</html>