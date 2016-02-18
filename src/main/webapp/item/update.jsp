<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.item.ItemVO" %>

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
      <li class='right'>
        <button type="submit">수정</button>
      </li>         
    </ul>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 

