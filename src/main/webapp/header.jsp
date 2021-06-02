<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<title>Welcome to BPIBS</title>
</head>
<body>

	<div class="mb-3">
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="/">BPIBS</a>
				<div class="d-md-none ml-auto mx-2">
					<a href="/login" class="btn btn-primary">Login</a>
				</div>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbar" aria-controls="navbar" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="/">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
					</ul>
					<a href="/login" class="btn btn-primary d-none d-md-block">Login</a>
				</div>
			</div>
		</nav>
	</div>