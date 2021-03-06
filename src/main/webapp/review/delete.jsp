<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.review.ReviewVO" %>

<%
int reviewno = (Integer)request.getAttribute("reviewno");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <title>커플아이템</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
     <link rel="stylesheet" href="../assets/css/main.css" />
     <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script type="text/javascript" src="../js/jquery.cookie.js"></script>
     <script type="text/javascript" src="../js/tool.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->

<div class="title">리뷰 삭제</div>

<DIV class = 'content'>
  <FORM name='frm' method='POST' action='../review/delete.do'>
    <input type='hidden' name='reviewno' id='reviewno'  value='<%=reviewno%>'>
    
    <fieldset>
      <ul>
        <li>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.
        </li>
        <li class = 'right'>
          <button type = "submit">삭제 진행</button>
          <button type = "button" onclick = "location.href='./list'">취소</button>
         </li>
      </ul>
    </fieldset>
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
 