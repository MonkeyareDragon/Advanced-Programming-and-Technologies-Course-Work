<%@page import="models.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello Mom!</h1>
<%

Connection con = ConnectionProvider.getConnection();

%>
<h1><%= con %></h1>
</body>
</html>