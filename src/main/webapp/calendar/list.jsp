<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file ="ssi.jsp" %>

<%
ArrayList list = dao.list();
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>목록</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV style='text-align: center'>
  <DIV class="title" style='width: 20%;' >목록</DIV>
</DIV> 

<div width="100%" align="center">
  <input type='button' value='등록' 
    onclick="location.href='./createForm.jsp'" />
  <%
  // -------------------------------------------------
  // 달력을 출력하기위한 년월을 생성하는 코드
  // -------------------------------------------------
  Date cal_date = new Date();
  String str = cal_date.toLocaleString();
  // System.out.println("str: " + str);
  
  String y = str.substring(0, 4).trim(); // 2014 년
  String m = str.substring(5, 7).trim(); // 12   월
  // -------------------------------------------------
  %>  
  <input type='button' value='일정표' 
    onclick="location.href='./calendar2.jsp?y=<%=y %>&m=<%=m %>'" />
</div>    

<table style='width: 90%;'>
  <caption>관리자만 접속 가능합니다.</caption>
  <tr bgcolor="#AAAAAA">
    <th width='5%'>캘린더번호</th>
    <th width='15%'>날짜</th>
    <th width='15%'>레이블</th>
    <th width='40%'>제목</th>
  </tr>

<%
int size = list.size();  // 저장된 객체의 수
    
for(int i=0; i<size; i++){
  Object object = list.get(i); // object 타입은 사용 못함.
  CalendarDTO dto = (CalendarDTO)object;
      
  int calendarno = dto.getCalendarno();
  String rdate = dto.getRdate();
  String label = dto.getLabel();
  String title = dto.getTitle();

%> 
  <tr bgcolor="#EEEEEE" 
      onMouseOver="this.style.backgroundColor='#ffffff'" 
      onMouseOut="this.style.backgroundColor='#EEEEEE'"> 

    <td><%=calendarno %></td>
    <td><%=rdate %></td>
    <td class='td'>
      <a href='./read.jsp?calendarno=<%=calendarno %>'><%=label%></a>
    </td>
    <td class='td'>
      <a href='./read.jsp?calendarno=<%=calendarno %>'><%=title%></a>
    </td>


</tr>  
<%
}
%>
</table>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html>



