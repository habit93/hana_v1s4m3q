<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hana.blog.*" %>
<%@ page import="com.hana.tool.Tool" %>

<% 
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");  
%>

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
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

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
