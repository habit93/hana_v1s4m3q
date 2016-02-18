<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file ="ssi.jsp" %>

<%
int calendarno = Integer.parseInt(request.getParameter("calendarno"));

String rdate = request.getParameter("rdate");
String label = request.getParameter("label");
String title = request.getParameter("title");
String contents = request.getParameter("contents");

CalendarDTO dto = new CalendarDTO();
dto.setCalendarno(calendarno);
dto.setRdate(rdate);
dto.setLabel(label);
dto.setTitle(title);
dto.setContents(contents);

int cnt = dao.update(dto);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>변경 처리</title>
</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<h2>
<%
if (cnt == 1){
  // out.println("등록했습니다.");
  response.sendRedirect("./list.jsp");
}else{
  out.println("변경 실패했습니다.");
  out.println("<br><br> <input type='button' value='다시 시도' onclick='history.back()'>");
}
%>
</h2>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->

