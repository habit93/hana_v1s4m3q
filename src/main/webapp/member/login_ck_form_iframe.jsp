<%@ page contentType="text/html; charset=UTF-8" %>
<%
Cookie[] cookies = request.getCookies();
Cookie cookie = null;
String ck_id = "";
String ck_id_save = "";
String ck_passwd = "";
String ck_passwd_save = "";

for (int i=0; i < cookies.length; i++){
  cookie = cookies[i];
  
  if (cookie.getName().equals("ck_id")){
    ck_id = cookie.getValue();         // test1
  }else if(cookie.getName().equals("ck_id_save")){
    ck_id_save = cookie.getValue();  // Y, N
  }else if (cookie.getName().equals("ck_passwd")){
    ck_passwd = cookie.getValue();         // test1@mail.com
  }else if(cookie.getName().equals("ck_passwd_save")){
    ck_passwd_save = cookie.getValue();  // Y, N
  }
}
%>
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>로그인</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="./login.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
<!--         <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
<script type="text/javascript">
$(function(){
  $.removeCookie('checkId'); // 기존의 쿠기 값을 삭제
});

function checkId(){
  var params ='id=' + $('#id').val();
  $.post('./checkId.do', params, checkId_response, 'json');
}

function checkId_response(data){
  if (data.cnt == 0){
    $('#panel_id').css('color', '#00AA00');
    $('#panel_id').html('아이디가 사용가능합니다.');
    $.cookie('checkId', 'PASS');    
  }else if(data.cnt == 1){
    $('#panel_id').css('color', '#FF0000');
    $('#panel_id').html('아이디가 중복됩니다.');
  }
}

function send(){
  var cookie_checkId = $.cookie('checkId');
  if (cookie_checkId == undefined){
    $('#panel_id').css('color', '#FF0000');
    $('#panel_id').html('아이디 중복 확인을 체크해주세요.');
    return false; 
  } else if (cookie_checkId == 'PASS'){ // 아이디 검사 완료
    // 패스워드 동일한지 검사
    if ($('#passwd').val() == $('#passwd2').val()){ 
      $.removeCookie('checkId'); 
      return true;
    }else{
      $('#panel_passwd').css('color', '#FF0000');
      $('#panel_passwd').html('패스워드가 일치하지 않습니다.');
      return false;      
    }

  } else{
    return false; // 중복되는 경우
  }
}
</script>
  </head> 
<!-- --------------------------------------------------------- -->
  <body>   
<!-- --------------------------------------------------------- -->
<div class="login-page">  
  <div class="form">
    <form class="register-form" name='frm' method='POST' action='./create.do' onsubmit = 'return send();'>   
      <input type="text" name='id' id='id' required="required" placeholder="아이디" style="width:60%; float: left;"/>
        <button type='button' class="btn-sm" onclick="checkId()"style="width:40%">중복확인</button>
        <SPAN id='panel_id' style="width:100%; float: left; padding: 5px auto;"></SPAN>
      <input type="password" name='passwd' id='passwd' required="required" placeholder="패스워드"/>
        <span id='panel_passwd'></span>
      <input type="password" name='passwd2' id='passwd2' required="required" placeholder="패스워드확인"/>
      <input type="text" name='mname' id='mname' required="required" placeholder="이름"/>
      <input type="text" name='nickname' id='nickname' required="required" placeholder="닉네임" />
      <input type="date" name='birthday' id='birthday' value="1980-01-01" required="required" placeholder="생일"/>
      
      <label>남자 <input type="radio" name='gender' id='gender' value='1' style="width:10px"></label>
      <label>여자 <input type="radio" name='gender' id='gender' value='2'style="width:10px"></label>
      <button type="submit">회원가입</button>  
      <p class="message">회원이십니까?<a href="#">로그인</a>
    </form>  
    
   
    <form class="login-form" name='frm' method='POST' action='./login.do' onsubmit=''>
      <div>
	      <input type="text" name='id' id='id' value="user1" required="required" placeholder="아이디" style="width:70%; float: left;"/>
	        <label>                          <%-- <%=ck_id %> --%>
	          <%
	          if (ck_id_save.equals("Y")){
	          %>
	            <br>저장<input type='checkbox' name='id_save' value='Y' checked="checked" style="width:10%;">  
	          <%
	          }else{
	          %>
	            <br>저장<input type='checkbox' name='id_save' value='Y' style="width:10%;">  
	          <%   
	          } 
	          %>  
	        </label>
       </div>
       <div>                                          <%-- <%=ck_passwd %> --%>
	      <input type="password" name='passwd' id='passwd' value="1234" required="required" placeholder="패스워드" style="width:70%; float: left;" />
	        <label> 
	          <%
	          if (ck_passwd_save.equals("Y")){
	          %> 
	            <br>저장<input type='checkbox' name='passwd_save' value='Y' checked="checked" style="width:10%;"> 
	          <%
	          }else{
	          %> 
	            <br>저장<input type='checkbox' name='passwd_save' value='Y' style="width:10%;"> 
	          <%  
	          } 
	          %>
	        </label>
        </div>
      <button type='submit' >로그인</button>
      <p class="message">회원가입 하지 않으셨습니까?<a href="#">회원가입</a></p>
    </form>
  </div> 
</div>
 
<script type="text/javascript">
    $('.message a').click(function(){
      $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
   });
    </script>
<!-- --------------------------------------------------------- -->
  </body>
<!-- --------------------------------------------------------- -->
</html>
