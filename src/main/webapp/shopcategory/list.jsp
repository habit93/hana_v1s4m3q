<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.shopcategory.ShopcategoryVO" %>
<%@ page import="com.hana.shopcode.ShopcodeVO" %>
<%@ page import="com.hana.shopcode.ShopcodeDAO" %>

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
  $('#update_div').hide();
  $('#remove_div').hide();
});

function update(categoryno, codeno, category, sort){
  $('#update_div').show();
  $('#categoryno', update_frm).attr('value', categoryno);
  $('#codeno', update_frm).attr('value', codeno);
  $('#category', update_frm).attr('value', category);
  $('#sort', update_frm).attr('value', sort);
  $('#categoryno', update_frm).focus();
}

function update_cancel(){
  $('#update_div').hide();
}

function remove(categoryno){
  $('#remove_div').show();
  $('#categoryno', remove_frm).attr('value', categoryno); 
}
 
function delete_cancel(){
  $('#remove_div').hide();
}

// 그룹 변경
function codeno_update(shopcategoryno, codeno){
  var win = window.open("./codeno_update.do?shopcategoryno="+ shopcategoryno+"&codeno="+codeno, "codeno_UPDATE", "width=450,height=400,scrollbars=no,left=525,top=250");

  var x = (screen.width - 450) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y); // 화면 이동
}

// 출력 순서 감소, 순위 상승
function up_sort(shopcategoryno, sort) {      
  if (sort <= 1){
    return;
  }else{
    sort = sort - 1;
    location.href='./update_sort.do?categoryno=' + shopcategoryno + '&sort=' + sort;
  } 
}

// 출력 순서 증가, 순위 하강
function down_sort(shopcategoryno, sort){  
  if(sort >= 50) {
    alert('최대 50순위까지만 가능합니다.');
    return;    
  } else {
    sort = sort + 1;
    location.href='./update_sort.do?categoryno=' + shopcategoryno + '&sort=' + sort;    
  }
}

</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<!--출력모드 폼 겹칠시 이름 변경  -->
<FORM name='frm' id='frm' method='POST' action=''>
  <input type='hidden' name='blogcategoryno' id='blogcategoryno'  value=''>
  <input type='hidden' name='visible' id='visible' value=''> 
</FORM>

<%
ArrayList<ShopcategoryVO> list = (ArrayList<ShopcategoryVO>)request.getAttribute("list");
%>

<DIV id='update_div' class='content' style='padding: 10px 0px 10px 0px; background-color: #EEEEEE; width: 70%;'>
  <FORM name='update_frm' id='update_frm' method='POST' action='./update.do'>
    <input type='hidden' name='categoryno' id='categoryno' value='0'>
    <fieldset>
      <ul>
        <li>
          <label class='label' for='codeno'>코드</label>
          <input type='text' name='codeno' id='codeno'>
        </li>
        <li>
          <label class='label'  for='category'>카테고리</label>
          <input type='text' name='category' id='category' placeholder="">
        </li>
        <li>
          <label class='label'  for='sort'>순서</label>
          <input type='text' name='sort' id='sort'>
        </li>
        <li class='right'>
         <button type="submit" id='submit'>수정</button>
         <button type="button" onclick="update_cancel()">취소</button>
        </li>
      </ul>
    </fieldset>
  </FORM>
</DIV>

<DIV id='remove_div' class='content' style= 'padding: 10px 0px 10px 0px; background-color: #ffff00; width: 70%; text-align: center;'>
  <FORM name='remove_frm' id='remove_frm' method='POST' action='./delete.do'>
    <input type='hidden' name='categoryno' id='categoryno'>
    삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
    <button type="submit" id='submit'>삭제</button>     
    <button type="button" onclick="delete_cancel()">취소</button>     
  </FORM>
</DIV>

<TABLE class='table' style='width: 70%;'>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 30%;'/>
    <col style='width: 30%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>코드</TH>
    <TH class='th'>카테고리</TH>
    <TH class='th'>순서</TH>
    <TH class='th'>기타</TH>
  </TR>

<%

  for(int index=0; index < list.size(); index++){
    ShopcategoryVO vo = list.get(index);
    int categoryno = vo.getCategoryno();
  
    
%> 
  <TR>
    <TD class='td'><%=categoryno%></TD>
    <TD class='td'>
      <A href="#" onclick="codeno_update(<%=categoryno%>, <%=vo.getCodeno()%>)"><%=vo.getCode()%></A>
    </TD>
    <TD class='td'>
    <A href='../item/list.do?categoryno=<%=categoryno %>'><%=vo.getCategory()%></A>
    </TD>
    <TD class='td'>
      <%=vo.getSort() %>
      <a href="javascript: up_sort(<%=categoryno %>, <%=vo.getSort() %>)"><img src='./images/plus.jpg' title="우선순위 증가" width='15px'></a>
      <a href="javascript: down_sort(<%=categoryno %>, <%=vo.getSort() %>)"><img src='./images/minus.jpg' title="우선순위 감소" width='16px'></a>
    </TD>
    <TD class='td'>
      <A href="javascript:update(<%=categoryno%>, '<%=vo.getCodeno()%>', '<%=vo.getCategory()%>', '<%=vo.getSort() %>')"><IMG src='./images/update.png' title='수정'></A>
      <A href="javascript:remove(<%=categoryno%>)"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
  <button type='button' onclick="location.href='../shopcode/list.do'">코드 목록</button>
  <button type='button' onclick="location.href='../blog/list.do'">전체 게시판 글</button>
</DIV>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

