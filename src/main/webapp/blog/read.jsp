<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hana.blog.*" %>
<%@ page import="com.hana.tool.Tool" %>

<% 
BlogVO blogVO = (BlogVO)request.getAttribute("blogVO");  
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
function good_up(blogno, good){
  good = good +1;
  location.href='./good_up.do?blogno='+blogno + '&good=' + good;
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
