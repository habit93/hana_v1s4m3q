<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.expense.ExpenseVO"%>
<%@ page import="com.hana.income.IncomeVO" %> 

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/javascript">

$(function(){ 
}); 
 
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
  ArrayList<ExpenseVO> ex_list = (ArrayList<ExpenseVO>)request.getAttribute("ex_list");
  ArrayList<IncomeVO> in_list = (ArrayList<IncomeVO>)request.getAttribute("in_list");
  
  int ex_sum = 0;
  int in_sum = 0;
  int total = 0;
  
  for(int index=0; index < ex_list.size(); index++){
    ExpenseVO exvo = ex_list.get(index);
    ex_sum += exvo.getExpensemoney();
  }
  
  for(int index=0; index < in_list.size(); index++){
    IncomeVO invo = in_list.get(index);
    in_sum += invo.getIncomemoney();
  }
  total = in_sum - ex_sum;
%>

<div class='title'>
  총수입 : <%=in_sum %> <br />
  총지출 : <%=ex_sum %> <br />
  합계 : <%=total %> <br /><br />
  
  <form method="get" action="./summonth.do">
    <input type="month" name="month" id="month">
    <button type='submit' >정산</button> 
  </form>
</div>




<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

