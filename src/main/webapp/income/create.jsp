<%@ page contentType="text/html; charset=UTF-8" %> 
 
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
<DIV class='title'>수입 등록</DIV>

<div class='content'>
<form name='frm' method='POST' action="./create.do">  
<input type='hidden' name='mno' id='mno' value='1'>           <!-- mno 번호 들어가게 수정 -->    
<TABLE class='table' style='width: 100%;'>

  <colgroup> 
    <col style='width: 15%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
    <col style='width: 15%;'/>
  </colgroup>
  <TR>
    <TH class='th'>날짜</TH>
    <TH class='th'>수입내용</TH>
    <TH class='th'>수입금액</TH>
    <TH class='th'>기타</TH>
  </TR>   
  <TR>    
    <TD class='td'><input type="date" name='rdate' id='rdate' required="required"></TD>
    <TD class='td'><input type='text' name='incomeitem' id='incomeitem' required="required"></TD>
    <TD class='td'><input type='text' name='incomemoney' id='incomemoney' required="required"></TD>
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