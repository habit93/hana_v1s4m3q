<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.hana.expense.ExpenseVO"%>
<%@ page import="com.hana.income.IncomeVO" %> 
<%@ page import="java.text.SimpleDateFormat"%>
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
<script type="text/javascript">

/* window.onload = function(){
  var today = new Date();
  var y = today.getYear()
  var d = today.getMonth();
  docoment.getElementById('month').innerHTML = y + d;
}
  */
/* $(function(){
  var today = new Date();
  var d = today.getMonth();
  $('#month').attr('value', d);
}); */

</script>
  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->
<%
  ArrayList<ExpenseVO> ex_list = (ArrayList<ExpenseVO>)request.getAttribute("ex_list");
  ArrayList<IncomeVO> in_list = (ArrayList<IncomeVO>)request.getAttribute("in_list");
  // 밑에 세줄 오늘 날짜 출력 value에 today 넣으면 끝
  SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
  Date date = new Date(); //오늘날짜생성
  String today = sd.format(date); //date -> string
  
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

<div class="title">  
  <span style="color:blue;">총수입 : <%=in_sum %></span><br />
  <span style="color:red;">총지출 : <%=ex_sum %></span><br />
  <b>잔액 : <%=total %></b><br /><br /> 
  
  <form name='frm' method="get" action="./summonth.do">
    <input type="month" class="input-sm" name="month" id="month" value='<%=today %>'>
    <button type='submit' class="btn-sm">정산</button>
  </form>
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

