<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.expense.ExpenseVO"%>
<%@ page import="com.hana.income.IncomeVO"%>

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
ArrayList<ExpenseVO> list = (ArrayList<ExpenseVO>)request.getAttribute("sumlist1");
    
  int ex_sum = 0;
  int in_sum = 0;
  int total = 0;
  
  for(int index=0; index < list.size(); index++){
    ExpenseVO exvo = list.get(index);
    ex_sum += exvo.getExpensemoney();
  }
%>

<div class='title'>
  총지출 : <%=ex_sum %> <br />
</div>

<!-- 지출 리스트 -->
<div class='content' style='margin: 0px auto;'>  
<TABLE class='table' style='width: 100%;'>
  <colgroup> 
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>날짜</TH>
    <TH class='th'>지출 카테고리</TH>
    <TH class='th'>지출내용</TH>
    <TH class='th'>지출금액</TH>
    <TH class='th'>기타</TH>
  </TR>  
  
<%
  for(int index=0; index < list.size(); index++){
    ExpenseVO vo = list.get(index);
    int expenseno = vo.getExpenseno();
%> 

  <TR> 
    <TD class='td'><%=vo.getRdate() %></TD>
    <TD class='td'><%=vo.getCategoryno() %></TD>
    <TD class='td'><%=vo.getExpenseitem() %></TD>
    <TD class='td'><%=vo.getExpensemoney() %></TD>
    <TD class='td'> 
      <A href="javascript:update(<%=expenseno%>,'<%=vo.getRdate() %>','<%=vo.getCategoryno()%>','<%=vo.getExpenseitem()%>','<%=vo.getExpensemoney()%>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=expenseno%>)"><IMG src='./images/delete.png' title='삭제'></A> 
    </TD> 
  </TR>
<%
  }
%>
</TABLE>
</div>




  <%
ArrayList<IncomeVO> list2 = (ArrayList<IncomeVO>)request.getAttribute("sumlist2");
  
  for(int index=0; index < list2.size(); index++){
    IncomeVO invo = list2.get(index);
    in_sum += invo.getIncomemoney();
  }
%>
<div class='title'> 
  총수입 : <%=in_sum %> <br />
</div>

<!-- 수입 리스트 -->
<div class='content' style='margin: 0px auto;'>  
<TABLE class='table' style='width: 100%;'>
  <colgroup> 
    <col style='width: 15%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
    <TR>
    <TH class='th'>날짜</TH>
    <TH class='th'>수입내용</TH>
    <TH class='th'>수입금액</TH>
    <TH class='th'>기타</TH>
  </TR>  
<%
  for(int index=0; index < list2.size(); index++){
    IncomeVO vo = list2.get(index);
    int incomeno = vo.getIncomeno();
%> 

  <TR> 
    <TD class='td'><%=vo.getRdate() %></TD>
    <TD class='td'><%=vo.getIncomeitem()%></TD>
    <TD class='td'><%=vo.getIncomemoney() %></TD>
    <TD class='td'> 
      <A href="javascript:update(<%=incomeno%>,'<%=vo.getRdate() %>','<%=vo.getIncomeitem()%>','<%=vo.getIncomemoney()%>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=incomeno%>)"><IMG src='./images/delete.png' title='삭제'></A> 
    </TD> 
  </TR>
<%
  }
%>
</TABLE>
</div>

<div class='title'> 
  <%total = in_sum - ex_sum; %>
  결과 : <%=total %>
</div>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

