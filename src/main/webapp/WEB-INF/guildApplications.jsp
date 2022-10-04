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
    <link rel="stylesheet" href="https://unpkg.com/flowbite@1.5.3/dist/flowbite.min.css" />
    <script src="https://unpkg.com/flowbite@1.5.3/dist/flowbite.js"></script>
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
<p class="flex justify-center text-3xl mt-24 font-semibold">${guild.name}'s Applications</p>
<hr>
<table class="table-fixed w-4/5 text-center mx-auto mt-6 rounded border border-zinc-200 bg-white shadow-lg">
    <tr class="text-2xl">
        <th class="rounded border border-zinc-200">Name</th>
        <th class="rounded border border-zinc-200">Email</th>
        <th class="rounded border border-zinc-200">Character Class</th>
        <th class="rounded border border-zinc-200">Character Level</th>
        <th class="rounded border border-zinc-200">Item Level</th>
        <th class="rounded border border-zinc-200"></th>
    </tr>
    <c:forEach var="application" items="${guildApplications}">
        <tr class="text-lg">
            <td class="rounded border border-zinc-200">${application.name}</td>
            <td class="rounded border border-zinc-200">${application.email}</td>
            <td class="rounded border border-zinc-200">${application.characterClass}</td>
            <td class="rounded border border-zinc-200">${application.characterLevel}</td>
            <td class="rounded border border-zinc-200">${application.itemLevel}</td>
            <td class="flex items-center justify-center gap-4 border border-zinc-200">
                <button class="hover:bg-zinc-200 flex justify-center items-center" data-modal-toggle="defaultModal">
                    <a href="/guild/${guild.id}/applications/${application.id}">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 hover:scale-110">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 01-2.25 2.25h-15a2.25 2.25 0 01-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25m19.5 0v.243a2.25 2.25 0 01-1.07 1.916l-7.5 4.615a2.25 2.25 0 01-2.36 0L3.32 8.91a2.25 2.25 0 01-1.07-1.916V6.75" />
                        </svg>
                    </a>


                </button>
                <form action="/guild/${guild.id}/applications/${application.id}/delete" method="post">
                    <input type="hidden" name="_method" value="delete">
                    <button type="submit" class="hover:bg-zinc-200 flex justify-center items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6 hover:scale-110">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                        </svg>

                    </button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
