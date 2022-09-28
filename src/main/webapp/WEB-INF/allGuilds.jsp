<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="js/main.js"></script>
</head>
<body>

    <c:forEach var="guild" items="${guilds}">
        <div class="max-w-sm rounded overflow-hidden shadow-lg">

            <div class="px-6 py-4">
                <div class="font-bold text-xl mb-2">${guild.name}</div>
                <div>
                    <p>${guild.game}, ${guild.server}</p>
                </div>
            </div>

        </div>
    </c:forEach>

</body>
</html>
