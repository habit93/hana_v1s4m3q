<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="com.hana.blog.BlogVO" %>
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
  CKEDITOR.replace('content');
});
</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%  
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");
%>
<div class='content_menu'>
  <A href='./list2.do?blogcategory=<%=blogVO.getBlogcategoryno() %>'>${title } 게시판</A>
</div> 
<DIV class='content' style='width: 80%;'>
  <FORM name='frm' method='POST' action='./update.do'
             enctype="multipart/form-data">
    <input type='hidden' name='blogno' id='blogno' value='<%=blogVO.getBlogno() %>'>
    <input type="hidden" name="blogcategoryno" value="<%=blogVO.getBlogcategoryno() %>">
  
    <ul>
      <li>
        <label for='title'>제목</label>
        <input type='text' name='title' size='80' id='title' value='<%=blogVO.getTitle() %>' required="required">
      </li>
      <li>
        <textarea name='content' id='content'  rows='10' style='width: 100%;'><%=blogVO.getContent() %></textarea>
      </li>
      <li>
        <label for='file'>Thumb 파일</label>
        <%
        if (Tool.checkNull(blogVO.getFile()).length() > 0){
          out.println("등록된 파일명: " + blogVO.getFile());
        }
        %>
        <input type="file" name='fileMF' id='fileMF' value='<%=Tool.checkNull(blogVO.getFile()) %>'>
      </li>
      <li class='right'>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='./list2.do?blogcategoryno=<%=blogVO.getBlogcategoryno() %>'">목록</button>
      </li>         
    </ul>
  </FORM>
</DIV>
 
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 
