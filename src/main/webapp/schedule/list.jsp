<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.schedule.ScheduleVO"%>

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
  $('#contents').attr('value', '').focus();
}
function create_cancel(){
  $('#panel_frm').hide();
}

function update(scheduleno, rdate, contents){
  $('#panel_frm').show();
  $('#rdate').attr('value', rdate);
  $('#contents').attr('value', contents).focus();
}

function remove(scheduleno){ 
  $('#panel_frm_remove').show();
  $('#scheduleno', frm_remove).attr('value', scheduleno);
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



<!-- 리스트 -->
<div class='content' style='margin: 0px auto;'>
<TABLE class='table' style='width: 100%;'>
  <colgroup> 
    <col style='width: 40%;'/>
    <col style='width: 50%;'/>
    <col style='width: 10%;'/>
  </colgroup>  
  <TR>
    <TH class='th'>날짜</TH>
    <TH class='th'>스케줄내용</TH>
    <TH class='th'>기타</TH>
  </TR>  
  

<%
ArrayList<ScheduleVO> list = (ArrayList<ScheduleVO>)request.getAttribute("list");

for(int index=0; index < list.size(); index++){
  ScheduleVO vo = list.get(index);
  int scheduleno = vo.getScheduleno();
%> 
  <TR> 
    <TD class='td'><%=vo.getRdate() %></TD>
    <TD class='td'><%=vo.getContents() %></TD>
    <TD class='td'> 
      <A href="javascript:update(<%=scheduleno%>,'<%=vo.getRdate() %>', '<%=vo.getContents() %>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=scheduleno%>)"><IMG src='./images/delete.png' title='삭제'></A> 
    </TD> 
   </TR>
<%
  }
%>
</TABLE> 
</div>

<!-- 등록 / 수정--> 
<div id='panel_frm' class='content' >
<form name='frm' method='POST' action="./create.do">      
<input type='hidden' name='mno' id='mno' value='${mno }'>   
<input type='hidden' name='scheduleno' id='scheduleno' value='1'>

<TABLE class='table' style='width: 100%;'>
  <colgroup> 
    <col style='width: 40%;'/>
    <col style='width: 50%;'/>
    <col style='width: 10%;'/> 
  </colgroup>
  <TR>
    <TD class='td'><input type="date" name='rdate' id='rdate' required="required"></TD>
    <TD class='td'><input type='text' name='contents' id='contents' required="required"></TD>
    <TD class='td'>      
      <button type='submit'>등록</button>
      <button type="button" onclick="create_cancel()">취소</button> 
     </TD>
  </TR>
</TABLE>
</form>
</div> 

<!-- 삭제 -->
<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='scheduleno' id='scheduleno'> 
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="remove_cancel()">취소</button>
</FORM>
</DIV>

<DIV class='bottom'>
  <button type='button' onclick="create();">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

