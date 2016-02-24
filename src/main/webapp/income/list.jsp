<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.income.IncomeVO"%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>수입내역</title>
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
  $('#incomeitem').attr('value', '').focus();
  $('#incomemoney').attr('value', '');
  $('#btn').html('등록');
}
function create_cancel(){
  $('#panel_frm').hide();
}

function update(incomeno, rdate, incomeitem, incomemoney){
  $('#panel_frm').show();
  $('#frm').attr('action', './update.do');
  $('#incomeno').attr('value', incomeno);
  $('#rdate').attr('value', rdate);
  $('#incomeitem').attr('value', incomeitem).focus();
  $('#incomemoney').attr('value', incomemoney);
  $('#btn').html('수정');
}

function remove(incomeno){
  $('#panel_frm_remove').show();
  $('#incomeno', frm_remove).attr('value', incomeno);
}

function remove_cancel(){
  $('#panel_frm_remove').hide();
}
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<!-- 삭제 -->
<div id='panel_frm_remove'>
<form name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='incomeno' id='incomeno'> 
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
        <th>번호</th>
        <th>수입 내용</th>
        <th>수입 금액</th>
        <th>기타</th>
      </tr>
    </thead>
    <tbody>
    <%
    ArrayList<IncomeVO> list = (ArrayList<IncomeVO>)request.getAttribute("list");

    for(int index=0; index < list.size(); index++){
      IncomeVO vo = list.get(index);
      int incomeno = vo.getIncomeno();
    %> 
    <tr>
      <td><%=vo.getRdate() %></td>
      <td><%=vo.getIncomeitem() %></td>
      <td><%=vo.getIncomemoney() %></td>
      <td> 
        <a href="javascript:update(<%=incomeno%>,'<%=vo.getRdate() %>', '<%=vo.getIncomeitem() %>','<%=vo.getIncomemoney()%>')"><img src='./images/update.png' title='수정'></a>
        <a href="javascript:remove(<%=incomeno%>)"><img src='./images/delete.png' title='삭제'></a> 
      </td> 
    </tr>
    <%
     }
    %>
  </tbody>
 </table>
</div>

<!-- 등록/수정 -->
<div class="container" id='panel_frm' >
  <form name='frm' id='frm' method='POST' action="./create.do">  
  <input type='hidden' name='incomeno' id='incomeno' value='1'>        
  <input type='hidden' name='mno' id='mno' value='${mno}'>
  <table class="table table-hover">
    <tr>
      <td><input type="date" name='rdate' id='rdate' required="required"></td>
      <td><input type='text' name='incomeitem' id='incomeitem' required="required"></td>
      <td><input type='text' name='incomemoney' id='incomemoney' required="required"></td>
      <td>      
        <button type='submit'  id='btn'>등록</button> 
        <button type="button" onclick="create_cancel()">취소</button> 
     </td>
   </tr>
 </table>
 </form>
</div>

<div class='feature'>
  <button type='button' class="btn-sm" onclick="create();">등록</button>
  <button type='button' class="btn-sm" onclick="location.reload();">새로 고침</button><br /><br /> 
  <form method="get" action="./sumlist.do">
    <input type="month" name="month" id="month">
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

