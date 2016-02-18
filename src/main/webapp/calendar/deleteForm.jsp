<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file ="ssi.jsp" %>

<%     
int calendarno = Integer.parseInt(request.getParameter("calendarno"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV style='text-align: center'>
  <DIV class="title" style='width: 20%;'>삭제</DIV>
</DIV> 
    
<DIV class='content'>
  삭제하시겠습니까? 삭제되면 복구 될 수 없습니다.<br>
</DIV>

<FORM name="frm" action="./deleteProc.jsp" method="POST">
  <input type='hidden' name='calendarno' value="<%=calendarno %>" />
   
  <DIV style='text-align: center; border: 0px none #FFFFFF'>  
    <DIV class='bottom'> 
    <input type='submit' value='삭제'> 
    <input type='button' value='목록'
           onclick="location.href='./list.jsp'">   
    </DIV>
  </DIV>
</FORM>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->












