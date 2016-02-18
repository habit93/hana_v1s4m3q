<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hana.blog.*" %>
<%@ page import="com.hana.tool.Tool" %>

<% 
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");  
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->
  <div class='content_menu'>
    <A href='./list2.do?blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>${title } 게시판</A>｜
    <A href='./update.do?blogno=<%=blogVO.getBlogno()%>&blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>글 수정</A>｜
    <A href='./delete.do?blogno=<%=blogVO.getBlogno()%>&blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>글 삭제</A>
  </div> 
  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="blogno" value="<%=blogVO.getBlogno() %>">
     
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='title' class="label" style="width:150px;">제목 : </label>
            <span><%=blogVO.getTitle() %></span><br>
          </li>
          <li>
            <label for="file" class="label" style="width:120px;">Thumb 파일 : </label>
            <%=Tool.checkNull(blogVO.getFile()) %><br>
          </li>
          <li>
            <label for='content' class="label" style="width:150px;">내용 : </label>
            <span><%=blogVO.getContent() %></span>
          </li>
          <li>
            <label for="rdate" class="label" style="width:150px;">등록일 : </label>
            <span><%=blogVO.getRdate().substring(0, 16) %></span>
          </li>
          <li>
            <label for="good" class="label" style="width:150px;">추천 수 : </label>
            <span><%=blogVO.getGood()%></span>
          </li>
          <li>
            <label for="good" class="label" style="width:150px;">댓글 수 : </label>
            <span><%=blogVO.getReplycnt()%></span>
          </li>
          <li>
            <label for="" class='label' style="width:150px;">블로그 카테고리 번호 : </label>
            <span><%=blogVO.getBlogcategoryno() %></span>
          </li>
        </ul>
      </fieldset>
    </FORM>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

