<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.member.MemberVO" %>
<% int mno = (Integer)request.getAttribute("mno"); %>

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

<DIV class='title'>회원 탈퇴</DIV>

<DIV class='content' >
<FORM name='frm' method='POST' action='./delete.do'>
  <input type='hidden' name='mno' value='<%=mno %>'> 
  회원을 삭제하면 복구 할 수 없습니다.<br>
  정말로 삭제하시겠습니까?<br>
  <div class="feature">
    <button type="submit" class="btn-sm">삭제</button>
    <button type="button" class="btn-sm" onclick="location.href='./read.do?mno=<%=mno%>'">마이페이지</button>
  </div>

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




 