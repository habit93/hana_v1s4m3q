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
    <%  
     }
    %>
      
    <a class='menuLink' href='<%=root %>/noticev3/list.jsp'>Notice</a>
    <a class='menuLink' href='<%=root %>/newsv2/list.jsp'>News</a>
    <a class='menuLink' href='<%=root %>/urlv2/list.jsp'>URL</a>
    <a class='menuLink' href='<%=root %>/pdsv3/list.jsp'>Movie</a>
    <a class='menuLink' href='<%=root %>/member/create.do'>JOIN</a>
    <a class='menuLink' href='<%=root %>/code/list.do'>Code</a>
    <a class='menuLink' href='<%=root %>/blogcategory/list.do'>Blog category</a>
    <a class='menuLink' href='<%=root %>/blog/list.do'>Blog</a>
 
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
  </DIV>    
</DIV>