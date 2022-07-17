<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<meta charset="UTF-8">
<title>이런여행</title>
</head>
<body>

	<!-- main 시작 -->
	<div class="login-home">
		<span class="login-home-title">로그인</span>
		<hr class="login-home-line-up">		
			<div class="login-home-main">
				<form action="/login/loginmain" method="post" class="form-loginhome">
					<table class="login-home-table">
						<tr>
							<td><input type="text" name="userid" class="form-loginhome-input" placeholder="아이디" required="required"
							value="${sessionScope.saveok==null?"":sessionScope.myid }"></td>
						</tr>

						<tr>
							<td><input type="password" name="password" class="form-loginhome-input" placeholder="비밀번호" required="required"></td>
						</tr>
					</table>

					<!-- 버튼 -->
					<div class="btn-save">
						<input type="checkbox" class="btn-save-text" name="cbsave"
						 ${sessionScope.saveok==null?"":"checked" }>&nbsp;&nbsp;아이디 저장
					</div>
					<div class="btn-login">
						<button type="submit" class="btn-login-home-login">로그인</button>
					</div>
				</form>
			</div>
			
		<div class="login-home-btn2">
			<button type="button" class="login-home-btn-find" onclick="location.href='/login/loginMissId'">아이디ㆍ비밀번호 찾기</button>
			<button type="button" class="login-home-btn-join" onclick="location.href='/joinMember/loginJoin'">회원가입</button>
		</div>
		
		<div class="login-home-btn3">
			<button type="button" class="btn-login-home-kakao"><img src="${root }/image/asset/카톡원형.png" width = "50px"
			onclick="kakaoLogin();"></button>
			<button type="button" class="btn-login-home-naver" id="naverIdLogin"><img src="${root }/image/asset/네이버원형.png" width = "50px"
			onclick="naverLogin.init();" class="naverbtnimg"></button>
		</div>
		
		<br><br><br>
		<hr class="login-home-line">
			
	</div><!-- main 끝 -->
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
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

        	  location.href = "/";
        	  
        	  
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

        	  $.ajax({
        			type:"get",
        			dataType:"text",
        			url:"/login/kakao",
        			data:{"kid": kid, "kemail" : kemail, "knickname" : knickname},
        			success:function(){
        				alert("성공");
        				
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
        	
        	$.ajax({
    			type:"get",
    			dataType:"text",
    			url:"/login/logout",
    			success:function(){
    				
    			}
    		});
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
 function nlogout1(){
	 window.open("http://nid.naver.com/nidlogin.logout");
 }
 function nlogout2(){
	 location.href="/login/logout";
 }
</script>


<!-- 네이버아이디로로그인 버튼 노출 영역 -->
<div id="naverIdLogin"></div>
<!-- //네이버아이디로로그인 버튼 노출 영역 -->
<div onclick="nlogout2(); nlogout1();"  style="visibility: hidden;">네이버 로그아웃</div>

<!-- 네이버아디디로로그인 초기화 Script -->
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "S4vf7M94cALtBOCIxY7Q",
			callbackUrl: "http://localhost:9001/callBack",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 1, height: 40} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
<!-- // 네이버아이디로로그인 초기화 Script -->

</body>
</html>