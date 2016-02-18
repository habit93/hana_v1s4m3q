<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.blog.BlogVO" %>

<%
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");
%>

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

<div class='content_menu'>
  <A href='./list.do'>게시판</A>｜새글 등록
</div> 
<DIV class='content' style='width: 80%;'>
<FORM name='frm' method='POST' action='./create.do'
           enctype="multipart/form-data">
   <input type='hidden' name='mno' id='mno' value='${mno }'>
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' id='title' size='70' value='봄' required="required">
      </li>
      <li>
        <textarea name='content' id='content'  rows='7' style='width: 100%;'>추위끝</textarea>
      </li>
      <li>
        <label class='label' for='fileMF'>Thumb 파일</label>
        <input type="file" name='fileMF' id='fileMF' >
      </li>
      <li>
        <label class='label' for='blogcategoryno'>카테고리 번호</label>
        <input type="text" name='blogcategoryno' id='blogcategoryno' value='<%=blogVO.getBlogcategoryno() %>'>
        <input type="hidden" name='mno' id='mno' value='1'>
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

