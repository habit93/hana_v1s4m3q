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

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>일정 등록</title>
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

<h2>
<%
if (cnt == 1){
    // out.println("등록했습니다.");
    response.sendRedirect("./calendar.jsp");
}else{
    out.println("등록 실패했습니다.");
    out.println("<br><br> <input type='button' value='다시 시도' onclick='history.back()'>");
}
%>
</h2>

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



