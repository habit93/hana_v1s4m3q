<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.blog.BlogVO" %>
<%@ page import="com.hana.tool.Tool" %>
<%@ page import="com.hana.item.ItemVO" %>

<html lang="ko"> 
  <head>
    <title>hana</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="Stylesheet" href="../css/calendar.css">
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
  </head>
  <body >
  
    <jsp:include page="/menu/top.jsp" flush='false' />
    
    <DIV style='width:40%; float: left; margin-left: 160px;'>
    <jsp:include page="/calendar/calendar_main.jsp" flush='false' />
    </DIV>
    
    <% ArrayList<BlogVO> list = (ArrayList<BlogVO>)request.getAttribute("list"); %>
    <div style='width:40%; float: left;'>
    <table class="table">
      <colgroup>
        <col style="width: 40%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 5%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
          
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th class="th">제목(댓글수)</th>
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
            <td class="td_left">
              <a href="./read.do?blogno=<%=blogno %>"><%=Tool.textLength(25, vo.getTitle())%></a>  
            </td> 
            <td class="td"><%=vo.getRdate().substring(0, 10) %></td>
            <td class="td"><%=vo.getCnt() %></td>
            <td class="td">
              <a href="./update.do?blogno=<%=blogno%>"><img src='./images/update.png' title='수정'></a>
              <a href="./delete.do?blogno=<%=blogno %>"><img src='./images/delete.png' title='삭제'></a>
            </td>
          </tr>
          <% 
            }
          %>
      </tbody>
    </table>
    </div>
   <!-- ---------------------------------첫줄 끝------------------------------------------- -->
<%
ArrayList<ItemVO> list2 = (ArrayList<ItemVO>)request.getAttribute("list2");
/* int categoryno = Integer.parseInt(request.getParameter("categoryno")); */
%>
 <DIV style='clear: both; margin-left: 150px;'>
  <FORM name='frm' method='post' action='./list.jsp'>

  <DIV style='width: 100%; margin: 0px auto'>
    <%
      for (int index = 0; index < list2.size(); index++) {
        ItemVO vo = list2.get(index);
          %>
          <DIV style='margin: 10px 10px 0px 10px; padding: 0px; width: 295px; height: 300px; float: left; '>
  
    <A href='./item/read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><IMG src='./item/storage/<%=vo.getThumb()%>' style='width: 280px; height: 230px'></A>
    <br>
    <div class="feature">
      <A href='./item/read.do?itemno=<%=vo.getItemno()%>&categoryno=<%=vo.getCategoryno()%>'><span class="name"><%=vo.getTitle() %></span></A>
      <span class="price"><%=vo.getPrice()%>원</span>
    </div>
     </DIV>
    <%
      }    
    %>
    </DIV>
   </FORM>
  </DIV>
<%--     <jsp:include page="/menu/bottom.jsp" flush='false' /> --%>
    
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>
      
  </body>
</html>