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
    <title>GuildRecruiter</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<nav class="bg-zinc-900 border-white px-2 sm:px-4 py-2.5 dark:bg-zinc-900">
    <div class="container flex flex-wrap items-center mx-auto">
        <a href="/" class="flex items-center mr-24">
            <span class="self-center text-3xl font-semibold whitespace-nowrap dark:text-white">GuildRecruiter</span>
        </a>
        <div class="hidden w-full md:block md:w-auto" id="navbar-default">
            <ul class="flex flex-col p-4 mt-4 text-lg md:flex-row md:mt-0 md:font-medium">
                <li>
                    <a href="/guild/list" class="block py-2 pr-4 pl-3 text-white hover:text-gray-400" aria-current="page">Guilds</a>
                </li>
            </ul>
        </div>
        <c:choose>
            <c:when test="${user != null}">
                <div class="w-full md:block md:w-auto">
                    <ul class="flex flex-col p-4 mt-4 text-lg md:flex-row md:mt-0 md:font-medium">
                        <li>
                            <a href="/user/${user.id}" class="block py-2 pr-4 pl-3 text-white hover:text-gray-400 ">My Guilds</a>
                        </li>
                        <li>
                            <a href="/logout" class="block py-2 pr-4 pl-3 text-white hover:text-gray-400 ">Logout</a>
                        </li>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <div class="w-full md:block md:w-auto">
                    <ul class="flex flex-col p-4 mt-4 text-lg md:flex-row md:mt-0 md:font-medium">
                        <li>
                            <a href="/signup" class="block py-2 pr-4 pl-3 text-white hover:text-gray-400 ">Sign Up</a>
                        </li>
                        <li>
                            <a href="/login" class="block py-2 pr-4 pl-3 text-white hover:text-gray-400 ">Log In</a>
                        </li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</nav>
<p class="flex justify-center text-3xl mt-24 font-semibold">Sign Up</p>
<div class="flex justify-center items-center mt-6">
    <form:form action="/signup" method="post" modelAttribute="userRegister">
        <div class="flex flex-col">
            <form:label path="name" class="text-lg">Username</form:label>
            <form:input path="name" type="text" class="border border-black rounded"/>
            <form:label path="email" class="text-lg">Email</form:label>
            <form:input path="email" type="text" class="border border-black rounded"/>
            <form:label path="password" class="text-lg">Password</form:label>
            <form:input path="password" type="password" class="border border-black rounded"/>
            <form:label path="password" class="text-lg">Confirm Password</form:label>
            <form:input path="confirm" type="password" class="border border-black rounded"/>
            <input type="submit" value="Sign Up" class="border border-black rounded mt-4 bg-zinc-400">
        </div>
    </form:form>
</div>
</body>
</html>