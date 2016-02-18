<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hana.item.ItemVO" %>
<%@ page import="com.hana.tool.Tool" %>
 
<% 
ItemVO itemVO = (ItemVO)request.getAttribute("itemVO");  
%>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src='../js/tool.js'></script>
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script type="text/javascript">
 
 function price_b(){
   var cnt = document.getElementById("cnt").value;
   var price = document.getElementById("price_basic").value;
   var tot = parseInt(cnt) * parseInt(price);
   document.getElementById("price_b").innerHTML=tot;
   document.getElementById("price_hb").value=tot;
 }
 
 function price_c(){
   var cnt = document.getElementById("cnt2").value;
   var price = document.getElementById("price_basic").value;
   var tot = parseInt(cnt) * parseInt(price);
   document.getElementById("price_c").innerHTML=tot;
   document.getElementById("price_hc").value=tot;
 }
</script>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->
  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="itemno" id='itemno' value="<%=itemVO.getItemno() %>">
      <input type="hidden" name="price_basic" id='price_basic' value="<%=itemVO.getPrice() %>">
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='thumb' class="label" style="width:150px;"></label>
            <IMG src='./storage/<%=itemVO.getThumb()%>' id='thumb'>
          </li>
          <li>
            <label for='title' class="label" style="width:150px;"></label>
            <span><%=itemVO.getTitle() %></span>
          </li>
          <li>
            <label for="price2" class="label" style="width:150px;"></label>
           <%=itemVO.getPrice()%>
          </li>
          <li>
            <label for="content" class="label" style="width:150px;"></label>
            <span><%=itemVO.getContent()%></span>
          </li>
        </ul>
      </fieldset>
    </FORM>
    <HR>
    <!-- 구매 폼 -->
    <FORM name='frm_buy' method="POST" action='../buy/buy.do'>
      <input type='hidden' name='name' id='name' value='<%=itemVO.getTitle()%>'>
      <input type='hidden' name='itemno' id='itemno' value='<%=itemVO.getItemno() %>'>
      <input type='hidden' name='price' id='price_hb' value='<%=itemVO.getPrice() %>'>
      <input type='hidden' name='thumb' id='thumb' value='<%=itemVO.getThumb() %>'>
      <input type='hidden' name='mno' id='mno' value='${mno }'>
      <ul>
      <li>
       <label>이름</label>
       <span><%=itemVO.getTitle() %></span>
      </li>
      <li>
        <label for='cnt'>수량</label>
        <input type='number' name='cnt' id='cnt' value='1' min='0' step="1" max='99' onchange="price_b()" required="required" autocomplete="off">
      </li>
      <li>
        <label>총 상품 가격</label>
        <span id='price_b'><%=itemVO.getPrice() %></span>
      </li>
      <li>
        <label class='label' for='zipcode'>우편번호</label>
        <input type='text' name='zipcode' id='zipcode' value='' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>        
      </li>
      <li>
        <label class='label' for='address1'>주소</label>
        <input type='text' name='address1' id='address1' value='' size='60' placeholder="주소">  
      </li>
      <li>
        <label class='label' for='address2'>상세 주소</label>
        <input type='text' name='address2' id='address2' value='' size='40' placeholder="상세 주소">      
      </li>
      <li>
        <label class='label'></label>  
<!--  ----- DAUM 우편번호 API 시작 ----- -->

<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>

   <!-- ----- DAUM 우편번호 API 종료-----  --> 
      <li class='right'>
        <button type='submit' >구매</button>
      </li>
     </ul>
    </FORM>
    <hr>
    <!-- 쇼핑카트 폼 -->
    <FORM name='frm_buy' method="POST" action='../cart/cart.do'>
      <input type='hidden' name='name' id='name' value='<%=itemVO.getTitle()%>'>
      <input type='hidden' name='itemno' id='itemno' value='<%=itemVO.getItemno() %>'>
      <input type='hidden' name='price' id='price_hc' value='<%=itemVO.getPrice() %>'>
      <input type='hidden' name='thumb' id='thumb' value='<%=itemVO.getThumb() %>'>
      <input type='hidden' name='mno' id='mno' value='${mno }'>
      <ul>
      <li>
       <label>이름</label>
       <span><%=itemVO.getTitle() %></span>
      </li>
      <li>
        <label for='cnt2'>수량</label>
        <input type='number' name='cnt' id='cnt2' value='1' min='0' step="1" max='99' onchange="price_c()" required="required">
      </li>
      <li>
        <label>총 상품 가격</label>
        <span id='price_c'><%=itemVO.getPrice() %></span>
      </li>
      <li class='right'>
        <button type='submit' >쇼핑카트에 추가</button>
      </li>
     </ul>
    </FORM> 
  </DIV>
  <DIV class='bottom'>
      <button type="button" onclick="location.href='./update.do?itemno=<%=itemVO.getItemno()%>&categoryno=<%=itemVO.getCategoryno()%>'">수정</button>
      <button type="button" onclick="location.href='./delete.do?itemno=<%=itemVO.getItemno()%>&categoryno=<%=itemVO.getCategoryno()%>'">삭제</button>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

