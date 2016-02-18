<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.category.CategoryVO" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src='../js/tool.js'></script>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
<script type="text/javascript">
$(function(){
});
</script>
 
</head> 
<!-- ------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ------------------------------------- -->



<DIV class='title'>지출 등록</DIV>

<div class='content'>
<form name='frm' method='POST' action="./create.do">     
<input type='hidden' name='mno' id='mno' value='1'>   

<TABLE class='table' style='width: 100%;'>
  <colgroup> 
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 15%;'/>
  </colgroup>
  <TR>
    <TH class='th'>날짜</TH>
    <TH class='th'>지출 카테고리</TH>
    <TH class='th'>지출내용</TH>
    <TH class='th'>지출금액</TH>
    <TH class='th'>기타</TH>
  </TR> 
  <TR>
    <TD class='td'><input type="date" name='rdate' id='rdate' required="required"></TD>
    <TD class='td'>
      <input type="text" name='categoryno' id='categoryno'  required="required" list="category"  autocomplete="off">
      <datalist id="category" >
      <%
      ArrayList<CategoryVO> category_list = (ArrayList<CategoryVO>)request.getAttribute("category_list");
      for (int i=0; i<category_list.size(); i++){
        CategoryVO categoryVO = category_list.get(i);
      %>
        <option value="<%=categoryVO.getCategoryno() %>"  ><%=categoryVO.getCategorysort() %></option>
        <%  
        }
        %>
     </datalist>
     </TD>

    <TD class='td'><input type='text' name='expenseitem' id='expenseitem' required="required"></TD>
    <TD class='td'><input type='text' name='expensemoney' id='expensemoney' required="required"></TD>
    <TD class='td'>      
      <button type='submit'>등록</button>
     </TD>
  </TR>
</TABLE>
</form>
</div>  
    
    
 
<!-- ------------------------------------- -->
</body>
<!-- ------------------------------------- -->
</html> 