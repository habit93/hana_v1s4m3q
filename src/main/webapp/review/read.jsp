<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hana.review.*" %>
<%@ page import="com.hana.tool.Tool" %>

<% 
ReviewVO reviewVO = (ReviewVO)request.getAttribute("reviewVO");  
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

  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="blogno" value="<%=reviewVO.getReviewno() %>">
     
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='title' class="label" style="width:150px;">제목 : </label>
            <span><%=reviewVO.getTitle() %></span><br>
          </li>
          <li>
            <label for='content' class="label" style="width:150px;">내용 : </label>
            <span><%=reviewVO.getContents() %></span>
          </li>
          <li>
            <label for="rdate" class="label" style="width:150px;">등록일 : </label>
            <span><%=reviewVO.getRdate() %></span>
          </li>
          <li>
            <label for="itemno" class="label" style="width:150px;">아이템 번호 : </label>
            <span><%=reviewVO.getItemno()%></span>
          </li>
          <li>
            <label for="mno" class='label' style="width:150px;">멤버 번호 : </label>
            <span><%=reviewVO.getMno()%></span>
          </li>
          <li>
            <a href="./update.do?reviewno=<%=reviewVO.getReviewno() %>"><img src="./images/update.png" title="수정" border='0'/></a>
            <a href="./delete.do?reviewno=<%=reviewVO.getReviewno() %>"><img src="./images/delete.png" title="삭제"  border='0'/></a>
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
