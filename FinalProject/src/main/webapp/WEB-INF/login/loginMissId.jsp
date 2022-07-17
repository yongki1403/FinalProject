<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이런여행</title>

</head>
<body>

	<!-- main 시작 -->
	<div class="login-missid">
		<span class="login-missid-title">아이디/비밀번호를 잊어버리셨나요?</span>
		<ul>
			
			<li class="login-missid-missid"><a href="/login/loginMissId">아이디 찾기</a></li>
			
			<li class="login-missid-misspass"><a id = "amisspass" href="/login/loginMissPass">비밀번호 찾기</a></li>
		</ul>		
		
		<hr class="login-missid-line-up">		
			<div class="login-missid-main">
				<form action="missId" method="post" class="form-missid">
					<table class="login-missid-table">
						<tr>
							<th class="missidsubj">이름</th>						
							<td><input type="text" name="name" class="form-missid-input" placeholder="실명을 입력해주세요" required="required"></td>
						</tr>

						<tr>
							<th class="missidsubj">이메일</th>						
							<td><input type="text" name="email" class="form-missid-input" placeholder="user@2runtip.com" required="required"></td>
						</tr>
						
						<tr>
							<th class="missidsubj">아이디</th>						
							<td><input type="text" name="findid" class="form-missid-id" readonly="readonly" placeholder="아이디"></td>
						</tr>
					</table>
				
					<!-- 버튼 -->
					<div class="login-missid-btn-findid">
						<button type="submit" class="login-missid-btn-findid">아이디찾기</button>
						<button type="button" class="login-missid-btn-login" onclick="location.href='/loginHome'">로그인</button>
					</div>
				</form>	
			</div>

		<hr class="login-missid-line">

	</div>
<!-- main 끝 -->

</body>
</html>