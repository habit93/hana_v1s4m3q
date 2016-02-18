<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hana.review.*" %>
<%@ page import="com.hana.tool.Tool" %>

<% 
ReviewVO reviewVO = (ReviewVO)request.getAttribute("reviewVO");  
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->

  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="blogno" value="<%=reviewVO.getReviewno() %>">
     
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='title' class="label" style="width:150px;">제목 : </label>
            <span><%=reviewVO.getTitle() %></span><br>
          </li>
          <li>
            <label for='content' class="label" style="width:150px;">내용 : </label>
            <span><%=reviewVO.getContents() %></span>
          </li>
          <li>
            <label for="rdate" class="label" style="width:150px;">등록일 : </label>
            <span><%=reviewVO.getRdate() %></span>
          </li>
          <li>
            <label for="itemno" class="label" style="width:150px;">아이템 번호 : </label>
            <span><%=reviewVO.getItemno()%></span>
          </li>
          <li>
            <label for="mno" class='label' style="width:150px;">멤버 번호 : </label>
            <span><%=reviewVO.getMno()%></span>
          </li>
          <li>
            <a href="./update.do?reviewno=<%=reviewVO.getReviewno() %>"><img src="./images/update.png" title="수정" border='0'/></a>
            <a href="./delete.do?reviewno=<%=reviewVO.getReviewno() %>"><img src="./images/delete.png" title="삭제"  border='0'/></a>
          </li>
        </ul>
      </fieldset>
    </FORM>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

