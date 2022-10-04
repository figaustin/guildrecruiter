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

    <div class="flex justify-center mt-24 mb-24">
        <div class="flex flex-col gap-4 justify-center">
            <p class="text-6xl text-center">${guild.name}</p>
            <p class="text-xl text-center">${guild.server}, ${guild.region}, ${guild.game}</p>
            <div class="flex items-center justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                </svg>
                <p>${guild.members}</p>
            </div>
            <p class="text-xl">Faction: ${guild.faction}</p>
            <p class="text-xl">Interest(s): ${guild.interest}</p>
            <hr>
            <p class="text-xl text-center">Details: </p>
            <p class="text-xl">${guild.description}</p>
        </div>
    </div>
<hr>
    <p class="flex justify-center mt-24 text-2xl font-semibold">Apply to ${guild.name}</p>
    <div class="flex justify-center mt-6 mb-12">
       <form:form action="/guild/${guild.id}" method="post" modelAttribute="guildApplication">
           <div class="flex flex-col">
                <form:label path="name" class="text-lg">Character Name:</form:label>
                <form:errors path="name"></form:errors>
                <form:input class="border border-black rounded" path="name" type="text"/>
                <form:label path="email" class="text-lg">Your email (for contact purposes):</form:label>
                <form:errors path="email"></form:errors>
                <form:input path="email" type="text" class="border border-black rounded"/>
                <form:label path="characterLevel" class="text-lg">Character Level: </form:label>
                <form:errors path="characterLevel"></form:errors>
                <form:input path="characterLevel" type="number" class="border border-black rounded"/>
                <form:label path="characterClass" class="text-lg">Character Class:</form:label>
                <form:errors path="characterClass"></form:errors>
                <form:input path="characterClass" class="border border-black rounded"/>
                <form:label path="itemLevel" class="text-lg">Character Item Level:</form:label>
                <form:errors path="itemLevel"></form:errors>
                <form:input path="itemLevel" type="number" class="border border-black rounded"/>
                <form:label path="message" class="text-lg">Message: </form:label>
                <form:errors path="message"></form:errors>
                <form:textarea path="message"  class="border border-black rounded"></form:textarea>
                <form:hidden path="guild" value="${guild.id}"/>
                <input type="submit" value="Apply" class="border border-black rounded mt-4 bg-zinc-400">
           </div>
        </form:form>
    </div>


</body>
</html>
