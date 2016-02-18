<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.cart.CartVO" %>
 
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
ArrayList<CartVO> list = (ArrayList<CartVO>)request.getAttribute("list");
%>
<DIV class='title'>쇼핑 카트</DIV>
<TABLE class='table'>
  <caption></caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>사진</TH>
    <TH class='th'>제품 명</TH>
    <TH class='th'>갯수</TH>
    <TH class='th'>가격</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    CartVO vo = list.get(index);
    int mno = vo.getMno();

%> 
  <TR>
    <TD class='td'><%=vo.getCartno()%></TD>
    <TD class='td'><img src="../item/storage/<%=vo.getThumb()%>"></TD>
    <TD class='td'><A href="./read.do?mno=<%=mno%>"><%=vo.getName()%></A></TD>
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'><%=vo.getPrice()%></TD>
    <TD class='td'>
      <A href="./buy.do?cartno=<%=vo.getCartno()%>"><IMG src='./images/delete.png' title='구매'></A>
      <A href="./delete.do?cartno=<%=vo.getCartno()%>"><IMG src='./images/delete.png' title='쇼핑카트에서 제거'></A>
    </TD>
    
  </TR>
<%
  }
%>

</TABLE>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



