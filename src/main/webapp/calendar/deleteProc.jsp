<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file ="ssi.jsp" %>

<%
int calendarno = Integer.parseInt(request.getParameter("calendarno"));
int cnt = dao.delete(calendarno);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>삭제 처리</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV style='text-align: center'>
  <DIV class="title" style='width: 20%;'>삭제 처리</DIV>
</DIV> 

<DIV class='content'>
  <%
  if (cnt == 1){
    // out.println("삭제 했습니다.<br><br>");
    response.sendRedirect("./list.jsp");
  }else{
    out.println("삭제 실패했습니다.");
    out.println("<br><br> <input type='button' value='다시 시도' onclick='history.back()'>");
  }
  %>
  <input type='button' value='목록' 
         onclick="location.href='./list.jsp'">

</DIV>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->




