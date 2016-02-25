<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.hana.item.ItemVO"%>


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

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
	<jsp:include page="/menu/top.jsp" flush='false' />
	<!-- ----------------------------------------- -->
<div class="list-group" style='float: left; width: 200px; height: 1000px; margin-left: 5px;'>
  <a href="#" class="list-group-item active">
    카테고리
  </a>
  <a href="#" class="list-group-item active">신발
  </a>
  <a href="#" class="list-group-item">남자 신발
  </a>
  <a href="#" class="list-group-item">여자 신발
  </a>
  <a href="#" class="list-group-item active">지갑
  </a>
  <a href="#" class="list-group-item">남자 지갑
  </a>
  <a href="#" class="list-group-item">여자 지갑
  </a>
</div>
	<%
	  ArrayList<ItemVO> list = (ArrayList<ItemVO>) request.getAttribute("list_all");
	%>
	<DIV style='width: 1500px;'>
		<FORM name='frm' method='post' action='./list.jsp'>

			<!--  <DIV style='width: 100%; clear: both; height: 1px; border-bottom: dotted 1px black;'></DIV> 경계 -->
			<DIV style='width: 100%; margin: 0px auto'>
				<%
				  for (int index = 0; index < list.size(); index++) {
				    ItemVO vo = list.get(index);

				    if (index != 0 && index % 5 == 0) {
				%>
				<DIV></DIV><!-- 경계 -->
				<%
				  }
				%>
				<DIV
					style='margin: 0px 10px 0px 10px; padding: 0px; width: 220px; height: 250px; float: left;'>

					<A
						href='./read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><IMG
						src='../item/storage/<%=vo.getThumb()%>'
						style='width: 215px; height: 150px'></A> <br> <A
						href='./read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><%=vo.getTitle()%></A>
					<%=vo.getPrice()%>원
				</DIV>
        <%
				  }
        %>

		</FORM>
	</DIV>
	<!-- -------------------------------------------- -->
	<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

