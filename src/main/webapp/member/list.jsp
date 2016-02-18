<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
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
$(function(){

});
</script>
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->
<%
ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
%>
<DIV class='title'>회원 목록</DIV>

<TABLE class='table'>
  <caption></caption>
  <colgroup>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 20%;'/>
    <col style='width: 30%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>생일</TH>
    <TH class='th'>성별</TH>
    <TH class='th'>기타</TH>
  </TR>

<%
  for(int index=0; index < list.size(); index++){
    MemberVO vo = list.get(index);
    int mno = vo.getMno();

%> 
  <TR>
    <TD class='td'><%=mno %></TD>
    <TD class='td'><A href="./read.do?mno=<%=mno%>"><%=vo.getId() %></A></TD>
    <TD class='td'><%=vo.getMname() %></TD>
    <TD class='td'><%=vo.getNickname() %></TD>
    <TD class='td'><%=vo.getBirthday() %></TD>
    <TD class='td'><%=vo.getGender()%></TD>
    <TD class='td'>
      <A href="./passwd.do?mno=<%=mno %>"><IMG src='./images/passwd.png' title='패스워드 변경'></A>
      <A href="./update.do?mno=<%=mno %>"><IMG src='./images/update.png' title='수정'></A>
      <A href="./delete.do?mno=<%=mno %>"><IMG src='./images/delete.png' title='삭제'></A>
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



