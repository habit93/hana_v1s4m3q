<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<script type="text/javascript" src="<%=request.getContextPath() %>/ckeditor/ckeditor.js"></script>

<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>
<head>
<meta charset="UTF-8">
<title>등록</title>
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
int blogno = Integer.parseInt(request.getParameter("blogno"));
%>
<DIV class='title'>등록</DIV> 

<FORM name='frm' method='POST' action='./create_proc.jsp'>
  <input type='hidden' id='blogno' name='blogno' value='<%=blogno%>'>
  <input type='hidden' id='rname' name='rname' value='${id }'>
  <TABLE class='table' style='width: 70%;'>
    <TR>
      <TH class='th'>제목</TH>
      <TD colspan='3'><input type='text' name='title' value='비가와야...' style='width: 100%;'></TD>
    </TR>
    <TR>
      <TD colspan='4' style='text-align: right;'>
        <TEXTAREA name='content' rows='10' style='width: 100%;'>손을 청결히...</TEXTAREA>
      </TD>
    </TR>
    <TR>
      <TH class='th'>패스워드</TH>
      <TD><input type='password' name='passwd' style='width: 100%;' value='123'></TD>
    </TR>
  </TABLE>
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='button' value='취소' onclick="location.href='./list.jsp'"> 
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






