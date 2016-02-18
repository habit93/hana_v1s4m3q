<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>
 
<%request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 처리</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>답변 결과</DIV>

<DIV class='body'>
<%
// 답변을 쓰는 부모글 번호
int qano = Integer.parseInt(request.getParameter("qano"));
String title = request.getParameter("title");
String content = request.getParameter("content");
String passwd = request.getParameter("passwd");

String ip = request.getRemoteAddr();

Pds5DTO pds5DTO = new Pds5DTO();
pds5DTO.setQano(qano);
pds5DTO.setTitle(title);
pds5DTO.setContent(content);
pds5DTO.setPasswd(passwd);

int count = pds5DAO.reply(pds5DTO);
 
if (count == 1){
%>
  입력 데이터를 등록 했습니다.<br><br>
  <input type='button' value='목록' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">

<%  
}else{
%>
  입력 데이터 등록에 실패했습니다.<br><br>
  <input type='button' value='다시 시도'  onclick="history.back()">
  <input type='button' value='목록' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">

<%  
}
%> 
</DIV>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>

