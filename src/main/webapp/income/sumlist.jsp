<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.income.IncomeVO"%>


<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>월 수입 내역</title>
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


<!-- 리스트 -->
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>수입 내용</th>
        <th>수입 금액</th>
        <th>기타</th>
      </tr>
    </thead>
    <tbody>
<%
ArrayList<IncomeVO> list = (ArrayList<IncomeVO>)request.getAttribute("sumlist");
  
  int in_sum = 0;
  String mdate = null;
  
  for(int index=0; index < list.size(); index++){
    IncomeVO invo = list.get(index);
    in_sum += invo.getIncomemoney();
  }
  for(int index=0; index < list.size(); index++){
    IncomeVO vo = list.get(index);
    int incomeno = vo.getIncomeno();
    mdate = vo.getRdate();
%> 
  <TR> 
    <TD class='td'><%=vo.getRdate() %></TD>
    <TD class='td'><%=vo.getIncomeitem()%></TD>
    <TD class='td'><%=vo.getIncomemoney() %></TD>
    <TD class='td'> 
      <A href="javascript:update(<%=incomeno%>,'<%=vo.getRdate() %>','<%=vo.getIncomeitem()%>','<%=vo.getIncomemoney()%>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=incomeno%>)"><IMG src='./images/delete.png' title='삭제'></A> 
      </td> 
    </tr>
    <%
     }
    %>
  </tbody> 
 </table>
</div>

<div class='title'>
  <%=mdate%> 총 수입 : <%=in_sum %> <br />
</div>


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

