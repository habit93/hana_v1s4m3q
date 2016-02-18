<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
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
<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='incomeno' id='incomeno'> 
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
  </colgroup>  
  <TR>
    <TH class='th'>날짜</TH>
    <TH class='th'>수입내용</TH>
    <TH class='th'>수입금액</TH>
    <TH class='th'>기타</TH>
  </TR>  
  

<%
ArrayList<IncomeVO> list = (ArrayList<IncomeVO>)request.getAttribute("list");

for(int index=0; index < list.size(); index++){
  IncomeVO vo = list.get(index);
  int incomeno = vo.getIncomeno();
%> 
  <TR> 
    <TD class='td'><%=vo.getRdate() %></TD>
    <TD class='td'><%=vo.getIncomeitem() %></TD>
    <TD class='td'><%=vo.getIncomemoney() %></TD>
    <TD class='td'> 
      <A href="javascript:update(<%=incomeno%>,'<%=vo.getRdate() %>', '<%=vo.getIncomeitem() %>','<%=vo.getIncomemoney()%>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=incomeno%>)"><IMG src='./images/delete.png' title='삭제'></A> 
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
<input type='hidden' name='incomeno' id='incomeno' value='1'>        
<input type='hidden' name='mno' id='mno' value='${mno}'>
<TABLE class='table' style='width: 100%;'>
  <colgroup> 
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
  </colgroup> 
  <TR>
    <TD class='td'><input type="date" name='rdate' id='rdate' required="required"></TD>
    <TD class='td'><input type='text' name='incomeitem' id='incomeitem' required="required"></TD>
    <TD class='td'><input type='text' name='incomemoney' id='incomemoney' required="required"></TD>
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
  <button type='button' onclick="location.reload();">새로 고침</button>
  
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

