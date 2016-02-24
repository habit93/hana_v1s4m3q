<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>지출내역 변경</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <style type="text/css">
      body { background:#171717; color: white;}
    </style>
    
<script type="text/javascript">
$(function(){
  var cnt = ${cnt};
  if (cnt == 1){
    opener.location.reload();
    window.close();    
  }
});

function popup_close(){
  window.close(); 
}
</script>

  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->
<%
ArrayList<String> msgs = (ArrayList<String>)request.getAttribute("msgs");
ArrayList<String> links = (ArrayList<String>)request.getAttribute("links");
%> 
<DIV class='content' style='margin: 40px auto;'>
  <fieldset>
    <ul>
    <%
    for(int i=0; i<msgs.size(); i++){
      %>
       <li class='none' style='margin-top: 1em;'><%=msgs.get(i) %></li>
      <%
    }
    %>
    <li class='none' style='margin-top: 1em; margin-bottom: 1em;'>
     <%
        for(int i=0; i<links.size(); i++){
      %>
        <%=links.get(i) %>
      <%
        }
       %>
    </li>
   
    </ul>
  </fieldset>
</DIV>
 
<!-- --------------------------------------------------------- -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
  </body>
<!-- --------------------------------------------------------- -->
</html>

