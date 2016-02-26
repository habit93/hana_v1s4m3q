<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.review.ReviewVO" %>
<%@ page import="com.hana.tool.Tool" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" 
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
});
</script>

<script type="text/javascript">
</script>
</head>

<%-- body 시작 --%>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
<%-- ---------------------------------------------------------------------------------------------- --%>
  <% ArrayList<ReviewVO> list = (ArrayList<ReviewVO>)request.getAttribute("list"); %>
  
<div class="container">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>제목</th>
        <th>등록일</th>
      </tr>
    </thead>
    <tbody>
         <%
          for(int index = 0; index < list.size(); index++){
            ReviewVO vo = list.get(index);
            int reviewno = vo.getReviewno();
          %> 
          <tr>
            <td class="td"><a href="./read.do?reviewno=<%=reviewno %>"><%=vo.getTitle() %></a></td>
            <td class="td"><%=vo.getRdate() %></td>
          </tr>
          <% 
            }
          %>
      </tbody>
    </table> 
  </div>
  <DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
</DIV>
  
  
<%-- ---------------------------------------------------------------------------------------------- --%>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<%-- body 종료 --%>
</html>


