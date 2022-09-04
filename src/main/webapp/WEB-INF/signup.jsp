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
    <h1>Sign Up</h1>
    <form:form action="/signup" method="post" modelAttribute="userRegister">
        <form:label path="name">Username</form:label>
        <form:input path="name" type="text"/>
        <form:label path="email">Email</form:label>
        <form:input path="email" type="text"/>
        <form:label path="password">Password</form:label>
        <form:input path="password" type="password"/>
        <form:label path="confirm">Confirm Password</form:label>
        <form:input path="confirm" type="password"/>
        <input type="submit" value="Sign Up">
    </form:form>
</body>
</html>