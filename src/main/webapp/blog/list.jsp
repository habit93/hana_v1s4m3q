<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.blog.BlogVO" %>
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
  <% ArrayList<BlogVO> list = (ArrayList<BlogVO>)request.getAttribute("list"); %>
  
   <div style="text-align: center;">게시판</div>
    
   <div class='content_menu' style='width: 90%;'>
    <A href='../blogcategory/list.do'>블로그 카테고리 목록</A> ｜
    <A href='./create.do'>등록</A>｜
    <A href="javascript:location.reload();">새로고침</A>
  </div>
  <div class="content" style='width: 90%;'>
    <table class="table" style='width: 100%;'>
      <colgroup>
        <col style="width: 5%;"></col>
        <col style="width: 35%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th class="th">번호</th>
          <th class="th">제목(댓글수)</th>
          <th class="th">썸파일</th>
          <th class="th">등록일</th>
          <th class="th">조회수</th>
          <th class="th">기타</th>
        </tr>
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
         <%
          for(int index = 0; index < list.size(); index++){
            BlogVO vo = list.get(index);
            int blogno = vo.getBlogno();
          %>
          <tr>
            <td class="td"><%=blogno %></td>
            <td class="td_left">
              <a href="./read.do?blogno=<%=blogno %>"><%=Tool.textLength(10, vo.getTitle())%></a> 
            </td> 
            <td class="td"><%=vo.getFile() %></td>
            <td class="td"><%=vo.getRdate().substring(0, 10) %></td>
            <td class="td"><%=vo.getCnt() %></td>
            <td class="td">
              <a href="./update.do?blogno=<%=blogno%>"><img src="./images/update.png" title="수정" border='0'/></a>
              <a href="./delete.do?blogno=<%=blogno %>"><img src="./images/delete.png" title="삭제"  border='0'/></a>
            </td>
          </tr>
          <% 
            }
          %>
      </tbody>
    </table>
  </div>
  
  
<%-- ---------------------------------------------------------------------------------------------- --%>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<%-- body 종료 --%>
</html>


