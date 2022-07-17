<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>   
<link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script>
 Kakao.init('8148de36e2b8d4215e24f39fffbd1a62'); //발급받은 키 중 javascript키를 사용해준다.
 console.log(Kakao.isInitialized()); // sdk초기화여부판단

  var kid; //카카오 내 id(토큰)
  var kemail; //카카오 내 email
  var knickname; //카카오 내 닉네임
  var kp;	//카카오 내 프로필이미지
  var kb; //카카오 내생일
  
//카카오로그인
 function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  /* alert("1:"+response);
        	  alert(kid+"로그인성공"); */
        	  
        	  $("#kakao_id").text(response.id);
        	  kid = response.id;       	  
        	  console.log(typeof(kid));
        	  $("#kakao_id").val(kid);
        	  
        	  $("#kakao_email").text(response.kakao_account.email);
        	  kemail=response.kakao_account.email;
        	  
        	  $("#kakao_email").val(kemail);
        	  
        	  $("#kakao_nickname").text(response.properties['nickname']);
        	  knickname=response.properties['nickname'];
        	  
        	  $("#kakao_nickname").val(knickname);
        	  
        	  $("#kakao_profile_image").text(response.properties['profile_image']);
        	  $("#kpi").attr("src",response.properties['profile_image']);
        	  
        	  kp=response.properties['profile_image'];
        	  $("#kakao_profile_image").val(kp);
        	  
        	  $("#kakao_birthday").text(response.kakao_account.birthday);
        	  kb=response.kakao_account.birthday;
        	  $("#kakao_birthday").val(kb);
        	  
        	  $.ajax({
        			type:"get",
        			dataType:"text",
        			url:"/kakao",
        			data:{"kid": kid, "kemail" : kemail, "knickname" : knickname, "kp": kp, "kb": kb},
        			success:function(){
        				location.href = "/";
        			}
        		});
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
  
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        	
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }   
  
  //네이버로그인
 /*  var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "vKPM2ucOKYWj529k0spY", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:9001", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
}*/

</script>
<style type="text/css">
.btnlogin_2{

	background-color: #2d35af;
	color:white;
	border:0;
	border-radius:5px;
	width: 70px;
	height:35px;
	font-size:15px;
	
}
.loginform th{
	
}
.btnfindid, .btnfindpass{
	background-color: white;
	color:black;
	border:3px solid #ddd;
	border-radius:5px;
	width: 120px;
	height:35px;
	font-size:15px;
	
}
</style>
</head>
<body>
	<br><br><br><br><br><br><br>
	
	<div class="loginform">
		<form action="process" method="post" class="form-inline">
			<table class="table" style="width: 500px">
				<tr>
					<th colspan="3"  style="text-align: center;">
						<img src="../images/login.png" class="login_img" title="login" style="width: 300px;">
					</th>
				</tr>
				<tr>
					<th>아이디</th>
				
						<c:if test="${sessionScope.saveId == 'true'}">
							<td>
							<input type="text" name="id" class="form-control" required value="${sessionScope.loginId}">
							</td>
							<td>
							<label>
								<input type="checkbox" name="saveId" checked>&nbsp;&nbsp;&nbsp;아이디 저장
							</label>
							</td>
						</c:if>
						<c:if test="${sessionScope.saveId != 'true'}">
							<td>
							<input type="text" name="id" class="form-control" required autofocus placeholder="아이디">
							</td>
							<td>
							<label>
								<input type="checkbox" name="saveId">&nbsp;&nbsp;&nbsp;아이디 저장
							</label>
							</td>
						</c:if>
				
					<%-- <td>
						<input type="checkbox" name="saveId" ${sessionScope.saveId == false ? "" : "checked"}>&nbsp;아이디저장
					</td> --%>
				</tr>
				<tr>
					<th>비밀번호</th>
						<c:if test="${sessionScope.saveId == 'true'}">
						<td>
							<input type="password" name="password" class="form-control" required autofocus placeholder="비밀번호" id="lpw">
						</td>
						</c:if>
						<c:if test="${sessionScope.saveId != 'true'}">
						<td>
							<input type="password" name="password" class="form-control" required placeholder="비밀번호" id="lpw">
						</c:if>
						</td>
					    <td><button type="submit" class="btnlogin_2">로그인</button></td>
					
					
				</tr>
				<tr>
					<th>
					소셜로그인
					</th>
					<td>
						<a href="javascript:void(0)">
	         		<span onclick="kakaoLogin(); kakaoSession();">
	         		<img src="../images/kakao_login_medium_narrow.png"></span>
		      		</a>
					</td>
					<td>
					</td>
					
				</tr>
				<tr>
					<td>
					</td>
					<td colspan="2">
						<button type="button" class="btnfindid" onclick="location.href='findId'">아이디 찾기</button>
						<button type="button" class="btnfindpass" onclick="location.href='findPassword'">비밀번호 찾기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- 네이버 로그인 자리 -->
	<!--  <ul>
	<li>
      아래와같이 아이디를 꼭 써준다.
      <a id="naverIdLogin_loginButton" href="javascript:void(0)">
          <span>네이버 로그인</span>
      </a>
	</li>
	<li onclick="naverLogout(); return false;">
      <a href="javascript:void(0)">
          <span>네이버 로그아웃</span>
      </a>
	</li>
</ul> -->
  
  
	<!-- 카카오 로그인 자리 -->
	
<!-- 	 <ul>
	<li onclick="kakaoLogin(); kakaoSession();">
      <a href="javascript:void(0)">
          <span><img src="../images/kakaologin.png"></span>
      </a>
	</li>
	
	<li onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	</li>
</ul>  -->
</body>
</html>