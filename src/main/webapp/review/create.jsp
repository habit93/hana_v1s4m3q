<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.review.ReviewVO" %>

<%
ReviewVO reviewVO = (ReviewVO)request.getAttribute("ReviewVO");
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
  CKEDITOR.replace('contents');  // <TEXTAREA>태그 id 값
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='content' style='width: 80%;'>
<FORM name='frm' method='POST' action='./create.do'
           enctype="multipart/form-data">
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' id='title' size='70' value='완전 만족합니다.' required="required">
      </li>
      <li>
        <textarea name='contents' id='contents'  rows='7' style='width: 100%;'>빠른 배송 ㅎㄷㄷ</textarea>
      </li>
      <li>
        <input type="hidden" name='itemno' id='itemno' value='${itemno }'>
        <input type="hidden" name='mno' id='mno' value='${mno }'>
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
