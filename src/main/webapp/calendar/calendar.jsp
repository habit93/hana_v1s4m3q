<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Calendar, java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.hana.tool.Tool" %>
<%@ page import="com.hana.calendar.CalendarDAO, com.hana.calendar.CalendarDTO" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>달력</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
     <link rel="stylesheet" href="../assets/css/main.css" />
     <link rel="Stylesheet" href="../css/calendar.css">
     <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script type="text/javascript" src="../js/jquery.cookie.js"></script>
     <script type="text/javascript" src="../js/tool.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->
<%
Calendar cal = Calendar.getInstance();

int year = 0;
int month = 0;

if (request.getParameter("y") != null){
  year = Integer.parseInt(request.getParameter("y"));  
}else{
  year = cal.get(Calendar.YEAR); // 현재 년도 추출
}

//1월 0부터 시작
if (request.getParameter("m") != null){
  month = Integer.parseInt(request.getParameter("m")) - 1;
}else{
  month = cal.get(Calendar.MONTH); // 현재 월 추출 0 ~  
}
      
// 시작요일 확인
// - Calendar MONTH는 0-11까지임
cal.set(year, month, 1);
int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);

// 다음/이전월 계산
// - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
int prevYear = year;
int prevMonth = (month + 1) - 1;
int nextYear = year;
int nextMonth = (month  + 1) + 1;

// 1월인 경우 이전년 12월로 지정
if (prevMonth < 1) {
  prevYear--;
  prevMonth = 12;
}

// 12월인 경우 다음년 1월로 지정
if (nextMonth > 12) {
  nextYear++;
  nextMonth = 1;
}
%>

<table style='border: 0px none #FFFFFF; width: 80%;'>
  <tr>
    <td style='text-align: center; border: 0px none #FFFFFF;'>
      <a href="./calendar.jsp?y=<%=prevYear%>&m=<%=prevMonth%>">[이전달]</a> 
      <%=year%>년 <%=month+1%>월 
      <a href="./calendar.jsp?y=<%=nextYear%>&m=<%=nextMonth%>">[다음달]</a>
    </td>
  </tr>	
  <tr>
	  <td>
		  <table class='calendar'>
			  <tr>
					<td class='calendar_td' width='14%'>일</td>
					<td class='calendar_td' width='14%'>월</td>
					<td class='calendar_td' width='14%'>화</td>
					<td class='calendar_td' width='14%'>수</td>
					<td class='calendar_td' width='14%'>목</td>
					<td class='calendar_td' width='14%'>금</td>
					<td class='calendar_td' width='16%'>토</td>
				</tr>
				<tr>
				<%
        // 시작요일까지 이동
        for (int i=1; i<bgnWeek; i++){
          out.println("<td class='calendar_td'>&nbsp;</td>");
        }

        // 첫날~마지막날까지 처리
        // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
        String str="";
        ArrayList list = null;
        CalendarDAO dao = new CalendarDAO();
        StringBuffer sb = null;
    
        while (cal.get(Calendar.MONTH) == month) {
          if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){
            out.println("<td class='calendar_td' valign='top' style='color:blue;'>" + cal.get(Calendar.DATE));
          }else if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY){
            out.println("<td class='calendar_td' valign='top' style='color:red;'>" + cal.get(Calendar.DATE));
          }else{
            out.println("<td class='calendar_td' valign='top'>" + cal.get(Calendar.DATE));
          }
        
          // ------------------------------------------------
          // 2010-01-01에 해당하는 일정만 DBMS에서 가져옵니다.
          // ------------------------------------------------
          // str = cal.get(Calendar.YEAR) + "-" + cal.get(Calendar.MONTH) + "-" + cal.get(Calendar.DATE);
          str = Tool.getDate(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE));
          list = dao.listLabel(str);
      
          if (list != null){ 
            sb = new StringBuffer();
            for(int i=0; i<list.size(); i++){
              CalendarDTO dto = (CalendarDTO)list.get(i);
              sb.append("<img src='"+request.getContextPath()+"/calendar/images/bu5.gif'>");
              sb.append("<a href='./read.jsp?calendarno="+dto.getCalendarno()+"'>"+dto.getLabel()+"</a><br>");
            }
        
          }
          out.println("<br><span style='color:#00AA00'>" + sb.toString() + "</span></td>");
          // ------------------------------------------------
      
          // 한달의 마지막 날이 아니면서 토요일인 경우 다음줄로 생성
          // System.out.println(cal.getActualMaximum ( Calendar.DAY_OF_MONTH ));
          if ((cal.getActualMaximum ( Calendar.DAY_OF_MONTH ) != cal.get(Calendar.DATE))) {
            if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY){ // 토요일인 경우
              out.println("</tr><tr>");
            }
          }

          // 날짜 증가시키기
          cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
          // 끝날부터 토요일까지 빈칸으로 처리
      
        }
        //System.out.println("cal.get(Calendar.MONTH): " + cal.get(Calendar.MONTH));
        //System.out.println("cal.get(Calendar.DATE): " + cal.get(Calendar.DATE));
        //System.out.println("cal.get(Calendar.DATE): " + cal.get(Calendar.DATE));
    
        if (cal.get(Calendar.DATE) == 1 && (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY)) {
          // 한달의 마지막 날짜 토요일이면 아무일도 안함
        }else{
          for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) out.println("<td class='calendar_td'>&nbsp;</td>");
        }

%>
		  	</tr>
	  	</table>
  	</td>
	</tr>
</table>

<div class="feature">
  <button type="button" class="btn-sm" onclick="location.href='./createForm.jsp'">등록</button>
  <button type='button' class="btn-sm" onclick="location.reload();">새로고침</button>
</div>

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

