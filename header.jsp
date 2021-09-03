<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>같이가치</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<link href="cal.css" rel="stylesheet">

<style>
#calendar-wrap {
	padding: 100px;
}

#heightEdit {
	height: 800px;
}

#logoimg {
	height: 65px;
}

#auth {
	position: absolute;
	right: 350px;
}

#uraLogin, #uraInfo {
	position: absolute;
	right: 260px;
}

#uraJoin, #uraLogout {
	position: absolute;
	right: 180px;
}

#uraMemDel {
	position: absolute;
	right: 100px;
}


</style>

</head>

<body>

	<!-- ======= Top Bar ======= -->
	<section id="topbar"
		class="d-flex align-items-center fixed-top topbar-transparent">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-center justify-content-lg-start">


			<%
				String auth = "";
				String name = (String) session.getAttribute("M_NAME");
				if (name != null) {
					auth = name + "님, 환영합니다.";
				}
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<div id="auth">
				<%=auth%>
			</div>

			<%
				if ((String) session.getAttribute("M_NAME") == null || !request.isRequestedSessionIdValid()) {
			%>

			<i id="uraLogin" class="bi bi-phone d-flex align-items-center"> <span>
					<a href="member/login.do">로그인</a>
			</span></i> &nbsp;&nbsp;&nbsp;&nbsp; <i id="uraJoin"
				class="bi bi-phone d-flex align-items-center"> <span> <a
					href="signup.do">회원가입</a>
			</span></i>
			<%
				} else {
			%>


			<i id="uraInfo" class="bi bi-phone d-flex align-items-center"> <span>
					<a href="MemberModifyForm.do">내 정보</a>
			</span></i> <i id="uraLogout" class="bi bi-phone d-flex align-items-center">
				<span> <a href="logoutaction.do">로그아웃</a></span>
			</i>
			<%
				}
			%>



		</div>
	</section>

	<!-- ======= Header ======= -->
	<header id="header"
		class="fixed-top d-flex align-items-center">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">

			<div class="logo me-auto">
				<%
					String id = (String) session.getAttribute("M_ID");
					if (id == null) {
				%>
				<h1>
					<a href="index.jsp"> <img id="logoimg" src="./img/logo.png"
						alt="같이가치 logo" title="같이가치">
					</a>
				</h1>
				<%
					} else if (id.equals("admin")) {
				%>
				<h1>
					<a href="adminindexpro.do"> <img id="logoimg"
						src="./img/logo.png" alt="같이가치 logo" title="같이가치">
					</a>
				</h1>
				<%
					} else {
				%>
				<h1>
					<a href="index.jsp"> <img id="logoimg" src="./img/logo.png"
						alt="같이가치 logo" title="같이가치">
					</a>
				</h1>
				<%
					}
				%>
				<!-- Uncomment below if you prefer to use an image logo -->
				<!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			</div>

			<nav id="navbar" class="navbar order-last order-lg-0">
				<ul>
					<li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
					<%
						if (id == null) {
					%>
					<li class="dropdown"><a href="programList.do" ><span style='color:orange'>프로그램</span>
							<i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="riddingList.do?category=러닝/마라톤" >러닝/마라톤</a></li>
							<li><a href="hikingList.do?category=등산" >등산</a></li>
							<li><a href="petTourList.do?category=펫산책" >펫 산책</a></li>
							<li><a href="castleList.do?category=성곽순례" >성곽 순례</a></li>


						</ul></li>
					<li ><a class="nav-link scrollto" href="url.do?URL=regWriteForm.do" ><span style='color:orange'>신청하기</span></a>
						</li>

					<li><a class="nav-link scrollto" href="reviewList.do" style='color:orange'>후기</a></li>
					<li class="dropdown"><a href="#"><span style='color:orange'>공지사항</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="noticeList.do" >공지사항</a></li>
							<li><a href="faqList.do" >FAQ</a></li>
							<li><a href="qnaList.do" >Q&amp;A</a></li>
						</ul></li>

					<%
						} else {
					%>
					<li class="dropdown"><a href="programList.do"><span style='color:orange'>프로그램</span>
							<i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="riddingList.do?category=러닝/마라톤" >러닝/마라톤</a></li>
							<li><a href="hikingList.do?category=등산" >등산</a></li>
							<li><a href="petTourList.do?category=펫산책" >펫 산책</a></li>
							<li><a href="castleList.do?category=성곽순례">성곽 순례</a></li>

						</ul></li>
					<li><a class="nav-link scrollto" href="regWriteForm.do"><span style='color:orange'>신청하기</span></a>
						</li>
					<li><a class="nav-link scrollto" href="reviewList.do" style='color:orange'>후기</a></li>
					<li class="dropdown"><a href="#"><span style='color:orange'>공지사항</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="noticeList.do">공지사항</a></li>
							<li><a href="faqList.do" >FAQ</a></li>
							<li><a href="qnaList.do" >Q&amp;A</a></li>
						</ul></li>
					<%
						}
					%>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>

	</header>
	<!-- End Header -->