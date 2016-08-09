<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="js/jquery-3.1.0.js"></script>
    <script type="text/javascript" src="/js/main.js"></script>

</head>
<body>
<img src="images/loading.gif" id="hide_img">
<div id="content"></div>
<script type="text/javascript">
    function get_content() {
        $.ajax({
            url: "/index.jsp",
            /*type: "POST", data: {urlForParse: $(`paste`.val())},*/
            type: "POST", data: {parsedLinks: "<%= request.getAttribute("parsedLinks") %>"},
            success: function (data) {
                $('#hide_img').hide();
                $('#content').html(data);
            }
        });
    }
    setTimeout(get_content, 2000);
    get_content();
</script>
<h2>asd</h2>
</body>
</html>
