<%@page import="guestbook.service.WriteMessageService"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="message" class="guestbook.model.Message">
	<jsp:setProperty name="message" property="*"/>
</jsp:useBean>

<%
	//String message1 = request.getParameter("message");
	WriteMessageService service = WriteMessageService.getInstance();
	service.write(message);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	방명록에 메시지를 남겼습니다.<br>
	<a href="hello.jsp">[목록보기]</a>
	
</body>
</html>