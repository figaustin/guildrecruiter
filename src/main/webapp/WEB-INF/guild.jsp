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

	<p>${guild.name}</p>
    <p>${guild.game}</p>
	<p>${guild.server}, ${guild.region}</p>
    <p>${guild.faction}</p>
    <p>Members: ${guild.members}</p>
    <p>${guild.mindset}, ${guild.interest}</p>
    <p>Language: ${guild.language}</p>
    <p>About us: ${guild.description}</p>
    <a href="/guild/apply/${guild.id}">Apply To Guild</a>

</body>
</html>
