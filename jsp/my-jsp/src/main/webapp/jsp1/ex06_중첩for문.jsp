<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중첩for문</title>
	<style>
		table,td {border: 1px solid;}
	</style>
</head>
<body>
<h2>구구단</h2>
		<table>
	<% 
	for(int i=1; i<=9; i++) {
		%>
		<tr><td>2 * <%= i %> = <%= 2*i %></td></tr>
	<%
		} 
	%>
	</table>
	
	<%--(중첩for) --%>
	<h2>구구단(중첩for)</h2>
	<table>
	<% 
		for(int i=2; i<=9; i++) {
			for(int j=1; j<=9; j++) {
		%>
		<tr><td><%= i %> * <%= j %> = <%= i*j %></td></tr>
		<%
		}
	} 
	%>
	</table>
	<%-- --------------------------------------------------------------------- --%>

	<%--(중첩for) --%>
	<h2>구구단(중첩for)</h2>
	<table>
	
      <tr>
        <% for(int j = 2; j <= 9; j++) { %>
            <th><%= j %>단</th>
        <% } %>
    </tr>

    <% for(int i = 1; i <= 9; i++) { %>
        <tr>
            <% for(int j = 2; j <= 9; j++) { %>
                <td>
                    <%= j %> * <%= i %> = <%= j * i %>
                </td>
            <% } %>
        </tr>
    <% } %>
	</table>
	
</body>
</html>