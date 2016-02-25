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
  
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 35%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th class="th">리뷰번호</th>
          <th class="th">제목</th>
          <th class="th">등록일</th>
          <th class="th">아이템번호</th>
          <th class="th">멤버번호</th>
          <th class="th">기타</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
         <%
          for(int index = 0; index < list.size(); index++){
            ReviewVO vo = list.get(index);
            int reviewno = vo.getReviewno();
          %>
          <tr>
            <td class="td"><%=reviewno %></td>
            <td class="td"><a href="./read.do?reviewno=<%=reviewno %>"><%=vo.getTitle() %></a></td>
            <td class="td"><%=vo.getRdate() %></td>
            <td class="td"><%=vo.getItemno()%></td>
            <td class="td"><%=vo.getMno()%></td>
            <td class="td">
              <a href="./update.do?reviewno=<%=reviewno%>"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?reviewno=<%=reviewno %>"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
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


