<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.util.*" %>

<%@ page import="org.apache.commons.fileupload.*" %>

<%@ page import="com.hana.tool.*" %>
<%@ page import="com.hana.pds6.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
Pds6DAO pds6DAO = new Pds6DAO();
%>

<%
// null -> "" 비어있는 공백으로 변경
String col = Tool.checkNull(request.getParameter("col"));
String word = Tool.checkNull(request.getParameter("word"));

//System.out.println("--> col: " + col);
//System.out.println("--> word: " + word);
%>

<%
int nowPage = 1; // 현재 페이지
if (request.getParameter("nowPage") != null){
  nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
%>
