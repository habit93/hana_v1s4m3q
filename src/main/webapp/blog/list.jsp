<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.blog.BlogVO" %>
<%@ page import="com.hana.tool.Tool" %>
<% ArrayList<BlogVO> list = (ArrayList<BlogVO>)request.getAttribute("list"); %>
<% BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>게시판</title>
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

<div class="title">${title }</div>
  
<!-- 리스트 -->
<div class="list_center">
   <FORM name='frm' method='post' action='./list.jsp'>
  <DIV style='width: 100%; margin: 0px auto'>
    <%
      for (int index = 0; index < list.size(); index++) {
        BlogVO vo = list.get(index);
        int blogno = vo.getBlogno();
        if(index != 0 && index % 4 == 0){
          %>
          <DIV style='width: 100%; clear: both;'></DIV> <!-- 경계 -->
          <%
          }
          %>
          <DIV style='margin: 10px 10px 0px 10px; padding: 0px; width: 295px; height: 300px; float: left; '>
  
    <A href='./read.do?blogno=<%=blogno %>&blogcategoryno=<%=vo.getBlogcategoryno() %>'><IMG src='./storage/<%=vo.getFile()%>' style='width: 280px; height: 230px'></A>
    <br>
    <A href='./read.do?blogno=<%=blogno %>&blogcategoryno=<%=vo.getBlogcategoryno() %>'><%=vo.getTitle() %></A>
     </DIV>
    <%
      }
    %>
    </DIV>
   </FORM>
</div>
  
 <div class="feature" style='clear: both;'>
    <button type='button' class="btn-sm" onclick="location.href='./create.do?blogcategoryno=<%=blogVO.getBlogcategoryno() %>'">등록</button>
    <button type='button' class="btn-sm" onclick="javascript:location.reload();">새로고침</button>
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


