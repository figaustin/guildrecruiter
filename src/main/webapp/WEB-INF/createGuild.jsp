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
    <title>Title</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <h1>Create Your Recruiting Post</h1>

    <form:form action="/guild/create" method="post" modelAttribute="guild">
        <form:label path="name">Guild Name:</form:label>
        <form:input path="name" type="text"/>
        <form:label path="game">Game:</form:label>
        <form:input path="game" type="text"/>
        <form:label path="server">Server:</form:label>
        <form:input path="server" type="text"/>
        <form:label path="region">Region:</form:label>
        <form:input path="region" type="text"/>
        <form:label path="faction">Faction:</form:label>
        <form:input path="faction" type="text"/>
        <form:label path="members">Amount of Members:</form:label>
        <form:input path="members" type="number"/>
        <form:label path="mindset">Mindset: </form:label>
        <form:input path="mindset" type="text"/>
        <form:label path="interest">Interest(s):</form:label>
        <form:input path="interest" type="text"/>
        <form:label path="language">Language:</form:label>
        <form:input path="language" type="text"/>
        <form:label path="description">Description:</form:label>
        <form:textarea path="description"/>
        <input type="submit" value="Create Post">
    </form:form>
</body>
</html>