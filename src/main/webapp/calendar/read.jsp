<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file="./ssi.jsp" %>

<%
int calendarno = Integer.parseInt(request.getParameter("calendarno"));
CalendarDTO dto = null;
dto = dao.read(calendarno);
%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>일정 조회</title>
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
  <DIV class='feature'> 
    <input type='button' value='수정' class="btn-sm" 
           onclick="location.href='./updateForm.jsp?calendarno=<%=calendarno %>'"> 
    <input type='button' value='삭제' class="btn-sm" 
           onclick="location.href='./deleteForm.jsp?calendarno=<%=calendarno %>'"> 
    <input type='button' value='목록' class="btn-sm" 
           onclick="location.href='./list.jsp'">   
  </DIV>
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










