<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.hana.category.CategoryVO" %>

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
<FORM name='frm' method='POST' action='./update_category.do' >

<%
int expenseno = Integer.parseInt(request.getParameter("expenseno"));
int categoryno = Integer.parseInt(request.getParameter("categoryno"));
%>

  <input type='hidden' name='expenseno' value='<%=expenseno%>'>
    <ul>
      <li>
        <label class='label' for='id'>지출카테고리</label>
       변경할 지출카테고리 선택
      </li>
        <%
        ArrayList<CategoryVO> category_list = (ArrayList<CategoryVO>)request.getAttribute("category_list");
        for(int i = 0 ; i<category_list.size(); i++){
          CategoryVO categoryVO = category_list.get(i);
        %>
        <LI>
          <span class='label'>&nbsp;</span>
          <label>
          <%
          // 현재 선택된 그룹을 checked="checked" 출력
          if(categoryno == categoryVO.getCategoryno()){
          %>
            <input type='radio' name='categoryno' value='<%=categoryVO.getCategoryno()%>' checked="checked"><%=categoryVO.getCategorysort()%>
          <%
          }else{ 
            %>
            <input type='radio' name='categoryno' value='<%=categoryVO.getCategoryno()%>'><%=categoryVO.getCategorysort() %>
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
</FORM>
</DIV>
 
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 