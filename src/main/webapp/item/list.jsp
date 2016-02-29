<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.item.ItemVO" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <title>커플아이템</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
     <link rel="stylesheet" href="../assets/css/main.css" />
     <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script type="text/javascript" src="../js/jquery.cookie.js"></script>
     <script type="text/javascript" src="../js/tool.js"></script>
     <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->
<%
ArrayList<ItemVO> list = (ArrayList<ItemVO>)request.getAttribute("list");
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
%>
 <DIV class="list_center">
  <FORM name='frm' method='post' action='./list.jsp'>

  <DIV style='width: 100%; margin: 0px auto'>
    <%
      for (int index = 0; index < list.size(); index++) {
        ItemVO vo = list.get(index);
        
        if(index != 0 && index % 4 == 0){
          %>
          <DIV style='width: 100%; clear: both;'></DIV> <!-- 경계 -->
          <%
          }
          %>
          <DIV style='margin: 10px 10px 0px 10px; padding: 0px; width: 295px; height: 300px; float: left; '>
    <div class="feature">
      <A href='./read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><IMG src='./storage/<%=vo.getThumb()%>' style='width: 280px; height: 230px'></A><br>
      <A href='./read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><span class="name"><%=vo.getTitle() %></span></A><br> 
      <span class="price"><%=vo.getPrice()%>원</span>
    </div>
     </DIV>
    <%
      }
    %>
    </DIV>
   </FORM>
  </DIV>

  <DIV class='feature' style='clear: both'>
    <button type='button' onclick="location.href='./create.do?categoryno=<%=categoryno%>'">등록</button>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
</body>
<!-- -------------------------------------------- -->
</html>
