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
<div class="container">
  <table class="table table-hover"> 
    <thead>
      <tr>
        <th style="width: 60%;">제목(댓글수)</th>
        <th style="width: 15%;">등록일</th>
        <th style="width: 15%;">조회수</th>
        <th style="width: 10%;">기타</th>
      </tr>
    </thead>
    <tbody>
      <%
        for(int index = 0; index < list.size(); index++){
          BlogVO vo = list.get(index);
          int blogno = vo.getBlogno();
      %>
      <tr>
        <td class="td_left">
          <a href="./read.do?blogno=<%=blogno %>&blogcategoryno=<%=vo.getBlogcategoryno() %>"><%=Tool.textLength(20, vo.getTitle())%></a> 
        </td>
        <td class="td"><%=vo.getRdate().substring(0, 10)%></td>
        <td class="td"><%=vo.getCnt() %></td>
        <td class="td">
          <a href="./update.do?blogno=<%=blogno%>"><img src="./images/update.png" title="수정"  border='0'/></a>
          <a href="./delete.do?blogno=<%=blogno %>"><img src="./images/delete.png" title="삭제"  border='0'/></a>
        </td> 
     </tr>
     <%
      }
      %>
  </tbody>
 </table>
</div>
  
<div class="feature">
    <button type='button' class="btn-sm" onclick="location.href='./create2.do?blogcategoryno=<%=blogVO.getBlogcategoryno() %>' ">등록</button>
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


