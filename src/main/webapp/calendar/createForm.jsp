<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %> 
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.hana.expense.ExpenseVO"%>
<%@ page import="com.hana.category.CategoryVO" %> 
<%
  SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
  Date date = new Date(); //오늘날짜생성
  String today = sd.format(date); //date -> string
  %>
 
<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>일정 등록</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

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
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

<DIV class='title'>일정 등록</DIV>

<div class='container'>
<form name='frm' action="./createProc.jsp" method="POST" onSubmit="return checkData(this)">
    <input type='hidden' name='mno' id='mno' value='${mno }'>
    <ul> 
      <li>  
        <label class='form'>날짜</label>
        <input type='date' class="input-sm" name=rdate id='rdate' value="<%=today%>" required="required">
      </li>
      <li>
        <label class='form'>달력 레이블</label> 
        <input type='text' class="input-sm" name='label' id='label' size='70' required="required"> 
      </li>
      <li>
        <label class='form'>제목</label>
        <input type='text' class="input-sm" name='title' id='title' size='70' required="required">
      </li>
      <li>
        <label class='form'>내용</label>
        <input type="text" class="input-sm" name='contents' id='contents' size='70' required="required">
      </li>
      <li class='feature'>
        <button type="submit" class="btn-sm" >등록</button>
        <button type="button" class="btn-sm" onclick="location.href='./calendar.jsp'">달력보기</button>
      </li>         
    </ul>
</form>
</div> 

<!-- --------------------------------------------------------- -->
    <jsp:include page="../menu/bottom.jsp" flush='false' />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
  </body>
<!-- --------------------------------------------------------- -->
</html>












