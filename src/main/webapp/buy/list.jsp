<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.buy.BuyVO" %>
 <% ArrayList<BuyVO> list = (ArrayList<BuyVO>)request.getAttribute("list"); %>
 
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>구매내역</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function(){

});
</script>
</head>
<!-- --------------------------------------------------------- -->
<body >
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<DIV class='title'>구매 내역 조회</DIV>

<div class="container">
<TABLE class='table table-hover'>
  <TR>
    <TH class='th'>제품명</TH>
    <th>사진</th>
    <TH class='th'>갯수</TH>
    <TH class='th'>가격</TH>
    <TH class='th'>우편 번호</TH>
    <TH class='th'>주소</TH>
    <TH class='th'>상세 주소</TH>
    <TH class='th'>구매 날짜</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    BuyVO vo = list.get(index);
    int mno = vo.getMno();
%> 
  <TR>
    <TD class='td'><%=vo.getName()%></TD>
    <TD class='td'><img src="../item/storage/<%=vo.getThumb()%>" style="width:15%"></TD>
    <TD class='td'><%=vo.getCnt() %></TD>
    <TD class='td'><%=vo.getPrice()%></TD>
    <TD class='td'><%=vo.getZipcode() %></TD>
    <TD class='td'><%=vo.getAddress1()%></TD>
    <TD class='td'><%=vo.getAddress2()%></TD>
    <TD class='td'><%=vo.getDate().substring(0, 10)%></TD>
    <TD class='td'>
      <A href="./delete.do?buyno=<%=vo.getBuyno()%>">취소</A>
    </TD>
  </TR>
<%
  }
%>
</TABLE>
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



