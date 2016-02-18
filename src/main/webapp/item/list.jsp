<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.item.ItemVO" %>
<%
  request.setCharacterEncoding("UTF-8");
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->
<%
ArrayList<ItemVO> list = (ArrayList<ItemVO>)request.getAttribute("list");
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
%>
 <DIV class='content' >
  <FORM name='frm' method='post' action='./list.jsp'>

 <DIV style='width: 100%; clear: both; height: 1px; border-bottom: dotted 1px black;'></DIV> <!-- 경계 -->
  <DIV style='width: 100%; margin: 0px auto'>
    <%
      for (int index = 0; index < list.size(); index++) {
        ItemVO vo = list.get(index);
        
        if(index != 0 && index % 4 == 0){
          %>
          <DIV style='width: 100%; clear: both; height: 1px; border-bottom: dotted 1px black;'></DIV> <!-- 경계 -->
          <%
          }
          %>
          <DIV style='margin: 0px 10px 0px 10px; padding: 20px; width: 167px; height: 200px; float: left; '>
  
    <A href='./read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><IMG src='./storage/<%=vo.getThumb()%>' style='width: 215px; height: 150px'></A>
    <br>
    <A href='./read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><%=vo.getTitle() %></A>
    <br>
    <%=vo.getPrice()%>
     </DIV>
    <%
      }
    %>

     <DIV style='width: 100%; clear: both; height: 1px; border-bottom: dotted 1px black;'></DIV> <!-- 경계 -->
    </DIV>
   </FORM>
  </DIV>

  <DIV class='bottom'>
    <button type='button' onclick="location.href='./create.do?categoryno=<%=categoryno%>'">등록</button>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>
