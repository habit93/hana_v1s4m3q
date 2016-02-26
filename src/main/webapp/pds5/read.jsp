<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>Q&A 조회</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  function print(bbsno){
    var str = './print.jsp?qano=' + qano;
    window.open(str, "print", ('scrollbars=yes, resizeable=no, width=800, height=700'));
  }
</script>

  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<%
int qano = Integer.parseInt(request.getParameter("qano"));
Pds5DTO pds5DTO = pds5DAO.read(qano); // 조회
%>

<FORM name='frm'>
  <TABLE class='table'>
    <tr>
      <TD>
        <%=pds5DTO.getTitle() %>   | 작성일 <%=pds5DTO.getRdate() %>
      </TD>
    </tr>
    <tr>
      <TD>
        <%=pds5DTO.getContent() %> 
      </TD>
    </tr>
  </TABLE>
  <DIV class='feature'>
    <input type='button' class="btn-sm" value='목록' onclick="location.href='./list.jsp?col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' class="btn-sm" value='답변' onclick="location.href='./reply_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' class="btn-sm" value='수정' onclick="location.href='./update_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
    <input type='button' class="btn-sm" value='삭제' onclick="location.href='./delete_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'">
  </DIV> 
</FORM>

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






