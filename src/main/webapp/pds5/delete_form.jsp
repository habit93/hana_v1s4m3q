<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 
 
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>Q&A 수정 결과</title>
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

<%
int qano = Integer.parseInt(request.getParameter("qano"));
Pds5DTO pds5DTO = pds5DAO.read(qano); // 조회
%>

<DIV class='title'>정말로 삭제하시겠습니까?</DIV> 

<FORM name='frm' method='POST' action='./delete_proc.jsp'>
  <input type='hidden' name='qano' value='<%=qano %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>
  
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TH class='th'>제목</TH>
      <TD colspan='3'><%=pds5DTO.getTitle() %></TD>
    </TR>
    <TR>
      <TH class='th'>패스워드</TH>
      <TD colspan="3"><input type='password' name='passwd' style='width: 100%;' value='<%=pds5DTO.getPasswd() %>'></TD>
    </TR>
  </TABLE>
  <DIV class='feature'>
    <input type='submit' class="btn-sm" value='삭제 진행'>
    <input type='button' class="btn-sm" value='취소' onclick="location.href='./list.jsp'"> 
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




