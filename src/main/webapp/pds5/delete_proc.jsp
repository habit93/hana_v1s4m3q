<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 처리</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->


<DIV class='title'>삭제 처리 결과</DIV>

<DIV class='body'>
<%
int qano = Integer.parseInt(request.getParameter("qano"));
String passwd = request.getParameter("passwd");

// 기존 파일을 삭제하기위한 레코드 읽기
Pds5DTO _pds5DTO = pds5DAO.read(qano);

// ① 패스워드 검사
int count = pds5DAO.passwdCheck(qano, passwd);
 
if (count == 1){
  count = pds5DAO.delete(qano); // DBMS  삭제
  
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

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>









