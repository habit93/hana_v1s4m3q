<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.member.MemberVO" %>
<% MemberVO memberVO = (MemberVO)request.getAttribute("memberVO"); %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title>마이페이지</title> 
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<script type="text/javascript">
$(function(){
  $.removeCookie('checkId'); // 기존의 쿠기 값을 삭제
});

function checkId(){
  var params ='id=' + $('#id').val();
  $.post('./checkId.do', params, checkId_response, 'json');
}

function checkId_response(data){
  // alert(data.cnt);
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
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<DIV class='title'>회원수정</DIV>

<DIV class='content'>
<FORM name='frm' method='POST' action='./update.do' onsubmit = 'return send();'>
   <input type='hidden' id='mno' name='mno' value='<%=memberVO.getMno()%>'>
    <ul>
      <li>
        <label class='label' for='id'>아이디</label>
        <input type='text' name='id' id='id' value='<%=memberVO.getId() %>' required="required">
        <button type='button' class="btn-sm" onclick="checkId()" >중복확인</button>
        <SPAN id='panel_id'></SPAN>
      </li>
      <li>
        <label class='label' for='passwd'>패스워드</label>
        <input type='password' name='passwd' id='passwd' required="required">
        <span id='panel_passwd'></span>
      </li>
      <li>
        <label class='label' for='passwd2'>패스워드 확인</label>
        <input type='password' name='passwd2' id='passwd2' value='' required="required">
      </li>
      <li>
        <label class='label' for='mname'>성명</label>
        <input type='text' name='mname' id='mname' value='<%=memberVO.getMname() %>' required="required">
      </li>
      <li>
        <label class='label' for='nickname'>닉네임</label>
        <input type="text" name='nickname' id='nickname' value='<%=memberVO.getNickname()%>' required="required">
      </li>
      <li>
        <label class='label' for='birthday'>생일</label>
        <input type="date" name='birthday' id='birthday' value='<%=memberVO.getBirthday()%>' required="required">
      </li>
      <li>
        <label class='label' for='birthday'>성별</label>
        <%
        if(memberVO.getGender() == 1){
        %>
        <label><input type="radio" name='gender' id='gender' value='1' checked="checked">남자</label>
        <label><input type="radio" name='gender' id='gender' value='2'>여자</label>
        <%
        }else{
        %>
        <label><input type="radio" name='gender' id='gender' value='1'>남자</label>
        <label><input type="radio" name='gender' id='gender' value='2' checked="checked">여자</label>
        <%
        }
        %>     
      </li>
      <li class='feature'>
        <button type="submit" class="btn-sm" >수정</button>
      </li>         
    </ul>
</FORM>
</DIV>

<!-- --------------------------------------------------------- -->
    <jsp:include page="../menu/bottom.jsp" flush='false' />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
  </body>
<!-- --------------------------------------------------------- -->
</html>

