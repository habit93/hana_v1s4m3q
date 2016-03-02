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
int blogreplyno = Integer.parseInt(request.getParameter("blogreplyno"));
int blogno = Integer.parseInt(request.getParameter("blogno"));
String rname = request.getParameter("rname");
String title = request.getParameter("title");
String content = request.getParameter("content");
String passwd = request.getParameter("passwd");

String ip = request.getRemoteAddr();

Pds6DTO pds6DTO = new Pds6DTO();
pds6DTO.setBlogreplyno(blogreplyno);
pds6DTO.setTitle(title);
pds6DTO.setContent(content);
pds6DTO.setPasswd(passwd);
pds6DTO.setBlogno(blogno);
pds6DTO.setRname(rname);
int count = pds6DAO.reply(pds6DTO);
 
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

