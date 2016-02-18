<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./ssi.jsp" %> 

<%
// ---------------------------------------------
// 페이징 관련 코드 시작
// ---------------------------------------------
int totalRecord = pds5DAO.totalRecord(col, word);
// 10: 한 페이지당 출력할 레코드 갯수
String paging = new Paging().paging3(totalRecord, nowPage, 10, col, word);
// ---------------------------------------------
// 페이징 관련 코드 종료
// ---------------------------------------------
%>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
  function print(bbsno){
    var str = './print.jsp?qano=' + qano;
    window.open(str, "print", ('scrollbars=yes, resizeable=no, width=800, height=700'));
  }
</script>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<jsp:include page="/menu/top.jsp" flush='false' />
<!-- ----------------------------------------- -->

<DIV class='title'>Q&A</DIV> 


<DIV style='width: 90%; margin: 1px auto; text-align: right;'>
   <FORM name='frm' method='POST' action='./list.jsp'>
     글 수: <%=pds5DAO.totalRecord(col, word) %> 건 &nbsp;
     <INPUT type='button' value='등록' onclick="location.href='./create_form.jsp'">
   </FORM>
</DIV>

<TABLE class='table' style='width: 90%;'>
  <TR>
    <TH class='th' style='width: 5%;'>번호</TH>
    <TH class='th' style='width: 30%;'>제목</TH>
    <TH class='th' style='width: 15%;'>등록일</TH>
    <TH class='th' style='width: 15%;'>기타</TH>
  </TR>
  
<%
// ---------------------------------
ArrayList list = pds5DAO.list();  // 검색 지원
// --------------------------------- 

for(int index = 0; index < list.size(); index++){
  // NewsDTO 추출하는데 광범위한 공통 타입인 Object 타입으로 추출
  Object obj = list.get(index); 
  
  // 광범위한 Object 타입을 구체적인 클래스 타입으로 변환해야 사용 가능
  Pds5DTO pds3DTO = (Pds5DTO)obj;
  int qano = pds3DTO.getQano();  // 레코드 번호 추출
%>  
  <TR>
    <TD class='td'><%=qano %></TD>
    <TD class='td' style='text-align: left;'>
      <%
      int indent = pds3DTO.getIndent();
      for(int i=0; i < indent; i++){
        out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
      }

      if (indent > 0){
      %>
        <img src='./images/reply2.png'>
      <%  
      }
      
      String str = pds3DTO.getTitle();
      
      if (str.length() >= 25){
        str = str.substring(0, 20) + "...";
      }
      
      str = Tool.convertChar(str); // 태그를 단순 문자로 변환
      %>      
      <A href='./read.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'><%=str %></A>
      <%
      if (Tool.isNew(pds3DTO.getRdate(), 1)){
      %>
        <IMG src='./images/new.gif'>
      <%
      }
      %> 
    </TD>
    <TD class='td'><%=pds3DTO.getRdate() %></TD>
    <TD class='td'>
      <A href='./reply_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>''><IMG src='./images/reply.png' title='답변'></A>
      <A href='./update_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>''><IMG src='./images/update.png' title='수정'></A>
      <A href='./delete_form.jsp?qano=<%=qano %>&col=<%=col %>&word=<%=word %>&nowPage=<%=nowPage %>'><IMG src='./images/delete.png' title='삭제'></A>
    </TD>
  </TR>

<%
}
%>
</TABLE>

<DIV class='bottom'>
  <%=paging %>
</DIV>

<DIV style='text-align: center;'>
  <input type='button' value='등록' onclick="location.href='./create_form.jsp'">
</DIV>

<!-- ------------------------------------------- -->
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- ------------------------------------------- -->
</html>





