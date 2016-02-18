<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%
request.setCharacterEncoding("UTF-8"); 
 
// ****************************************************************
// 파일 업로드 관련 코드 시작
// ****************************************************************
// 파일 전송시 사용할 임시 저장소
String tempDir = application.getRealPath("/pds5/temp");
 
// 최종 파일 저장소
String upDir = application.getRealPath("/pds5/storage");
 
// request: 내부 객체
// -1: 메모리에 저장할 최대 크기, 무제한 사용
// -1: 업로드할 최대 파일 크기, 무제한 사용
// tempDir: 파일 업로드중에 임시로 저장할 폴더
Upload upload = new Upload(request, -1, -1, tempDir);

String file1 = "";
long size1 = 0;
String file2 = "";
long size2 = 0;

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


Pds5DTO pds5DTO = new Pds5DTO();
pds5DTO.setTitle(title);
pds5DTO.setContent(content);
pds5DTO.setPasswd(passwd);

int count = pds5DAO.insert(pds5DTO);
 
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









