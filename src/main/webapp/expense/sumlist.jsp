<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.expense.ExpenseVO"%>



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


<!-- 리스트 -->
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
ArrayList<ExpenseVO> list = (ArrayList<ExpenseVO>)request.getAttribute("sumlist");
    
  int ex_sum = 0;
  String mdate = null;
  
  for(int index=0; index < list.size(); index++){
    ExpenseVO exvo = list.get(index);
    ex_sum += exvo.getExpensemoney();
  }
  
  for(int index=0; index < list.size(); index++){
    ExpenseVO vo = list.get(index);
    int expenseno = vo.getExpenseno();
    mdate = vo.getRdate();
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

<div class='title'>
<%=mdate %> 총 지출 : <%=ex_sum %> <br />
</div>


<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

