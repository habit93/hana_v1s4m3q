<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="com.hana.review.ReviewVO" %>
<%@ page import="com.hana.tool.Tool" %>

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
  CKEDITOR.replace('contents');
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%  
ReviewVO reviewVO = (ReviewVO)request.getAttribute("reviewVO");
%>

<DIV class='content' style='width: 80%;'>
  <FORM name='frm' method='POST' action='./update.do'>
    <input type='hidden' name='reviewno' id='reviewno' value='<%=reviewVO.getReviewno() %>'>
    <input type='hidden' name='itemno' id='itemno' value='<%=reviewVO.getItemno() %>'>
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' size='80' id='title' value='<%=reviewVO.getTitle() %>' required="required">
      </li>
      <li>
        <textarea name='contents' id='contents'  rows='10' style='width: 100%;'><%=reviewVO.getContents() %></textarea>
      </li>
      <li class='right'>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
