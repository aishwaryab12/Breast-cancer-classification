<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<FRAMESET rows="20%,*" border="0">
		<%
			String technique = request.getParameter("technique");
			String file = technique.concat(".html");
			if(technique.equalsIgnoreCase("naive Bayes"))
			{
				%>
					<FRAME src="nd.html">
					<FRAMESET cols="50%,*">
					    <FRAME src="nb_details.html" border="1">
					    <FRAME src="nb_process.jsp">
					</FRAMESET>
				
				
				<% 
			}
			else if(technique.equalsIgnoreCase("J48"))
			{
				%>
					<FRAME src="j48.html">
					<FRAMESET cols="50%,*" >
					    <FRAME src="j48_details.html" border="1">
					    <FRAME src="j48_process.jsp">
					</FRAMESET>				
				
				<% 
			}
			else
			{
				%>				
					<FRAME src="decisionTable.html">
					<FRAMESET cols="50%,*" border="1">
					    <FRAME src="decisionTable_details.html" border="1">
					    <FRAME src="decisionTable_process.jsp">
					</FRAMESET>					
					<%
			
			
			}
		
		%>
		
		
	 	
		
</FRAMESET>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>