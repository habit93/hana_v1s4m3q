<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.hana.shopcode.ShopcodeVO" %>
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
<!-- ----------------------------------------- -->

<DIV style='margin: 20px auto;' >
<FORM name='frm' method='POST' action='./codeno_update.do' >
<%
int categoryno = Integer.parseInt(request.getParameter("shopcategoryno"));
int codeno = Integer.parseInt(request.getParameter("codeno"));
%>
  <input type='hidden' name='categoryno' value='<%=categoryno%>'>
  <fieldset>
    <ul>
      <li>
        <label class='label' for='id'>그룹</label>
       등록할 그룹 선택
      </li>
        <%
        ArrayList<ShopcodeVO> code_list = (ArrayList<ShopcodeVO>)request.getAttribute("shopcode_list");
        for(int i = 0 ; i<code_list.size(); i++){
          ShopcodeVO codeVO = code_list.get(i);
        %>
        <LI>
          <span class='label'>&nbsp;</span>
          <label>
          <%
          // 현재 선택된 그룹을 checked="checked" 출력
          if(codeno == codeVO.getCodeno()){
          %>
            <input type='radio' name='codeno' value='<%=codeVO.getCodeno()%>' checked="checked"><%=codeVO.getCode() %>
          <%
          }else{
            %>
            <input type='radio' name='codeno' value='<%=codeVO.getCodeno()%>'><%=codeVO.getCode() %>
          <%
          }
          %>      
          </label>
        </LI>
        <% 
        }
        %>
      <li class='right'>
        <button type='submit'>그룹 변경</button>
      </li>         
    </ul>
  </fieldset>
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 