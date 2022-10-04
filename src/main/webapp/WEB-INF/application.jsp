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

<p class="flex justify-center text-3xl mt-24 font-semibold">${application.name}'s Application</p>
<hr>
	<div class="flex items-center justify-center flex-col gap-6 mt-24">
		<p class="">Contact/Email: ${application.email}</p>
		<p>Character Info: Level ${application.characterLevel}, ${application.characterClass}, Item Level ${application.itemLevel}</p>
		<p>Message:</p>
		<p>${application.message}</p>
		<a href="/guild/${guild.id}/applications">
			<button class="flex gap-2 hover:bg-zinc-200 hover:scale-110">
				<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
					<path stroke-linecap="round" stroke-linejoin="round" d="M6.75 15.75L3 12m0 0l3.75-3.75M3 12h18" />
				</svg> Back
			</button>
		</a>
	</div>

</body>
</html>
