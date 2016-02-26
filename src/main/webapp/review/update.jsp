<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="com.hana.review.ReviewVO" %>
<%@ page import="com.hana.tool.Tool" %>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>글 조회</title>
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
  CKEDITOR.replace('contents');
});
</script>
 
  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<%  
ReviewVO reviewVO = (ReviewVO)request.getAttribute("reviewVO");
%>

<div class="title">리뷰 수정</div>

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
 
<!-- --------------------------------------------------------- -->
    <jsp:include page="../menu/bottom.jsp" flush='false' />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
  </body>
<!-- --------------------------------------------------------- -->
</html>
