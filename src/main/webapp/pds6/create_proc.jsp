<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%
request.setCharacterEncoding("UTF-8"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 처리</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>등록 결과</DIV>

<DIV class='body'>
<%
// 한글 변환을 해주어야합니다.
String title = request.getParameter("title");
String content = request.getParameter("content");
String passwd = request.getParameter("passwd");
String rname = request.getParameter("rname");
int blogno = Integer.parseInt(request.getParameter("blogno"));

Pds6DTO pds6DTO = new Pds6DTO();
pds6DTO.setTitle(title); 
pds6DTO.setContent(content);
pds6DTO.setRname(rname);
pds6DTO.setPasswd(passwd);
pds6DTO.setBlogno(blogno);
int count = pds6DAO.insert(pds6DTO);
 
if (count == 1){
%>
  입력 데이터를 등록 했습니다.<br><br>
  <input type='button' value='계속 등록'  onclick="location.href='./create_form.jsp'">
  <input type='button' value='목록' onclick="location.href='./list.jsp'">

<%  
}else{
%>
  입력 데이터 등록에 실패했습니다.<br><br>
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









