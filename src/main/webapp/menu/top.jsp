<%@ page contentType="text/html; charset=UTF-8" %>
<% String root = request.getContextPath(); %>

 <div id="header-wrapper">
          <div id="header" class="container" style="height: 50px;">  

            <!-- Logo -->
              <h1 id="logo"><a href="<%=root %>/index.jsp">hana</a></h1>  

            <!-- Nav -->
              <nav id="nav">
                <ul>
               
                  <li>
                    <a href="#">커플아이템</a>
                    <ul>
                      <li><a href='<%=root %>/item/list.do?categoryno=8'>의류</a></li>
                      <li><a href='<%=root %>/item/list.do?categoryno=9'>생활용품</a></li>
                      <li><a href='<%=root %>/item/list.do?categoryno=10'>기념일</a></li>
                      <li><a href='<%=root %>/item/list.do?categoryno=10'>남자친구선물</a></li>
                      <li><a href='<%=root %>/item/list.do?categoryno=10'>여자친구선물</a></li>
                    </ul>
                  </li>
                    
                  <li>
                    <a href="#">커플 가계부</a>
                    <ul>
                      <li><a href='<%=root %>/category/list.do'>지출카테고리</a></li>
                      <li><a href='<%=root %>/expense/list.do'>지출내역</a></li>
                      <li><a href='<%=root %>/income/list.do'>수입내역</a></li>
                      <li><a href='<%=root %>/expense/sum.do'>정산하기</a></li>
                    </ul>
                  </li>
                  
                  <li><a href="#">일정</a>
                    <ul>
                      <li><a href='<%=root %>/calendar/calendar.jsp'>달력보기</a></li>
                      <li><a href='<%=root %>/calendar/createForm.jsp'>일정 등록하기</a></li>
                    </ul>
                  </li> 
 
                  <li class="break">
                    <a href="#">캐스트</a>
                    <ul>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=1'>데이트</a></li>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=2'>영화</a></li>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=3'>음식</a></li>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=4'>패션</a></li>
                    </ul> 
                  </li>
                  
                  <li><a href="#">커뮤니티</a>
                    <ul>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=5'>지금은 연애중</a></li>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=6'>사랑해도 될까요?</a></li>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=9'>헤어진 다음 날</a></li>
                      <li><a href='<%=root %>/blog/list2.do?blogcategoryno=10'>화성남과 금성녀</a></li>
                    </ul>
                  </li> 
                  
                  <% if (session.getAttribute("id") == null){ %>
                  <li><a href='<%=root %>/member/login.do'>로그인</a></li>
                  <% }else{ %>
                  <li>
                   <a href="#">회원정보</a>
                    <ul>
                      <li><a href='<%=root %>/member/logout.do'>로그아웃</a></li>
                      <li><a href='<%=root %>/member/read.do?mno=${mno}'>마이페이지</a></li>
                      
                    </ul>
                  </li>
                  <li><a href='<%=root %>/cart/list.do?mno=${mno}'>쇼핑카트</a></li>
                  <%  } %>
                </ul>
              </nav>
              
          </div>
 </div>
 
 
 <%-- 
<!-- 화면 상단 메뉴 --> 
<DIV id='topMenu2'>
  <DIV class='menu_label'>
    ARTBox ver 0.8
  </DIV>
  <DIV class='menu_list'>
    <a class='menuLink' href='<%=root %>/index.jsp'>HOME</a></li>
    <%
    if (session.getAttribute("id") == null){
    %>
    <a class='menuLink' href='<%=root %>/member/login.do'>로그인</a>
    <%
    }else{
    %>
      <a class='menuLink' href='<%=root %>/member/logout.do'>${id}님 로그아웃</a>   
      <a class='menuLink' href='<%=root %>/member/read.do?mno=${mno}'>마이페이지</a>   
    <%  
     }
    %>
      
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/category/list.do'>지출카테고리</a>
    <a class='menuLink' href='<%=root %>/expense/list.do'>지출</a>
    <a class='menuLink' href='<%=root %>/income/list.do'>수입</a>
    <a class='menuLink' href='<%=root %>/expense/sum.do'>돈정산</a>
    <a class='menuLink' href='<%=root %>/calendar/calendar2.jsp'>스케줄</a>
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/code/list.do'>블로그코드</a>
    <a class='menuLink' href='<%=root %>/blogcategory/list.do'>블로그카테고리</a>
    <a class='menuLink' href='<%=root %>/blog/list.do'>블로그</a> 
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/shopcode/list.do'>샵코드</a>
    <a class='menuLink' href='<%=root %>/shopcategory/list.do'>샵카테고리(아이템 메뉴)</a>
    <a class='menuLink' href='<%=root %>/review/list.do'>리뷰</a>
    
    <%
    if (session.getAttribute("id") != null){
    %>
    <a class='menuLink' href='<%=root %>/cart/list.do?mno=${mno}''>쇼핑카트</a>
    <%  
     }
    %>
    
    ||||||||||||||
    <a class='menuLink' href='<%=root %>/pds5/list.jsp'>답변형 게시판</a>
  </DIV>    
</DIV>
 --%>
 
 
 