<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.cart.CartVO" %>

<%
int cartno = (Integer)request.getAttribute("cartno");
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
  <FORM name='frm' method='POST' action='./delete.do'>
  <input type='hidden' id='cartno' name='cartno' value='<%=cartno%>'>
    <fieldset>
      <ul>
        <li>
          쇼핑카트에서 제거하시겠습니까?
        </li>
        <li class = 'right'>
          <button type = "submit">제거</button>
          <button type = "button" onclick = "location.href='./list.do?mno='">취소</button> <!-- 아직 안만듬 -->
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
 