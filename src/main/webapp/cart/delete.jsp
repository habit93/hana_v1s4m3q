<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.cart.CartVO" %>
<% int cartno = (Integer)request.getAttribute("cartno"); %>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>Q&A 조회</title>
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

<DIV class = 'container'>
  <FORM name='frm' method='POST' action='./delete.do'>
  <input type='hidden' id='cartno' name='cartno' value='<%=cartno%>'>
  <div class="content">쇼핑카트에서 제거하시겠습니까?</div> 
  <div class="feature">
	  <button type ="submit" class="btn-sm">제거</button>
	  <button type ="button" class="btn-sm" onclick = "location.href='./list.do?mno='">취소</button>
  </div>
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
 