<%@ page contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title> 등록 </title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
function checkData(f){ // f == document.frmData 객체
    var msg; // 에러 메세지
    var str; // 임시 문자열 저장 변수
      
    // 제목 앞뒤의 공백 제거
    str = f.title.value.replace(/^\s*|\s*$/g,'');
    if (str.length == 0){
        msg = '안내\n\n제목을 입력해 주십시오'; 
        window.alert(msg);
        f.title.focus();
        return false;
    }
    
    // 내용 앞뒤의 공백 제거
    str = f.content.value.replace(/^\s*|\s*$/g,''); 

    // 이름의 길이를 비교
    if (str.length == 0){
        msg = '안내\n\n내용을 입력해 주십시오'; 
        window.alert(msg);
        f.content.focus();
        return false;
    }
    
    return true;
}
</script>
</head>

<!-- *********************************************** -->
<body style="margin: 0px">
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<DIV style='text-align: center'>
  <DIV class="title" style='width: 20%;'>일정 등록</DIV>
</DIV> 
    
<FORM name="frm" action="./createProc.jsp" method="POST" onSubmit="return checkData(this)">
  <input type='hidden' name='mno' id='mno' value='${mno }'>  
  <table style='border: 0px none #FFFFFF; width: 70%;'>
    <tr>
      <th width='20%'>날짜</th>
      <td width='80%' style='text-align: left; border: 0px none #FFFFFF'>
        <input type='date' name='rdate' id='rdate' size='10'>
      </td>
    </tr>  
    <tr>
      <th>출력 레이블</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <input type='text' name='label' id='label' size='20'>
        </td>
    </tr>  
    <tr>
      <th>제목</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <input type='text' name='title' id='title' size='50'>    
      </td>
    </tr>
    <tr>
      <th>내용</th>
      <td style='text-align: left; border: 0px none #FFFFFF'>
        <TEXTAREA name='contents' id='contents' style = 'border:1px solid; width: 100%' rows="10"></TEXTAREA>
      </td>
    </tr>      
     
  </table>

  <DIV style='text-align: center; border: 0px none #FFFFFF'>  
    <DIV class='bottom'> 
      <input type='submit' value='등록'>
      <input type='button' value='목록'
             onclick="location.href='./list.jsp'">   
    </DIV>
  </DIV>
  
</FORM>

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html>
<!-- *********************************************** -->












