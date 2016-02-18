<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>
<script type="text/javascript">
  function print(bbsno){
    var str = './print.jsp?qano=' + qano;
    window.open(str, "print", ('scrollbars=yes, resizeable=no, width=800, height=700'));
  }
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
int qano = Integer.parseInt(request.getParameter("qano"));
Pds5DTO pds5DTO = pds5DAO.read(qano); // 조회
%>

<FORM name='frm'>
  <TABLE class='table'>
    <tr>
      <TD>
        제목 <%=pds5DTO.getTitle() %> 
      </TD>
    </tr>
    <tr>
      <TD>
        내용 <%=pds5DTO.getContent() %> 
      </TD>
    </tr>
    <tr>
      <TD>
        작성일 <%=pds5DTO.getRdate() %> |
      </TD>
    </tr>
  </TABLE>
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' value='답변' onclick="location.href='./reply_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' value='수정' onclick="location.href='./update_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' value='삭제' onclick="location.href='./delete_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
  </DIV> 
</FORM>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>






