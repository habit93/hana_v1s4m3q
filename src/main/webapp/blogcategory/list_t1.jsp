<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.blogcategory.BlogcategoryVO" %>

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

});
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<BlogcategoryVO> list = (ArrayList<BlogcategoryVO>)request.getAttribute("list");
%>
<DIV class='title'>게시판 목록</DIV>

<TABLE class='table'>
  <caption>관리자만 접근 할 수 있습니다.</caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 5%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>그룹</TH>
    <TH class='th'>제목</TH>
    <TH class='th'>순서</TH>
    <TH class='th'>모드</TH>
    <TH class='th'>접근계정</TH>
    <TH class='th'>글수</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    BlogcategoryVO vo = list.get(index);
    int blogcategoryno = vo.getBlogcategoryno();

%> 
  <TR>
    <TD class='td'><%=blogcategoryno %></TD>
    <TD class='td'><%=vo.getCodeno() %></TD>
    <TD class='td'><%=vo.getTitle() %></A></TD>
    <TD class='td'><%=vo.getOrderno() %></TD>
    <TD class='td'><%=vo.getVisible() %></TD>
    <TD class='td'><%=vo.getIds() %></TD>
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'>
      <A href="./update.do?blogcategoryno=<%=blogcategoryno %>"><IMG src='./images/update.png' title='수정'></A>
      <A href="./delete.do?blogcategoryno=<%=blogcategoryno %>"><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<DIV class='bottom'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



