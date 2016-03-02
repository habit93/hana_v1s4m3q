<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
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


<DIV class='title'>삭제 처리 결과</DIV>

<DIV class='body'>
<%
int blogreplyno = Integer.parseInt(request.getParameter("blogreplyno"));
String passwd = request.getParameter("passwd");

// 기존 파일을 삭제하기위한 레코드 읽기
Pds6DTO _pds5DTO = pds6DAO.read(blogreplyno);

// ① 패스워드 검사
int count = pds6DAO.passwdCheck(blogreplyno, passwd);
 
if (count == 1){
  count = pds6DAO.delete(blogreplyno); // DBMS  삭제
  
  if (count == 1){
%>
  등록된 내용을 삭제했습니다.<br><br>
  <input type='button' value='목록' onclick="location.href='./list.jsp'">
<%
  }else{ 
%>
  삭제에 실패했습니다.<br><br>
  <input type='button' value='다시 시도'  onclick="history.back()">
  <input type='button' value='목록' onclick="location.href='./list.jsp'">
<%    
  }
}else{
%>
  패스워드가 일치하지 않습니다.<br><br>
  <input type='button' value='다시 시도'  onclick="history.back()">
  <input type='button' value='목록' onclick="location.href='./list.jsp'">
<%  
}
%> 
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









