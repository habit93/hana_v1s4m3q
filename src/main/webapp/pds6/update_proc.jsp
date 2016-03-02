<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 처리</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<DIV class='title'>수정 처리 결과</DIV>

<DIV class='body'>
<%
int blogreplyno = Integer.parseInt(request.getParameter("blogreplyno"));
String title = request.getParameter("title");
String content = request.getParameter("content");
String passwd = request.getParameter("passwd");

// 기존 파일을 삭제하기위한 레코드 읽기
Pds6DTO _pds6DTO = pds6DAO.read(blogreplyno);

// ① 패스워드 검사
int count = pds6DAO.passwdCheck(blogreplyno, passwd);
 
if (count == 1){
  // ④ 글 내용을 변경 
  Pds6DTO pds6DTO = new Pds6DTO();
  pds6DTO.setBlogreplyno(blogreplyno);  // 주의
  pds6DTO.setTitle(title);
  pds6DTO.setContent(content);
  pds6DTO.setPasswd(passwd);
  
  count = pds6DAO.update(pds6DTO);
  if (count == 1){
%>

  등록된 내용을 변경했습니다.<br><br>
  <input type='button' value='목록' onclick="location.href='./list.jsp'">

<%
  }else{ 
%>
  변경된 내용 저장에 실패했습니다.<br><br>
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









