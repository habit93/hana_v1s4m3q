<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
$(function(){
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
%>
<div class='content_menu'>
  <A href='./list.do'>게시판</A>｜새글 등록
</div> 
<DIV class='content' style='width: 80%;'>
<FORM name='frm' method='POST' action='./create.do'
           enctype="multipart/form-data">
    <input type='hidden' id='categoryno' name='categoryno' value='<%=categoryno%>'>
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' id='title' size='70' value='' required="required">
      </li>
       <li>
        <label>가격</label>
        <input type='text' name='price' id='price' size='70' required="required"> 
      </li>
      <li>
        <textarea name='content' id='content'  rows='7' style='width: 100%;'></textarea>
      </li>
      <li>
        <label class='label' for='fileMF'>Thumb 파일</label>
        <input type="file" name='fileMF' id='fileMF' >
      </li>
      <li class='right'>
        <button type="submit">등록</button>
      </li>         
    </ul>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 

