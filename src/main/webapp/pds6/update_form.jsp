<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>

<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
int blogreplyno = Integer.parseInt(request.getParameter("blogreplyno"));

Pds6DTO pds6DTO = pds6DAO.read(blogreplyno); // 조회
%>

<DIV class='title'>수정</DIV> 

<FORM name='frm' method='POST' action='./update_proc.jsp'>
  <input type='hidden' name='blogreplyno' value='<%=blogreplyno %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>
  
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TH class='th'>제목</TH>
      <TD colspan='3'><input type='text' name='title' value='<%=pds6DTO.getTitle() %>' style='width: 100%;'></TD>
    </TR>
    <TR>
      <TD colspan='4' style='text-align: right;'>
        <TEXTAREA name='content' rows='10' style='width: 100%;'><%=pds6DTO.getContent() %></TEXTAREA>
      </TD>
    </TR>
    <TR>
      <TH class='th'>패스워드</TH>
      <TD><input type='password' name='passwd' style='width: 100%;' value='<%=pds6DTO.getPasswd() %>'></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='변경된 내용 저장'>
    <input type='button' value='취소' onclick="location.href='./list.jsp'"> 
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>






