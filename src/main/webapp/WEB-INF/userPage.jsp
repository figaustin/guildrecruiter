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
    <p class="flex justify-center text-3xl mt-24 font-semibold">${user.name}'s Guilds</p>
<hr>
    <table class="table-fixed w-2/5 text-center mx-auto mt-6 rounded border border-zinc-200 bg-white shadow-lg">
        <tr class="text-2xl">
            <th class="rounded border border-zinc-200">Guild</th>
            <th class="rounded border border-zinc-200">Game</th>
            <th class="rounded border border-zinc-200">Applications</th>
            <th class="rounded border border-zinc-200">Actions</th>
        </tr>
        <c:forEach var="guild" items="${guilds}">
            <tr class="text-lg">
                <td class="hover:bg-zinc-200 rounded border border-zinc-200"><a href="/guild/${guild.id}">${guild.name}</a></td>
                <td class="rounded border border-zinc-200">${guild.game}</td>
                <td class="rounded border border-zinc-200 hover:bg-zinc-200"><a href="/guild/${guild.id}/applications">${guild.guildApplications.size()}</a></td>
                <td class="flex items-center justify-center gap-4 border border-zinc-200">
                    <a href="/guild/edit/${guild.id}" class="hover:bg-zinc-200">Edit</a>
                    <form action="/guild/delete/${guild.id}" method="post">
                        <input type="hidden" name="_method" value="delete">
                        <button type="submit" class="hover:bg-zinc-200">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
