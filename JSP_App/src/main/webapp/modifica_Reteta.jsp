<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Modifică Rețete</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<h1>Modifică Rețete</h1>
<br/>

<p>
  <a href="tabela_Retete.jsp"><b>Înapoi la rețete</b></a>
  <a href="index.html"><b>Meniu principal</b></a>
</p>

<form action="m1_Reteta.jsp" method="post">
<table>
<tr>
  <td><b>Selectare</b></td>
  <td><b>ID Rețetă</b></td>
  <td><b>Nume Rețetă</b></td>
  <td><b>Descriere</b></td>
  <td><b>Timp Preparare</b></td>
  <td><b>Porții</b></td>
</tr>

<%
jb.connect();
ResultSet rs = jb.vedeTabela("retete");
long x;

while (rs.next()) {
  x = rs.getInt("idreteta");
%>
<tr>
  <td><input type="radio" name="primarykey" value="<%= x %>" required></td>
  <td><%= x %></td>
  <td><%= rs.getString("NumeReteta") %></td>
  <td><%= rs.getString("Descriere") %></td>
  <td><%= rs.getInt("TimpPreparareMin") %></td>
  <td><%= rs.getInt("Portii") %></td>
</tr>
<%
}
rs.close();
jb.disconnect();
%>

</table>
<br/>
<p>
  <input type="submit" value="Modifică rețeta selectată" style="width: auto; min-width: 250px; padding: 0 20px;" />
</p>
</form>

</body>
</html>