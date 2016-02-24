<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="com.hana.blog.BlogVO" %>
<%@ page import="com.hana.tool.Tool" %>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>글 수정</title>
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
  CKEDITOR.replace('content');
});
</script>
</head>
<!-- --------------------------------------------------------- -->
<body >
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->
<%  
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");
%>
<div class='content_menu'>
  <A href='./list2.do?blogcategory=<%=blogVO.getBlogcategoryno() %>'>${title } 게시판</A>
</div> 
<DIV class='content'>
  <FORM name='frm' method='POST' action='./update.do' enctype="multipart/form-data">
    <input type='hidden' name='blogno' id='blogno' value='<%=blogVO.getBlogno() %>'>
    <input type="hidden" name="blogcategoryno" value="<%=blogVO.getBlogcategoryno() %>">
    <ul>
      <li>
        <label for='title'>제목<input type='text' name='title' size='80' id='title' value='<%=blogVO.getTitle() %>' required="required"></label>
      </li>
      <li>
        <textarea name='content' id='content'  rows='10' style='width: 100%;'><%=blogVO.getContent() %></textarea>
      </li>
      <li>
        <label for='fileMF'>Thumb 파일<input type="file" name='fileMF' id='fileMF' value='<%=Tool.checkNull(blogVO.getFile()) %>'></label>
      </li>
      <li class='feature'>
        <button type="submit" >수정</button>
        <button type="button" onclick="location.href='./list2.do?blogcategoryno=<%=blogVO.getBlogcategoryno() %>'">목록</button>
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

