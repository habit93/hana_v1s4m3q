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
<title> 수정 </title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV style='text-align: center'>
  <DIV class="title" style='width: 20%;'>일정 수정</DIV>
</DIV> 
    
<FORM name="frm" action="./updateProc.jsp" method="POST">
  <input type='hidden' name='calendarno' value='<%=calendarno %>'>
  
  <table style='border: 0px none #FFFFFF; width: 70%;'>
    <tr>
      <th width='20%'>출력 날짜</th>
      <td width='80%' style='text-align: left; border: 0px none #FFFFFF'>
        <input type='date' name='rdate' value='<%=dto.getRdate() %>' size='10'>
      </td>
    </tr>  
    <tr>
      <th>출력 레이블</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <input type='text' name='label' value='<%=dto.getLabel() %>' size='20'>
      </td>
    </tr>  
    <tr>
      <th>제목</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <input type='text' name='title' value='<%=dto.getTitle() %>' size='50'>     
      </td>
    </tr>
    <tr>
      <th>내용</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <TEXTAREA name='contents' style = 'border:1px solid; width: 100%' rows="10"><%=dto.getContents() %></TEXTAREA>
      </td>
    </tr>      
     
  </table>

  <DIV style='text-align: center; border: 0px none #FFFFFF'>  
    <DIV class='bottom'> 
      <input type='submit' value='수정'>
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












