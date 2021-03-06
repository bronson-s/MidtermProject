<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<!-- NAV BAR -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<!--   <a class="navbar-brand" href="/homepage.do"> <img src="imgs/logo.png" class="profile-pic" class="img-thumbnail" border=0 style="border:0; text-decoration:none; outline:none" width="100" height="100" >
 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="homepage.do"><span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="homepage.do">HOME</a>
					</li>

					<c:choose>
						<c:when test="${loggedInUser.id>0}">
							<li class="nav-item"><a class="nav-link"
								href="profilepage.do">PROFILE</a></li>

							<li class="nav-item"><a class="nav-link" href="getUsers.do">SHOW
									USERS</a></li>

						</c:when>
					</c:choose>


					<li class="nav-item"><a class="nav-link" href="loginbutton.do">LOGIN</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="register.do">REGISTER</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="logout.do">LOGOUT</a>
					</li>
				</ul>
			</div>
		</nav>

		<div class="card">
			<div class="container-sm mx-auto" style="width: 200px;"></div>
			<img src="imgs/boardgame.png" class="img-fluid card-img-top"
				alt="Responsive image" style="width: 100%; height: 100px%;">
			<div class="card-img-overlay">
				<div class="row align-items-center justify-content-center">
					<div class="card bg-light mb-3 text-center justify-content-center"
						" style="max-width: 22rem;">
						<div class="card-body">
							<h1 class="display-4 text-center">
								<img src="imgs/logo.png" class="profile-pic"
									class="img-thumbnail" border=0
									style="border: 0; text-decoration: none; outline: none"
									width="200" height="200">
							</h1>
							<p class="lead text-center"">A BOARD GAME SOCIAL MEDIA
								PLATFORM</p>

						</div>
					</div>
				</div>
			</div>
		</div>
		

<!-- 		<div class="card bg-dark text-white">
<img src="imgs/boardgame.png" class="img-fluid card-img-top"
				alt="Responsive image" style="width: 100%; height: 100px%;"> 
				<div class="card-img-overlay">
				<div class="text-center">
				<br>
				<br>
				<br>
  <img src="imgs/logo.png" class="profile-pic "
									class="img-thumbnail" border=0
									style="border: 0; text-decoration: none; outline: none"
									width="200" height="200">
									
									
    <h2 class="card-title" style="color:black" >A BOARD GAME GAME SOCIAL MEDIA PLATFORM </h2>
    </div>
  </div>
</div> -->
		<!-- <title>Homepage</title>
		<div class="jumbotron">
			<h1 class="display-4 text-center">
				<img src="imgs/logo.png" class="profile-pic" class="img-thumbnail"
					border=0 style="border: 0; text-decoration: none; outline: none"
					width="200" height="200">
			</h1>
			<p class="lead text-center"">A BOARD GAME SOCIAL MEDIA PLATFORM</p>
		</div> -->
		<!-- <link rel="stylesheet"
			href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
			integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
			crossorigin="anonymous">
		<title>Homepage</title>
		</head>
		<body> -->

			<!--  <img src="imgs/gamepieces.png" class="img-thumbnail" border=0 style="border:0; text-decoration:none; outline:none class="d-block w-100">
 -->
			<!-- <img src="imgs/scrabble.png" class="img-fluid h-25" alt="Responsive image" style="width: 100%; height: 50px%;">
 -->
			<!-- <img src="imgs/boardgame.png" class="profile-pic" class="img-thumbnail" border=0 style="border:0; text-decoration:none; outline:none" width="700" height="500" >
 -->
			<!-- <div class="container-sm mx-auto" style="width: 200px;"></div>
				<img src="imgs/boardgame.png" class="img-fluid"
					alt="Responsive image" style="width: 100%; height: 100px%;">
 -->
			<br>
			<br>
			<!-- DROPDOWN SEARCH LIST -->
			<h1 class="display-4 text-center" style="color: gray;">FIND A
				BOARD GAME</h1>
			<br>
			<form action="gameList.do" method="GET"
				class="d-flex justify-content-center md-form form-sm">
				<label id="searchType">SEARCH BY </label> <select id="searchType"
					name="searchType">
					<option value="genre">Genre</option>
					<option value="category">Category</option>
					<option value="publisher">Publisher</option>
					<option value="numPlayers">Number of Player</option>
					<option value="keyword">Keyword</option>
				</select> 
				<input name="searchTerm" required="required"
					class="form-control form-control-md mr-3 w-75" type="text"
					placeholder="Search" aria-label="Search" class="form-control form-control-sm mr-3 w-75"/>
				<input name="submit" type="submit" />
			</form>

			<!-- IMAGE -->
			<div class="container-sm">
				<!-- <img src="imgs/boardgame.png" class="profile-pic" class="img-thumbnail" border=0 style="border:0; text-decoration:none; outline:none" width="700" height="500" >
 -->
			</div>
			<br>


			<div class="container">
				<div class="row">
					<div class="col">
						<!-- TABLE OF LINKS -->
						<br> <br>
						<h3 class="text-center" style="color: gray;">EXPLORE BOARD
							GAMES</h3>
						<br>
						<table class="table table-striped">
							<c:forEach var="gameIndiv" items="${gameList}">
								<tr>
									<td><a href="getGame.do?id=${gameIndiv.id}">
											<h5>${gameIndiv.name}</h5>
									</a>
									<td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col">
						<!-- COMMUNITY COMMENT -->
						<br> <br>
						<h3 class="text-center" style="color: gray;">COMMUNITY FORUM</h3>


						<br>
						<table class="table table-striped">
							<c:forEach var="commentL" items="${commentsList}">
								<tr>
									<td><h5>${commentL.commentDate}</h5>
									<td>
								</tr>
								<tr>
									<td><h5>${commentL.user.username}:
											${commentL.commentText}</h5>
									<td>
								</tr>
							</c:forEach>
						</table>

						<c:choose>
							<c:when test="${loggedInUser.id>0}">
								<form action="addCommunityComment.do" method="POST">
									<p>Add a comment</p>
									<textarea name="commentText"></textarea>
									<input type="submit" role="button" />
								</form>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>



			<!-- ADMIN CRUD BUTTON?  -->
			<c:choose>
				<c:when test="${user.role} = ADMIN">
					<form action="adminCrud.do" method="GET">
						<p>Admin CRUD</p>
						<input type="button" value="Submit" />
					</form>
				</c:when>
			</c:choose>
			<br>
	<br>
	<br>
  <div >
      <div class="container-xl"style="width:100%;height:80px;background-color:#f0f0f0;color: gray;">
      <br>
    <p class="lead text-center"> @2020 gameBORED | All Rights Reserved</p>
  </div>
  </div>
</div>		

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
		integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
		crossorigin="anonymous"></script>
</body>
</html>