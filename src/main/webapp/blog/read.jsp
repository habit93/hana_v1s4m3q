<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.hana.blog.*" %>
<%@ page import="com.hana.pds6.*" %>
<%@ page import="com.hana.tool.Tool" %>

<% 
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO"); 
int blogno = blogVO.getBlogno();
%>

<!DOCTYPE html> 
<html lang="ko"> 
  <head>
    <title>글 조회</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.cookie.js"></script>
    <script type="text/javascript" src="../js/tool.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function(){
    $('#reply').show();
    $('#reply_reply').hide();
  });
  
  function good_up(blogno, good){
    good = good +1;
    location.href='./good_up.do?blogno='+blogno + '&good=' + good;
  }
  
  function reply_set(){
    $('#reply').show();
    $('#reply_reply').hide();
    $('#button', reply_frm).attr('value', '등록');
    $('#reply_frm').attr('action', '../pds6/create_proc.jsp');
  }
  
  function reply_update(blogreplyno, str){
    $('#reply').show();
    $('#reply_reply').hide();
    $('#button', reply_frm).attr('value', '수정');
    $('#content', reply_frm).innerHTML(str);
    $('#reply_frm', reply_frm).attr('action', '../pds6/update_proc.jsp');
  }
  
  function reply_reply(blogreplyno, blogno){
    $('#reply').hide();
    $('#reply_reply').show();
    $('#blogreplyno', reply_reply_frm).attr('value', blogreplyno);
  }
  </script>
  </head>
<!-- --------------------------------------------------------- -->
  <body >
  <jsp:include page="/menu/top.jsp" flush='false' />
<!-- --------------------------------------------------------- -->

  <div class='content_menu'> 
    <span style="font: 1em bold; "><%=blogVO.getTitle() %>(<%=blogVO.getGood() %>)</span>
    <label style="float: right;"><%=blogVO.getRdate().substring(0,16)%>  
    <A href='./update.do?blogno=<%=blogVO.getBlogno()%>&blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>｜글 수정</A>｜
    <A href='./delete.do?blogno=<%=blogVO.getBlogno()%>&blogcategoryno=<%=blogVO.getBlogcategoryno() %>'>글 삭제</A>
    </label>    
  </div> 
  
  <hr style="width:70%; margin: 0px auto">  

  <DIV class='content_item'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="blogno" value="<%=blogVO.getBlogno() %>">
            <span><%=blogVO.getContent() %></span>
            <p style="font-size: 90px; margin-bottom: 5px; color: red;"><%=blogVO.getGood()%>  
              <a href='javascript: good_up(<%=blogVO.getBlogno() %>, <%=blogVO.getGood() %>)'>
                <img alt="좋아요"  title="좋아요" src="./images/good.png">  
              </a> 
            </p>
<%--             <span><%=blogVO.getReplycnt()%></span>   --%>
    </FORM>
  </DIV> 

<!-- 댓글 시작 -->
  <DIV class='container'>
  <TABLE class='table table-hover' >
  <TR>
    <TH class='th' style='width: 10%;'>번호</TH>
    <TH class='th' style='width: 30%;'>내용</TH>
    <TH class='th' style='width: 15%;'>등록일</TH>
    <TH class='th' style='width: 15%;'>작성자</TH>
    <TH class='th' style='width: 15%;'>기타</TH>
  </TR>
<%
Pds6DAO pds6DAO = new Pds6DAO();
 ArrayList<Pds6DTO> list2 = pds6DAO.list(blogno);
 
for(int index = 0; index < list2.size(); index++){
  Object obj = list2.get(index); // NewsDTO 추출하는데 광범위한 공통 타입인 Object 타입으로 추출
  Pds6DTO pds6DTO = (Pds6DTO)obj;// 광범위한 Object 타입을 구체적인 클래스 타입으로 변환해야 사용 가능
  int blogreplyno = pds6DTO.getBlogreplyno();  // 레코드 번호 추출
%>  
  <TR>
    <TD class='td'><%=blogreplyno %></TD>
    <TD class='td' style='text-align: left;'>
      <%
      int indent = pds6DTO.getIndent();
      for(int i=0; i < indent; i++){
        out.println("&nbsp;&nbsp;&nbsp;&nbsp;");
      }

      if (indent > 0){
      %>
        <img src='../pds5/images/reply2.png'>
      <%  
      }
      
      String str = pds6DTO.getContent();
   
      str = Tool.convertChar(str); // 태그를 단순 문자로 변환
      %>      
      <%=str %>
      <%
      if (Tool.isNew(pds6DTO.getRdate(), 1)){ 
      %> 
        <IMG src='../pds6/images/new.gif'>
      <%
      }
      %> 
    </TD>
    <TD class='td'><%=pds6DTO.getRdate().substring(0, 10) %></TD>
    <TD class='td'><%=pds6DTO.getRname()%></TD>
    <TD class='td'>
      <A href="javascript: reply_reply(<%=blogreplyno%>, <%=blogno%>)"><IMG src='../pds6/images/reply.png' title='답변'></A>
      <A href="javascript: reply_update(<%=blogreplyno%>, <%=str%>)"><IMG src='../pds6/images/update.png' title='수정'></A>
      <A href='../pds6/delete_form.jsp?blogreplyno=<%=blogreplyno %>'><IMG src='../pds6/images/delete.png' title='삭제'></A>
    </TD>
  </TR>

<%
}
%>
</TABLE>
  </DIV>
<!-- 댓글 끝 -->
   
   
<!-- 댓글 등록 -->
  <DIV id='reply'>
  <FORM name='reply_frm' method='POST' action='../pds6/create_proc.jsp'>
    <input type='hidden' id='blogno' name='blogno' value='<%=blogno%>'>
    <input type='hidden' id='rname' name='rname' value='${id }'>
      <div style="text-align:center;">
        <TEXTAREA name='content'id='content' rows='4' style='width: 70%;' ></TEXTAREA> 
        <input type='password' name='passwd' style='width: 70%;' value='123' placeholder="패스워드" >
      </div>
   
    <DIV class='feature'>
      <input type='submit' class="btn-sm" id='button' value='댓글 등록'>
      <input type='button' class="btn-sm" value='취소' onclick="javascript: reply_set()"> 
    </DIV> 
  </FORM>
  </DIV>
<!-- 댓글 등록 끝 -->
  
 <!-- 답변 등록 -->
  <DIV id='reply_reply'>
  <FORM name='reply_reply_frm' method='POST' action='../pds6/reply_proc.jsp'>   
    <input type='hidden'id='blogreplyno' name='blogreplyno'>
    <input type='hidden'id='blogno' name='blogno' value='<%=blogno %>'>
    <input type='hidden'id='rname' name='rname' value='${id }'>
    <div style="text-align:center;">
      <TEXTAREA name='content' id='content' rows='4' style='width: 70%;'>답변입니다.</TEXTAREA>
      <input type='password' name='passwd' style='width: 70%;' value='123' placeholder="패스워드">
    </div>
  
    <DIV class='feature'>
      <input type='submit' class="btn-sm" value='답변 등록'>
      <input type='button' class="btn-sm" value='취소' onclick="javascript: reply_set()"> 
    </DIV> 
  </FORM>
  </DIV>
<!-- 답변 등록 끝 -->
  
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
