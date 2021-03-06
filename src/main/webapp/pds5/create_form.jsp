<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>Q&A 작성</title>
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
<%
int itemno = Integer.parseInt(request.getParameter("itemno"));
%> 
  
<DIV class='title'>Q&A 등록</DIV>    

<div class='content'>
<form name='frm' method='POST' action='./create_proc.jsp'>
  <input type='hidden' name='itemno' id='itemno' value='<%=itemno%>'> 
  <label>제목 : <input type='text' name='title' id='title' size='70'  value='비가와야...' ></label>
  <textarea name='content' id='content' rows='10' style='width: 100%;'>손을 청결히...</textarea>
  <label>패스워드 : <input type='password' name='passwd' id='passwd' value='1234'></label> 
  <div class='feature'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="location.href='./list.jsp'"> 
  </div> 
</form>
</div>

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






