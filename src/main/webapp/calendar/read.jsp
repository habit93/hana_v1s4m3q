<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="./ssi.jsp" %>

<%
int calendarno = Integer.parseInt(request.getParameter("calendarno"));

CalendarDTO dto = null;
dto = dao.read(calendarno);
%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>조회</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV style='text-align: center'>
  <DIV class="title" style='width: 20%;'>조회</DIV>
</DIV> 
    
<table style='border: 0px none #FFFFFF; width: 70%;'>
  <tr>
    <th width='20%'>출력 날짜</th>
    <td width='80%' style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getRdate() %>
    </td>
  </tr>  
  <tr>
    <th>출력 레이블</th>
    <td style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getLabel() %>
    </td>
  </tr>  
  <tr>
    <th>제목</th>
    <td style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getTitle() %>      
     </td>
  </tr>
  <tr>
    <th>내용</th>
    <td style='text-align: left; border: 0px none #FFFFFF'>
      <%=dto.getContents() %>
    </td>
  </tr>      
   
</table>

<DIV style='text-align: center; border: 0px none #FFFFFF'>  
  <DIV class='bottom'> 
    <input type='button' value='수정'
           onclick="location.href='./updateForm.jsp?calendarno=<%=calendarno %>'"> 
    <input type='button' value='삭제'
           onclick="location.href='./deleteForm.jsp?calendarno=<%=calendarno %>'"> 
    <input type='button' value='목록'
           onclick="location.href='./list.jsp'">   
  </DIV>
</DIV>
  

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->












