<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.tool.Tool" %>
<%@ page import="com.hana.blog.*" %>
<%@ page import="com.hana.blogreply.*" %>
 
<% 
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");  
int blogno = blogVO.getBlogno();
%>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 
<script type="text/javascript" src="../js/tool.js"></script>
 
<script type="text/javascript">
jQuery.fn.center = function () {
  this.css("position","absolute");
  this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
  this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
  return this;
}
 
var show_layer = function() {
  $("#layer_delete").show();
  $("#layer_delete").center();
}
  
$(function(){
  show_layer();
});
 
function delete_reply(blogcategoryno, blogno, blogreplyno){
  var sw = confirm('정말로 삭제하시겠습니까?');
  if ( sw == true){
    var passwd = prompt('패스워드를 입력하세요.', '');
    location.href='../blogreply/delete.do?blogcategoryno='+blogcategoryno+'&blogno=' + blogno + '&blogreplyno=' + blogreplyno + '&passwd=' + passwd;
  }
}
</script>
 
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
  <div class='content_menu'>
    <A href='./list2.do?blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>${title } 게시판</A>｜
    <A href='./update.do?blogno=<%=blogno%>&blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>글 수정</A>｜
    <A href='./delete.do?blogno=<%=blogno%>&blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>글 삭제</A>
  </div> 
 
  <div id="layer_delete" style='display:none; background-color: #DDDDDD; width: 400px; height: 200px;'>
    <div>삭제 레이어입니다.</div>
  </div>
  
  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="blogno" value="<%=blogno %>">
     
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='title' class="label" style="width:120px;">제목 : </label>
            <span><%=blogVO.getTitle() %></span><br>
          </li>
          <li>
            <label for='content' class="label" style="width:120px;">내용 : </label>
            <span><%=blogVO.getContent() %></span>
          </li>
          <li>
            <label for="good" class="label" style="width:120px;">추천 수 : </label>
            <span><%=blogVO.getGood()%></span>
          </li>
          <li>
            <label for="rdate" class="label" style="width:120px;">등록일 : </label>
            <span><%=blogVO.getRdate().substring(0, 16) %></span>
          </li>
          <li>
            <label for="file" class="label" style="width:120px;">Thumb 파일 : </label>
            <%=Tool.checkNull(blogVO.getFile()) %><br>
          </li>
          <li>
            <label for="file1" class="label" style="width:120px;">업로드 파일: </label>
            <div>
              <%=Tool.checkNull(blogVO.getFile()) %><br>
            </div>
          </li>
        </ul>
      </fieldset>
    </FORM>
  <br>
  <div class="content" style='width: 80%; border-bottom: none;'>
  <%
  
  ArrayList<BlogreplyVO> list = (ArrayList<BlogreplyVO>)request.getAttribute("list");
  for(int index = 0; index < list.size(); index++){
    BlogreplyVO blogreplyVO = list.get(index); 
    int blogreplyno = blogreplyVO.getBlogreplyno();
    int indent = blogreplyVO.getIndent();
 
    if (indent > 0){
      for(int i=0; i < indent; i++){
        out.println("    ");
      }
    
      if (indent > 0){
      %>
        <img src='./images/reply.png' style='width: 6px;'>
      <%  
      }
    }else{
      %>
      <img src='./images/list1.png' style='width: 6px;'>
    <%
    }
    %>

     <%=blogreplyVO.getRdate().substring(0, 16) %>
    <A href='javascript:delete_reply(<%=blogVO.getBlogcategoryno() %>, <%=blogno %>,<%=blogreplyno %>)'><IMG src='./images/delete.png' title='삭제' style='width: 8px;'></A>
    <br>
    <%
    String reply_content = blogreplyVO.getContent();
    reply_content = Tool.convertChar(reply_content); // 태그를 단순 문자로 변환
    %>    
      
    <%=reply_content %>  
    <br>
  <%
  }
  %>
  </div>
  
  <div class="content" style='width: 80%; border: none;'>
    댓글: <br>
    <form name='create_frm' id='create_frm' method='post' 
            action='../blogreply/create.do'>
      <input type="hidden" name='blogcategoryno' id='blogcategoryno' value='<%=blogVO.getBlogcategoryno() %>'>
      <input type="hidden" name='blogno' id='blogno' value='<%=blogVO.getBlogno() %>'>
                  
      <input type='text' name='rname' id='rname' value='왕눈이' placeholder="이름" >
      <input type='text' name='passwd' id='passwd' value='1234' placeholder="비밀번호" >
      <input type='text' name='email' id='email' value='mail@mail.com' size='30' placeholder="블로그 또는 이메일 주소" >
      <textarea name='content' rows='2' style="width: 90%; margin-top: 5px;" placeholder="댓글 작성시 네티즌 매너를 지켜주세요~~">댓글 작성시 네티즌 매너를 지켜주세요~~</textarea>
      <button type="submit">등록</button>
    </form> 
  </div>
  
  </DIV>
 
  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>