s<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.hana.member.MemberVO" %>
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
</script>

</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
MemberVO memberVO = (MemberVO)request.getAttribute("memberVO");
%>
<DIV class='title'>마이페이지</DIV>

<DIV class='content'>
<FORM name='frm' method='POST' action='./update.do'
           onsubmit = 'return send();'>
   <input type='hidden' id='mno' name='mno' value='<%=memberVO.getMno()%>'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='id'>아이디</label>
        <span><%=memberVO.getId() %></span>
      </li>
      <li>
        <label class='label' for='passwd'>패스워드</label>
        <span><%=memberVO.getPasswd() %></span>
      </li>
      <li>
        <label class='label' for='mname'>성명</label>
        <span><%=memberVO.getMname() %></span>
      </li>
      <li>
        <label class='label' for='nickname'>닉네임</label>
        <span><%=memberVO.getNickname() %></span>
      </li>
      <li>
        <label class='label' for='birthday'>생일</label>
        <span><%=memberVO.getBirthday() %></span>
      </li>
      <li>
        <label class='label' for='birthday'>성별</label>
        <%
        if(memberVO.getGender() == 1){
        %>
        <span>남자</span>
        <%
        }else{
        %>
        <span>여자</span>
        <%
        }
        %>     
      </li>
      <li>
        <button type="button" onclick="location.href='../buy/list.do?mno=${mno}'">구매 내역 조회</button>
        <button type="button" onclick="location.href='../cart/list.do?mno=${mno}'">쇼핑카트</button>
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

