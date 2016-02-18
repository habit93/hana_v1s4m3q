<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>

<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
// 현재 답변을 붙일 글 번호
int qano = Integer.parseInt(request.getParameter("qano"));
%>
<DIV class='title'>답변</DIV> 

<FORM name='frm' method='POST' action='./reply_proc.jsp'>
            
  <input type='hidden' name='qano' value='<%=qano %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>
    
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TH class='th'>제목</TH>
      <TD colspan='3'><input type='text' name='title' value='' style='width: 100%;'></TD>
    </TR>
    <TR>
      <TD colspan='4' style='text-align: right;'>
        <TEXTAREA name='content' rows='10' style='width: 100%;'>답변입니다.</TEXTAREA>
      </TD>
    </TR>
    <TR>
      <TH class='th'>패스워드</TH>
      <TD><input type='password' name='passwd' style='width: 100%;' value='123'></TD>
    </TR>

  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='답변 등록'>
    <input type='button' value='취소' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&<%=nowPage %>'"> 
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>






