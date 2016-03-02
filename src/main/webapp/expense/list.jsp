<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.expense.ExpenseVO"%>
<%@ page import="com.hana.category.CategoryVO" %> 
<%@ page import="java.util.Date" %> 
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
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

 
 <!-- 삭제 -->
<div id='panel_frm_remove'>
<form name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='expenseno' id='expenseno'> 
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="remove_cancel()">취소</button>
</form>
</div>

<!-- 리스트 -->
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
    ArrayList<ExpenseVO> list = (ArrayList<ExpenseVO>)request.getAttribute("list");
    
    for(int index=0; index < list.size(); index++){
     ExpenseVO vo = list.get(index);
     int expenseno = vo.getExpenseno();
    %> 
    <tr>
      <td><%=vo.getRdate() %></td> 
      <td><a href="#" onclick="update_category(<%=vo.getExpenseno()%>, <%=vo.getCategoryno() %>)"><%=vo.getCategorysort() %></a></td> 
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

<%
  SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM");
  SimpleDateFormat sd2 = new SimpleDateFormat("yyyy-MM-dd");
  Date date = new Date(); //오늘날짜생성
  
  String today = sd.format(date); //date -> string
  String today2 = sd2.format(date);
  %>
<!-- 등록/수정 -->
<div class="container" id='panel_frm' >
  <form name='frm' id='frm' method='POST' action="./create.do">  
  <input type='hidden' name='mno' id='mno' value='${mno}'>
  <input type='hidden' name='expenseno' id='expenseno' value='1'>
  <table class="table table-hover">
    <tr> 
      <td><input type="date" class="input-sm" name='rdate' id='rdate' value='<%=today2 %>'required="required"></TD>
      <td>
       <input type="text" class="input-sm"  name='categoryno' id='categoryno'  required="required" list="category"  autocomplete="off">
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
      </td>
      <td><input type='text' class="input-sm" name='expenseitem' id='expenseitem' required="required"></td>
      <td><input type='text' class="input-sm" name='expensemoney' id='expensemoney' required="required"></td>
      <td>      
        <button type='submit'  class="btn-sm" id='btn'>등록</button> 
        <button type="button" class="btn-sm" onclick="create_cancel()">취소</button> 
     </td>
   </tr>
 </table>
 </form>
</div>

<div class="feature">
  <button type='button' class="btn-sm" onclick="create();">등록</button>
  <button type='button' class="btn-sm" onclick="location.reload();">새로 고침</button><br /><br />
  <form method="get" action="./sumlist.do">
    <input type="month" class="input-sm" name="month" id="month" value='<%=today%>'>
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

