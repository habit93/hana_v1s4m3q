<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.review.ReviewVO" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <title>커플아이템</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
     <link rel="stylesheet" href="../assets/css/main.css" />
     <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script type="text/javascript" src="../js/jquery.cookie.js"></script>
     <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
     <script type="text/javascript" src="../js/tool.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
  
<%
int itemno = (Integer)request.getAttribute("itemno");
int mno = (Integer)request.getAttribute("mno");
%>

<DIV class='title' >리뷰 작성</DIV> 

<DIV class='content' >
<FORM name='frm' method='POST' action='./create.do'>
        <input type="hidden" name='itemno' id='itemno' value='<%=itemno%>'>
        <input type="hidden" name='mno' id='mno' value='<%=mno%>'>
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' id='title' size='70' value='완전 만족합니다.' required="required">
      </li>
      <li>
        <textarea name='contents' id='contents'  rows='7' >빠른 배송 ㅎㄷㄷ</textarea>
      </li>
      <li class='feature'> 
        <button type="submit">등록</button>
      </li>  
    </ul>
</FORM> 
</DIV>
 
<!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
</body>
<!-- -------------------------------------------- -->
</html>
