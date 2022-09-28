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
    <table>
        <tr>
            <th>Guild</th>
            <th>Game</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="guild" items="${user.guilds}">
            <tr>
                <td>${guild.name}</td>
                <td>${guild.game}</td>
                <td><a href="/guild/edit/${guild.id}">Edit</a>
                    <form action="/guild/delete/${guild.id}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
