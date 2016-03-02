<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.cart.CartVO" %>
 <% ArrayList<CartVO> list = (ArrayList<CartVO>)request.getAttribute("list"); %>
 
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>지출내역</title>
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

<DIV class='title'>쇼핑 카트</DIV>
<div class="container">
<TABLE class='table table-hover'>
  <TR>
    <!--     
    <TH class='th'>번호</TH>-->
    <TH>제품명</TH>
    <TH>사진</TH> 
    <TH>갯수</TH>
    <TH>가격</TH>
    <TH>기타</TH>
  </TR>
<%
  for(int index=0; index < list.size(); index++){
    CartVO vo = list.get(index);
    int mno = vo.getMno();
%> 
  <TR>
    <%--      
    <TD class='td'><%=vo.getCartno()%></TD>--%>
    <TD class='td'><%=vo.getName()%></TD>
    <TD class='td'><img src="../item/storage/<%=vo.getThumb()%>" style="width:15%"></TD> 
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'><%=vo.getPrice()%></TD>
    <TD class='td'>
      <A href="./buy.do?cartno=<%=vo.getCartno()%>">구매</A>
      <A href="./delete.do?cartno=<%=vo.getCartno()%>">쇼핑카트에서 제거</A>
    </TD>
    
  </TR>
<%
  }
%>
</TABLE>
</div>

<!-- -------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html> 



