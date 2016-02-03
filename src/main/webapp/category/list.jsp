<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
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
  $('#panel_frm_create').hide();
  $('#panel_frm_update').hide();
  $('#panel_frm_remove').hide();
});

function create(){
  $('#panel_frm_create').show();
  $('#categorysort').attr('value', '').focus();
}
function create_cancel(){
  $('#panel_frm_create').hide();
}
 
function update(categoryno, categorysort){
  $('#panel_frm_update').show();
  $('#categoryno').attr('value', categoryno);
  $('#categorysort_update').attr('value', categorysort).focus(); 
}
function update_cancel(){
  $('#panel_frm_update').hide();
}

function remove(categoryno){ 
  $('#panel_frm_remove').show();
  $('#categoryno', frm_remove).attr('value', categoryno);
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

<DIV class='title'>지출 카테고리 목록</DIV>

<!-- 등록-->
<DIV id='panel_frm_create' class='content' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 70%; text-align: center;'>
  <form name='frm_create' id='frm_create' method='POST' action="./create.do" style="text-align: center;">
    <label for='categorysort'>지출 카테고리</label> 
    <input type='text' name='categorysort' id='categorysort' required="required">             
    <button type='submit'>등록</button>
        <button type="button" onclick="create_cancel()">취소</button> 
  </form>
</DIV>
    
<!--수정-->
<DIV id='panel_frm_update' class='content' style='padding: 10px 0px 10px 0px; background-color: #DDDDDD; width: 70%; text-align: center;'>
  <form name='frm_update' id='frm_update' method='POST' action="./update.do">
    <input type='hidden' name='categoryno' id='categoryno'>   
    <input type='text' name='categorysort_update' id='categorysort_update' required="required">
    <button type='submit' id='submit'>저장</button>
    <button type="button" onclick="update_cancel()">취소</button> 
  </FORM>
</DIV>

<!-- 삭제 -->
<DIV id='panel_frm_remove' class='content' style='padding: 10px 0px 10px 0px; background-color: #FFFF00; width: 70%; text-align: center;'>
<FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
  <input type='hidden' name='categoryno' id='categoryno'> 
  삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
  <button type="submit" id='submit'>삭제</button>
  <button type="button" onclick="remove_cancel()">취소</button>
</FORM>
</DIV>

<!-- 리스트 -->
<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 70%;'/>
    <col style='width: 20%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>지출 카테고리</TH>
    <TH class='th'>기타</TH>
  </TR>
<%
ArrayList<CategoryVO> list = (ArrayList<CategoryVO>)request.getAttribute("list");

for(int index=0; index < list.size(); index++){
  CategoryVO vo = list.get(index);
  int categoryno = vo.getCategoryno();
%> 
  <TR> 
    <TD class='td'><%=categoryno %></TD>
    <TD class='td'><%=vo.getCategorysort() %></TD>
    <TD class='td'>
      <A href="javascript:update(<%=categoryno%>, '<%=vo.getCategorysort() %>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=categoryno%>)"><IMG src='./images/delete.png' title='삭제'></A> 
    </TD>
  </TR>
<%
}
%>
</TABLE>
  
<DIV class='bottom'>
  <button type='button' onclick="create();">등록</button>
  <button type='button' onclick="location.reload();">새로고침</button>
  <button type='button' onclick="location.href='../income/list.do'">수입목록</button>
  <button type='button' onclick="location.href='../expense/list.do'">지출목록</button>
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



