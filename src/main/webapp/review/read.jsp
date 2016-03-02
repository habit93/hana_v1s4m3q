<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hana.review.*" %>
<%@ page import="com.hana.tool.Tool" %>
<% ReviewVO reviewVO = (ReviewVO)request.getAttribute("reviewVO");  %>

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
    <span style="font: 1em bold; "><%=reviewVO.getTitle() %></span>
    <label style="float: right;"><%=reviewVO.getRdate()%>   
    <A href='./update.do?reviewno=<%=reviewVO.getReviewno()%>'>｜리뷰 수정</A>｜
    <A href='./delete.do?reviewno=<%=reviewVO.getReviewno() %>'>리뷰 삭제</A>
    </label>    
  </div> 
  
  <hr style="width:70%; margin: 0px auto">  
    
  <DIV class='container'> 
    <div class="content"><span><%=reviewVO.getContents() %></span></div> 
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
