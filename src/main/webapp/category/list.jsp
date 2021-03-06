<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.category.CategoryVO" %> 

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>지출카테고리</title>
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
  /*openMessage('panel_frm'); */
$('#panel_frm').show(); 
  $('#frm').attr('action', './create.do');
  $('#categorysort').attr('value', '').focus(); 
  $('#btn').html('등록');
} 

function openMessage(IDS){
  $('#'+IDS).bPopup();
}

function create_cancel(){
  $('#panel_frm').hide();
} 

function update(categoryno, categorysort){
  $('#panel_frm').show();
  $('#frm').attr('action', './update.do');
  $('#categoryno').attr('value', categoryno);
  $('#categorysort').attr('value', categorysort).focus();
  $('#btn').html('수정');
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
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->
<br>
    <!-- 등록/수정 -->  
    <div id='panel_frm' style="display: none; text-align: center;"> 
      <form name='frm' id='frm' method='post' action="./create.do">   
        <input type='hidden' name='categoryno' id='categoryno' value='1'> 
        <input type='hidden' name='mno' id='mno' value='${mno}'>
        <input type='text' class="input-sm" name='categorysort' id='categorysort' required="required">
        <button type='submit'  class="btn-sm"  id='btn'>등록</button>
        <button type="button" class="btn-sm"  onclick="create_cancel()">취소</button> 
      </form> 
    </div> 



    <!-- 삭제 -->
    <div id='panel_frm_remove' >
      <FORM name='frm_remove' id='frm_remove' method='POST' action='./delete.do'>
        <input type='hidden' name='categoryno' id='categoryno'> 
        삭제하면 복구 할 수 없습니다. 정말로 삭제하시겠습니까?
        <button type='submit'  class="btn-sm">삭제</button> 
        <button type="button" class="btn-sm"  onclick="create_cancel()">취소</button> 
      </form>
    </div> 

<!-- 리스트 -->
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</TH>
        <th>지출 카테고리</TH>
        <th>기타</TH>
      </tr>
    </thead>
    <tbody>
    <%
    ArrayList<CategoryVO> list = (ArrayList<CategoryVO>)request.getAttribute("list");

    for(int index=0; index < list.size(); index++){
      CategoryVO vo = list.get(index);
        int categoryno = vo.getCategoryno();
    %> 
    <tr>  
      <td><%=categoryno %></td>
      <td><%=vo.getCategorysort() %></td>
      <td>
        <a href="javascript:update(<%=categoryno%>, '<%=vo.getCategorysort() %>')"><img src='./images/update.png' title='수정'></a>
       <a href="javascript:remove(<%=categoryno%>)"><img src='./images/delete.png' title='삭제'></a> 
     </td>
   </tr>
  <%
   }
  %>
  </tbody>
 </table>
</div>

    <div class="feature">
     <button type='button' class="btn-sm" onclick="create();">등록</button>
      <button type='button' class="btn-sm" onclick="location.reload();">새로고침</button>
      <button type='button' class="btn-sm" onclick="location.href='../expense/list.do'">지출목록</button>
      <button type='button' class="btn-sm" onclick="location.href='../income/list.do'">수입목록</button>
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

