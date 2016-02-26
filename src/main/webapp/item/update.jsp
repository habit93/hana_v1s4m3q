<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.item.ItemVO" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
    <title>수정</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
     <link rel="stylesheet" href="../assets/css/main.css" />
     <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script type="text/javascript" src="../js/jquery.cookie.js"></script>
     <script type="text/javascript" src="../js/tool.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
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
ItemVO itemVO = (ItemVO)request.getAttribute("itemVO");
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
%>

<DIV class='content' style='width: 80%;'>
<FORM name='frm' method='POST' action='./update.do' enctype="multipart/form-data">
    <input type='hidden' id='categoryno' name='categoryno' value='<%=categoryno%>'>
    <input type='hidden' id='itemno' name='itemno' value='<%=itemVO.getItemno()%>'>
    <ul>
      <li>
        <label for='title'>제목</label> 
        <input type='text' name='title' id='title' size='70' value='<%=itemVO.getTitle() %>' required="required">
      </li>
      
      <li>
        <label>가격</label>
        <input type='text' name='price' id='price' size='70' value='<%=itemVO.getPrice()%>' required="required"> 
      </li>
      
      <li>
        <textarea name='content' id='content'  rows='7' style='width: 100%;'><%=itemVO.getContent() %></textarea>
      </li>     
      <li>
        <label class='label' for='fileMF'>Thumb 파일</label>
        <input type="file" name='fileMF' id='fileMF'>
      </li> 
      <li class='feature'>
        <button type="submit">수정</button>
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

