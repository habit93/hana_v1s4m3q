<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
Cookie[] cookies = request.getCookies();
Cookie cookie = null;
String ck_id = "";
String ck_id_save = "";
String ck_passwd = "";
String ck_passwd_save = "";

for (int i=0; i < cookies.length; i++){
  cookie = cookies[i];
  
  if (cookie.getName().equals("ck_id")){
    ck_id = cookie.getValue();         // test1
  }else if(cookie.getName().equals("ck_id_save")){
    ck_id_save = cookie.getValue();  // Y, N
  }else if (cookie.getName().equals("ck_passwd")){
    ck_passwd = cookie.getValue();         // test1@mail.com
  }else if(cookie.getName().equals("ck_passwd_save")){
    ck_passwd_save = cookie.getValue();  // Y, N
  }
}
%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>로그인</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="./login.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<DIV class='title' >회원 로그인</DIV>

<DIV class='content' >
<FORM name='frm' method='POST' action='./login.do'>
    <ul>
      <li>
        <label class='label'  for='id'>아이디</label> <%-- <%=ck_id %> --%>
        <input type='text' name='id' id='id' value='user1' style='width: 20%;' autocomplete="off" required="required">
        <label>
          <%
          if (ck_id_save.equals("Y")){
          %>
            <input type='checkbox' name='id_save' value='Y' checked="checked"> 저장
          <%
          }else{
          %>
            <input type='checkbox' name='id_save' value='Y'> 저장
          <%  
          }
          %>
        </label>
      </li>
      <li> 
        <label class='label' for='passwd'>패스워드</label><%-- <%=ck_passwd %> --%>
        <input type='password' name='passwd' id='passwd' value='1234' style='width: 20%;' autocomplete="off" required="required">
        <label>
          <%
          if (ck_passwd_save.equals("Y")){
          %>
            <input type='checkbox' name='passwd_save' value='Y' checked="checked"> 저장
          <%
          }else{
          %>
            <input type='checkbox' name='passwd_save' value='Y'> 저장
          <%  
          }
          %>
        </label>
      </li>
      <li class='feature'>
        <button type='submit' class="btn-sm">로그인</button>
        <button type='button' class="btn-sm" onclick="location.href='./create.do'">회원가입</button> 
      </li>
    </ul>
</FORM>
</DIV>

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
