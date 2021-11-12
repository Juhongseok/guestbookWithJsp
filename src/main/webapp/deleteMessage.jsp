<%@page import="guestbook.service.InvalidPasswordException"%>
<%@page import="guestbook.service.DeleteMessageService"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String password = request.getParameter("password");
	boolean invalidPassword = false;
	try{
		DeleteMessageService deleteService = DeleteMessageService.getInstance();
		deleteService.delete(messageId, password);
	}catch(InvalidPasswordException e){
		invalidPassword = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${!invalidPassword}">
		메세지를 삭제하였습니다.
	</c:if>
	
	<c:if test="${invalidPassword}">
		암호가 올바르지 않습니다. 암호를 확인해 주세요.
	</c:if>
	
	<a href="hello.jsp">[목록보기]</a>
</body>
</html>