<%@ page contentType="text/html; charset=UTF-8"%>

<%@ include file ="ssi.jsp" %>

<%
String rdate = request.getParameter("rdate");
String label = request.getParameter("label");
String title = request.getParameter("title");
String contents = request.getParameter("contents");
int mno = Integer.parseInt(request.getParameter("mno"));

CalendarDTO dto = new CalendarDTO();
dto.setRdate(rdate);
dto.setLabel(label);
dto.setTitle(title);
dto.setContents(contents);
dto.setMno(mno);

int cnt = dao.create(dto);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>등록 처리</title>
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
    out.println("등록 실패했습니다.");
    out.println("<br><br> <input type='button' value='다시 시도' onclick='history.back()'>");
}
%>
</h2>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->




