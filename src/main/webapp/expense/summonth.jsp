<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.expense.ExpenseVO"%>
<%@ page import="com.hana.income.IncomeVO"%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>지출내역</title>
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
ArrayList<IncomeVO> list2 = (ArrayList<IncomeVO>)request.getAttribute("sumlist2");

int ex_sum = 0;
int in_sum = 0;
int total = 0;

  for(int index=0; index < list2.size(); index++){
    IncomeVO invo = list2.get(index);
    in_sum += invo.getIncomemoney();
  }
%>
<div class='title'> 
  <span class='sumin'>총수입 : <%=in_sum %></span><br />
</div>

<!-- 수입 리스트 -->
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>날짜</th>
        <th>수입 내용</th>
        <th>수입 금액</th>
        <th>기타</th>
      </tr>
    </thead>
    <tbody>
    <%
    for(int index=0; index < list2.size(); index++){
      IncomeVO vo = list2.get(index);
      int incomeno = vo.getIncomeno();
    %> 
    <tr> 
      <td><%=vo.getRdate() %></td>
      <td><%=vo.getIncomeitem()%></td>
      <td><%=vo.getIncomemoney() %></td>
      <td> 
        <a href="javascript:update(<%=incomeno%>,'<%=vo.getRdate() %>','<%=vo.getIncomeitem()%>','<%=vo.getIncomemoney()%>')"><img src='./images/update.png' title='수정'></a>
        <a href="javascript:remove(<%=incomeno%>)"><img src='./images/delete.png' title='삭제'></a> 
      </td> 
    </tr>
    <%
     }
    %>
  </tbody>
 </table>
</div>

<%
ArrayList<ExpenseVO> list = (ArrayList<ExpenseVO>)request.getAttribute("sumlist1");
  
  for(int index=0; index < list.size(); index++){
    ExpenseVO exvo = list.get(index);
    ex_sum += exvo.getExpensemoney();
  }
%>

<div class='title'>
  <span class='sumex'>총지출 : <%=ex_sum %></span><br />
</div>

<!-- 지출 리스트 -->
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>날짜</th>
        <th>지출 카테고리</th>
        <th>지출 내용</th>
        <th>지출 금액</th>
        <th>기타</th>
      </tr>
    </thead>
    <tbody>
<%
  for(int index=0; index < list.size(); index++){
    ExpenseVO vo = list.get(index);
    int expenseno = vo.getExpenseno();
%> 
    <tr> 
      <td><%=vo.getRdate() %></td>
      <td><%=vo.getCategoryno() %></td>
      <td><%=vo.getExpenseitem() %></td>
      <td><%=vo.getExpensemoney() %></td>
      <td> 
        <a href="javascript:update(<%=expenseno%>,'<%=vo.getRdate() %>','<%=vo.getCategoryno()%>','<%=vo.getExpenseitem()%>','<%=vo.getExpensemoney()%>')"><img src='./images/update.png' title='수정'></a>
        <a href="javascript:remove(<%=expenseno%>)"><img src='./images/delete.png' title='삭제'></a> 
      </td> 
    </tr>
    <%
     }
    %>
  </tbody>
 </table>
</div>


<div class='title'> 
  <%total = in_sum - ex_sum; %>
  <b>잔액 : <%=total %></b>
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
