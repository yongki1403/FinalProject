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
			
			<li class="login-misspass-missid"><a id="amissid" href="/login/loginMissId">아이디 찾기</a></li>
			
			<li class="login-misspass-misspass"><a href="/login/loginMissPass">비밀번호 찾기</a></li>
		</ul>		
		
		<hr class="login-missid-line-up">		
			<div class="login-missid-main">
					<table class="login-missidfalse-table">
						<tr>
							<th class="missidfalsesubj">일치하는 정보가 없습니다.</th>						
						</tr>
					</table>

					<!-- 버튼 -->
					<div class="login-missid-btn-findid">
						<button type="submit" class="login-missid-btn-loginfalse" onclick="location.href='/login/loginMissPass'">뒤로가기</button>
					</div>
			</div>

		<hr class="login-missid-line">
			
	</div>
<!-- main 끝 -->

</body>
</html>