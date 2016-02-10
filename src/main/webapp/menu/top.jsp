<%@ page contentType="text/html; charset=UTF-8" %>
 
<%
// 프로젝트 경로 자동 추출, Context root 명 자동 추출
// /ws_web/notice_v2jq -> /notice_v2jq
String root = request.getContextPath(); 
%>
 
<!-- 화면 상단 메뉴 --> 
<DIV id='topMenu2'>
  <DIV class='menu_label'>
    ARTBox ver 0.8
  </DIV>
  <DIV class='menu_list'>
    <a class='menuLink' href='<%=root %>/index.do'>HOME</a></li>
    <%
    if (session.getAttribute("id") == null){
    %>
    <a class='menuLink' href='<%=root %>/member/login.do'>로그인</a>
    <%
    }else{
    %>
      <a class='menuLink' href='<%=root %>/member/logout.do'>${id} 로그아웃</a>   
      <a class='menuLink' href='<%=root %>/member/read.do?mno=${mno}'>마이페이지</a>   
    <%  
     }
    %>
      
    
    <%
    if (session.getAttribute("act") == null){
    %>
      <a class='menuLink' href='<%=root %>/admin1/login_ck_form.jsp'>Admin</a>
    <%
    }else{
    %>
      <a class='menuLink' href='<%=root %>/admin1/logout_proc.jsp'>Logout</a>
      <a class='menuLink' href='<%=root %>/admin1/list.jsp'>관리자</a>
    <%
    }
    %>
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/category/list.do'>지출카테고리</a>
    <a class='menuLink' href='<%=root %>/expense/list.do'>지출</a>
    <a class='menuLink' href='<%=root %>/income/list.do'>수입</a>
    <a class='menuLink' href='<%=root %>/expense/sum.do'>돈정산</a>
    <a class='menuLink' href='<%=root %>/schedule/list.do'>스케줄</a>
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/code/list.do'>블로그코드</a>
    <a class='menuLink' href='<%=root %>/blogcategory/list.do'>블로그카테고리</a>
    <a class='menuLink' href='<%=root %>/blog/list.do'>블로그</a> 
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/shopcode/list.do'>샵코드</a>
    <a class='menuLink' href='<%=root %>/shopcategory/list.do'>샵카테고리(아이템 메뉴)</a>
    <a class='menuLink' href='<%=root %>/review/list.do'>리뷰</a>
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/pds5/list.jsp'>답변형 게시판</a>
  </DIV>    
</DIV>