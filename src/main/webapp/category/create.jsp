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
    <DIV class='title'>지출 카테고리 등록</DIV>

    <div class='content'>
        <form name='frm' method='POST' action="./create.do">
            <fieldset> 
                <ul>
                  <li>
                    <label class='label' for='sort'>지출 카테고리</label> 
                    <input type='text' name='sort' id='sort' value='' required="required">             
                  </li>
                  <li class='right'>
                    <button type='submit'>등록</button>
                    <button type="button" onclick="location.href='./list.do'">목록</button>
                  </li>
                  </ul>
            </fieldset>
        </form>
    </div>
<!-- ------------------------------------- -->
</body>
<!-- ------------------------------------- -->
</html> 