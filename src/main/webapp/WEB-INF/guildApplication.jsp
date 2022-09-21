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
    <h1>Apply to ${guild.name}</h1>

    <form:form action="/guild/apply/${guild.id}" method="post" modelAttribute="guildApplication">
        <form:label path="name">Character Name:</form:label>
        <form:input path="name" type="text"/>
        <form:label path="email">Your email (for contact purposes):</form:label>
        <form:input path="email" type="text"/>
        <form:label path="characterLevel">Character Level: </form:label>
        <form:input path="characterLevel" type="number"/>
        <form:label path="characterClass">Character Class:</form:label>
        <form:input path="characterClass"/>
        <form:label path="itemLevel">Character Item Level:</form:label>
        <form:input path="itemLevel" type="number"/>
        <form:label path="message">Message: </form:label>
        <form:textarea path="message"></form:textarea>
        <form:hidden path="guild" value="${guild.id}"/>
        <input type="submit" value="Apply">
    </form:form>
</body>
</html>