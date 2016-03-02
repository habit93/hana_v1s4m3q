<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 
 
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
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
int blogreplyno = Integer.parseInt(request.getParameter("blogreplyno"));

Pds6DTO pds6DTO = pds6DAO.read(blogreplyno); // 조회
%>

<DIV class='title'>정말로 삭제하시겠습니까?</DIV> 

<FORM name='frm' method='POST' action='./delete_proc.jsp'>
  <input type='hidden' name='blogreplyno' value='<%=blogreplyno %>'>
  <input type='hidden' name='col' value='<%=col %>'>
  <input type='hidden' name='word' value='<%=word %>'>
  <input type='hidden' name='nowPage' value='<%=nowPage %>'>
  
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TD colspan='3'><%=pds6DTO.getContent() %></TD>
    </TR>
    <TR>
      <TH class='th'>패스워드</TH>
      <TD colspan="3"><input type='password' name='passwd' style='width: 100%;' value='<%=pds6DTO.getPasswd() %>'></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='삭제 진행'>
    <input type='button' value='취소' onclick="location.href='./list.jsp'"> 
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






