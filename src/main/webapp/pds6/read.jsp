<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>조회</title>
<script type="text/javascript">

</script>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
     <link rel="stylesheet" href="../assets/css/main.css" />
     <script type="text/javascript" src="../js/jquery.cookie.js"></script>
     <script type="text/javascript" src="../js/tool.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
int blogreplyno = Integer.parseInt(request.getParameter("blogreplyno"));
int blogno = Integer.parseInt(request.getParameter("blogno"));
Pds6DTO pds6DTO = pds6DAO.read(blogreplyno); // 조회
%>

<FORM name='frm'>
  <TABLE class='table'>
    <tr>
      <TD>
        제목 <%=pds6DTO.getTitle() %> 
      </TD>
    </tr>
    <tr>
      <TD>
        내용 <%=pds6DTO.getContent() %> 
      </TD>
    </tr>
    <tr>
      <TD>
        작성일 <%=pds6DTO.getRdate() %> |
      </TD>
    </tr>
  </TABLE>
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='./list.jsp'">
    <input type='button' value='답변' onclick="location.href='./reply_form.jsp?blogreplyno=<%=blogreplyno %>&blogno=<%=blogno%>'">
    <input type='button' value='수정' onclick="location.href='./update_form.jsp?blogreplyno=<%=blogreplyno %>'">
    <input type='button' value='삭제' onclick="location.href='./delete_form.jsp?blogreplyno=<%=blogreplyno %>'">
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
</body>
<!-- ------------------------------------------- -->
</html>






