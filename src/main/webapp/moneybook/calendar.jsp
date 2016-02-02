<%@ page contentType="text/html; charset=UTF-8" %> 
<!DOCTYPE html>
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
          
 <style type="text/css">
 .wrap {
  width: 500px;
  margin: 0 auto;
}
.btn-holder {
  text-align: center;
  margin: 10px 0 10px 0;
}
#calendar table {
  border-collapse: collapse;
  text-align: center;
}
#calendar table thead td {
  height: 30px;
  font-weight: bold;
} 
#calendar table td {
  border: solid 1px #000;
}
#calendar table td.date-cell {
  height: 50px;
}
#calendar table td.sun {
  color: red;
}
#calendar table td.sat {
  color: blue;
}
#calendar table td.not-this-month {
  background: #ddd;
  color: #999;
}
</style>

<body>
<div class='wrap'>

  <div class='btn-holder'>
    <button id='btnPrev'>&lt;</button>
     <span id='currentDate'></span> 
    <button id='btnNext'>&gt;</button>
  </div>
  
  <div id="calendar"></div>

</div>














<script type="text/javascript">
var calendar = new controller(); 
calendar.init();

function controller(target) {

  var that = this;   
  var m_oMonth = new Date();
  m_oMonth.setDate(1);

  this.init = function() {
    that.renderCalendar();
    that.initEvent();
  }

    /* 달력 UI 생성 */
  this.renderCalendar = function() {
    var arrTable = [];

    arrTable.push('<table><colgroup>');
    for(var i=0; i<7; i++) {
      arrTable.push('<col width="100">');
    }   
    arrTable.push('</colgroup><thead><tr>');

    var arrWeek = "일월화수목금토".split("");

    for(var i=0, len=arrWeek.length; i<len; i++) {
      var sClass = '';
      sClass += i % 7 == 0 ? 'sun' : '';
      sClass += i % 7 == 6 ? 'sat' : '';
      arrTable.push('<td class="'+sClass+'">' + arrWeek[i] + '</td>');
    }
    arrTable.push('</tr></thead>');
    arrTable.push('<tbody>');

    var oStartDt = new Date(m_oMonth.getTime());
        // 1일에서 1일의 요일을 빼면 그 주 첫번째 날이 나온다.
    oStartDt.setDate(oStartDt.getDate() - oStartDt.getDay());

    for(var i=0; i<100; i++) {
      if(i % 7 == 0) {
        arrTable.push('<tr>');
      }

      var sClass = 'date-cell '
            sClass += m_oMonth.getMonth() != oStartDt.getMonth() ? 'not-this-month ' : '';
      sClass += i % 7 == 0 ? 'sun' : '';
      sClass += i % 7 == 6 ? 'sat' : '';

      arrTable.push('<td class="'+sClass+'">' + oStartDt.getDate() + '</td>');
      oStartDt.setDate(oStartDt.getDate() + 1);

      if(i % 7 == 6) {
        arrTable.push('</tr>');
        if(m_oMonth.getMonth() != oStartDt.getMonth()) {
          break;
        }
      }
    }
    arrTable.push('</tbody></table>');

    $('#calendar').html(arrTable.join(""));

    that.changeMonth();
  }

    /* Next, Prev 버튼 이벤트 */
  this.initEvent = function() {
    $('#btnPrev').click(that.onPrevCalendar);
    $('#btnNext').click(that.onNextCalendar);
  }

    /* 이전 달력 */
  this.onPrevCalendar = function() {
    m_oMonth.setMonth(m_oMonth.getMonth() - 1);
    that.renderCalendar();
  }

    /* 다음 달력 */
  this.onNextCalendar = function() {
    m_oMonth.setMonth(m_oMonth.getMonth() + 1);
    that.renderCalendar();
  }

    /* 달력 이동되면 상단에 현재 년 월 다시 표시 */
  this.changeMonth = function() {
    $('#currentDate').text(that.getYearMonth(m_oMonth).substr(0,9));
  }

    /* 날짜 객체를 년 월 문자 형식으로 변환 */
  this.getYearMonth = function(oDate) {
    return oDate.getFullYear() + '년 ' + (oDate.getMonth() + 1) + '월';
  }
}
</script>
</body>
</html>
