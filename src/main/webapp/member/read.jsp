<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.member.MemberVO" %>
<%MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");%>

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
  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->


<DIV class='title'>마이페이지</DIV>

<DIV class='container'> 
  <input type='hidden' id='mno' name='mno' value='<%=memberVO.getMno()%>'>
  <label for='id'>아이디 : <span><%=memberVO.getId() %></span></label><br>
  <label for='passwd'>패스워드 : <span><%=memberVO.getPasswd() %></span></label><br>
  <label for='mname'>성명 : <span><%=memberVO.getMname() %></span></label><br>
  <label for='nickname'>닉네임 : <span><%=memberVO.getNickname() %></span></label><br>
  <label for='birthday'>생일 : <span><%=memberVO.getBirthday() %></span></label><br>
  <label for='gender'>성별 :  
        <%
        if(memberVO.getGender() == 1){
        %>
        <span>남자</span>
        <%
        }else{
        %>
        <span>여자</span>
        <%
        }
        %>      
  </label><br> 
  <div class="feature"> 
        <button type="button" class="btn-sm" onclick="location.href='./update.do?mno=${mno}'">정보 수정</button> 
        <button type="button" class="btn-sm" onclick="location.href='./delete.do?mno=${mno}'">회원탈퇴</button> 
        <button type="button" class="btn-sm" onclick="location.href='../buy/list.do?mno=${mno}'">구매 내역 조회</button>
        <button type="button" class="btn-sm" onclick="location.href='../cart/list.do?mno=${mno}'">쇼핑카트</button>
 </div>
</div>


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




