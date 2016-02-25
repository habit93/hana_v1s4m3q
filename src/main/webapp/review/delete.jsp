<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.review.ReviewVO" %>

<%
int reviewno = (Integer)request.getAttribute("reviewno");
%>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">

</script>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

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
</body>
<!-- -------------------------------------------- -->
</html> 
 