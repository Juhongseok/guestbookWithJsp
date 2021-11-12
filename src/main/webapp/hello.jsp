<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="guestbook.service.MessageListView"%>
<%@page import="guestbook.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String pageNumber = request.getParameter("page");
	int pageNum = 1;
	if(pageNumber != null)
		pageNum = Integer.parseInt(pageNumber);
	
	GetMessageListService messageList = GetMessageListService.getInstance();
	MessageListView viewData = messageList.getMessageList(pageNum);
%>
<c:set var="viewData" value="<%= viewData %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 메세지 목록</title>
</head>
<body>
	<form action="writeMessage.jsp" method="post">
		이름 : <input type="text" name="guestName"> <br>
		암호 : <input type="password" name="password"> <br>
		메세지 : <textarea type="text" cols="30" rows="3" name="message"></textarea> <br>
		<input type="submit" value="메세지 남기기"/>
	</form>
	<hr>
	<c:if test="${viewData.isEmpty()}">
	등록된 메세지가 없습니다.
	</c:if>
	
	<c:if test="${!viewData.isEmpty()}">
		<table border="1">
			<c:forEach var="message" items="${viewData.messageList}">
				<tr>
					<td>
						메세지 번호: ${message.id} <br/>
						손님 이름: ${message.guestName} <br/>
						메세지: ${message.message} <br/>
						<a href="confirmDeletion.jsp?messageId=${message.id}">[삭제하기]</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
		<a href="hello.jsp?page=${pageNum}">[${pageNum}]</a>
		</c:forEach>
	</c:if>
</body>
</html>