<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.expense.ExpenseVO"%>
<%@ page import="com.hana.category.CategoryVO" %> 

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
  $('#panel_frm').hide(); 
  $('#panel_frm_remove').hide();
}); 
 
function create(){
  $('#panel_frm').show();
  $('#frm').attr('action', './create.do');
  $('#expenseitem').attr('value', '').focus();
  $('#expensemoney').attr('value', '');
  $('#btn').html('등록');
}
function create_cancel(){
  $('#panel_frm').hide();
}

function update(expenseno, rdate, categoryno, expenseitem, expensemoney){
  $('#panel_frm').show();
  $('#frm').attr('action', './update.do');
  $('#expenseno').attr('value', expenseno);
  $('#rdate').attr('value', rdate);
  $('#categoryno').attr('value', categoryno);
  $('#expenseitem').attr('value', expenseitem).focus();
  $('#expensemoney').attr('value', expensemoney);
  $('#btn').html('수정');
}
 
function remove(expenseno){
  $('#panel_frm_remove').show();
  $('#expenseno', frm_remove).attr('value', expenseno);
}

function delete_cancel(){
  $('#panel_frm_remove').hide();
} 

//카테고리 변경
function update_category(expenseno, categoryno){
  var win = window.open("./update_category.do?expenseno="+ expenseno+"&categoryno="+categoryno, "codeno_UPDATE", "width=450,height=400,scrollbars=no,left=525,top=250");

  var x = (screen.width - 450) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

 
 <!-- 삭제 -->
<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='expenseno' id='expenseno'> 
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="remove_cancel()">취소</button>
</FORM>
</DIV>

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
ArrayList<ExpenseVO> list = (ArrayList<ExpenseVO>)request.getAttribute("list");
    
  for(int index=0; index < list.size(); index++){
    ExpenseVO vo = list.get(index);
    int expenseno = vo.getExpenseno();
%> 
  <TR> 
    <TD class='td'><%=vo.getRdate() %></TD> 
    <TD class='td'><A href="#" onclick="update_category(<%=vo.getExpenseno()%>, <%=vo.getCategoryno() %>)"><%=vo.getCategorysort() %></A></TD>
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


<!-- 등록/수정 -->
<div class='content' id='panel_frm' >
<form name='frm' id='frm' method='POST' action="./create.do">  
<input type='hidden' name='mno' id='mno' value='${mno}'>
<input type='hidden' name='expenseno' id='expenseno' value='1'>
<TABLE class='table' style='width: 100%;'>
  <colgroup> 
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup> 
  <TR>
    <TD class='td'><input type="date" name='rdate' id='rdate' required="required"></TD>
    <TD class='td'>
      <input type="text" name='categoryno' id='categoryno'  required="required" list="category"  autocomplete="off">
      <datalist id="category" >
      <%
      ArrayList<CategoryVO> category_list = (ArrayList<CategoryVO>)request.getAttribute("category_list");
      for (int i=0; i<category_list.size(); i++){
        CategoryVO categoryVO = category_list.get(i);
      %>
        <option value="<%=categoryVO.getCategoryno() %>"  ><%=categoryVO.getCategorysort() %></option>
        <%  
        }
        %>
     </datalist>
     </TD>

    <TD class='td'><input type='text' name='expenseitem' id='expenseitem' required="required"></TD>
    <TD class='td'><input type='text' name='expensemoney' id='expensemoney' required="required"></TD>
    <TD class='td'>      
      <button type='submit'  id='btn'>등록</button> 
      <button type="button" onclick="create_cancel()">취소</button> 
     </TD>
  </TR>
</TABLE>
</form>
</div> 

<DIV class='bottom'>
  <button type='button' onclick="create();">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button> <br />
  
  <form method="get" action="./sumlist.do">
    <input type="month" name="month" id="month">
    <button type='submit' >정산</button> 
  </form>
</DIV>



<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

