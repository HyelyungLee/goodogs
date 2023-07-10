<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String easyLoginMember = (String) session.getAttribute("EasyLoginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodogs</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
</head>
<body>


	<!-- 임시 로그인 기능 start -->
	<form id="EasyloginFrm" name="EasyloginFrm"
		action="<%=request.getContextPath()%>/easyLogin" method="post">
		<input type="radio" id="NonMember" name="radio-group"
			value="NonMember"> <label for="option1">NonMember</label><br>

		<input type="radio" id="Member" name="radio-group" value="Member">
		<label for="option2">Member</label><br> 
		
		<input type="radio" id="Reporter" name="radio-group" value="Reporter"> 
		<label for="option3">Reporter</label><br> 
		
		<input type="radio" id="Admin" name="radio-group" value="Admin"> 
		<label for="option3">Admin</label><br>

		<button type="submit">Go!</button>
	</form>
	<!-- 임시 로그인 기능 end -->


	<div id="container">
		<nav class="navBar">
			<div class="navInner">
				<h1>goodogs</h1>
				<div class="navBox">
					<div class="searchBox">검색</div>
					<div class="infoBox">정보</div>
				</div>
			</div>
		</nav>



		<!-- 로그인 객체마다 헤더가 다르게 보이게 -->

		<header>
			<%
			if (easyLoginMember == null || easyLoginMember.equals("NonMember")) {
			%>
			<div class="bannerContainerUpper" role="banner">슬로건</div>
			<div class="bannerContainerLower">
				<div class="loginContainer">
					<form id="loginFrm" name="loginFrm" action="" method="post">
						<table>
							<tr>
								<td><input type="text" name="memberId" id="memberId"
									placeholder="아이디" tabindex="1" value=""></td>
								<td rowspan="2"><input type="submit" value="로그인"></td>
								<td rowspan="2"><input type="button" value="회원가입"
									onclick=""></td>
							</tr>
							<tr>
								<td><input type="password" name="password" id="password"
									tabindex="2" placeholder="비밀번호"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="2"><input type="checkbox" name="saveId"
									id="saveId" /> <label for="saveId">아이디저장</label></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<%
			} else if (easyLoginMember.equals("Member")) {
			%>
			<div class="bannerContainerUpper" role="banner">슬로건</div>
			<div class="bannerContainerLower">
				<br>
				<h1>멤버화면</h1>
			</div>
			<%
			} else if (easyLoginMember.equals("Reporter")) {
			%>
			<div class="bannerContainerUpper" role="banner">
				<nav>
					<ul class="reporterNav">
						<li class="myNewsList"><a href="<%= request.getContextPath() %>/reporter/myNewsList">기사 목록</a></li>
						<li class="script"><a href="<%= request.getContextPath() %>/reporter/myScript">원고 관리</a></li>
						<li class="scriptWrite"><a href="<%= request.getContextPath() %>/reporter/scriptWrite">원고 작성</a></li>
					</ul>
				</nav>
			</div>
			<div class="bannerContainerLower">
				<br>
				<h1>기자화면</h1>
			</div>
			<%
			} else if (easyLoginMember.equals("Admin")) {
			%>
			<div class="bannerContainerUpper" role="banner">관리자메뉴</div>
			<div class="bannerContainerLower">
				<br>
				<h1>관리자화면</h1>
			</div>
			<%
			}
			%>
		</header>
		<section class="sc-bcXHqe exBdsH home-recent">