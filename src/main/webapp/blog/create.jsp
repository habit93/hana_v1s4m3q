<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.blog.BlogVO" %>

<%
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");
%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>글 작성</title>
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
  CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
});
</script>
</head>
<!-- --------------------------------------------------------- -->
<body >
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<div class='content_menu'>
  <A href='./list2.do?blogcategoryno=<%=blogVO.getBlogcategoryno()%>'>게시판 돌아가기</A>｜새글 등록
</div> 
<DIV class='content'> 
<FORM name='frm' method='POST' action='./create.do' enctype="multipart/form-data">
   <input type='hidden' name='mno' id='mno' value='${mno }'>
   <input type="hidden" name='blogcategoryno' id='blogcategoryno' value='<%=blogVO.getBlogcategoryno() %>'>
    <ul>
      <li><label for='title'>제목<input type='text' name='title' id='title' size='70' value='봄' required="required"></label></li>
      <li><textarea name='content' id='content'  rows='7' style='width: 100%;'>추위끝</textarea></li>
      <li><label for='fileMF'>Thumb 파일 : <input type="file" name='fileMF' id='fileMF' ></label></li>
      <li class='feature'> 
        <button type="submit">등록</button>
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
