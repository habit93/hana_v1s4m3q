<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.shopcode.ShopcodeVO" %>

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

<DIV class='title'>게시판 등록</DIV>

<DIV class='content'>
<FORM name='frm' method='POST' action='./create.do'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='id'>코드</label>
        게시판을 등록할 그룹을 선택하세요.
        <button type='button' onclick="location.href='../shopcode/list.do'">코드 관리</button>
      </li>  
        <%
        ArrayList<ShopcodeVO> code_list = (ArrayList<ShopcodeVO>)request.getAttribute("code_list");
        for (int i=0; i<code_list.size(); i++){
          ShopcodeVO codeVO = code_list.get(i);
        %>
          <LI>
            <span class='label' >&nbsp;</span>
            <label>
              <input type='radio' name='codeno' value='<%=codeVO.getCodeno() %>'><%=codeVO.getCode() %>
            </label>
          </LI>
        <%  
        }
        %>
      <li>
        <label class='label' for='category'>카테고리 이름</label>
        <input type="text" name='category' id='category'  required="required">
      </li>
      <li>
        <label class='label' for='sort'>출력 순서</label>
        <input type="number" name='sort' id='sort' value='1' min='1' max='50' step='1' required="required">
      </li>
      <li class='right'>
        <button type="submit">등록</button>
        <button type="button" onclick="location.href='./list.do'">목록</button>
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

