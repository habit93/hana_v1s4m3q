<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.blog.BlogVO" %>

<%
int blogno = (Integer)request.getAttribute("blogno");
int blogcategoryno = (Integer)request.getAttribute("blogcategoryno");
%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>글 삭제</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<div class='content_menu'>
  <A href='./list.do'>${title } 게시판</A>
</div> 

<DIV class = 'content'>
  <FORM name='frm' method='POST' action='./delete.do'
             onsubmit = 'return send();'>
    <input type='hidden' name='blogno' value='<%=blogno%>'>
    <input type="hidden" name="blogcategoryno" value="<%=blogcategoryno %>">
    
    <fieldset>
      <ul>
        <li>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.
        </li>
        <li class = 'right'>
          <button type = "submit" class="btn-sm" >삭제 진행</button>
          <button type = "button" class="btn-sm"  onclick = "location.href='./list2.do?blogcategoryno=<%=blogcategoryno %>'">취소</button>
         </li>
      </ul>
    </fieldset>
  </FORM>
</DIV>

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


 