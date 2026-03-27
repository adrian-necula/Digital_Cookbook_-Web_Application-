<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Modifică Compoziție Rețete</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<h1>Modifică Compoziție Rețete</h1>
<br/>

<p>
  <a href="tabela_RetetaIngredient.jsp"><b>Înapoi la compoziție</b></a>
  <a href="index.html"><b>Meniu principal</b></a>
</p>

<form action="m1_RetetaIngredient.jsp" method="post">
<table>
<tr>
  <td><b>Selectare</b></td>
  <td><b>ID Legatură</b></td>
  <td><b>Rețetă</b></td>
  <td><b>Ingredient</b></td>
  <td><b>Cantitate</b></td>
  <td><b>Unitate măsură</b></td>
</tr>

<%
jb.connect();
ResultSet rs = jb.vedeRetetaIngredient();
long x;

while (rs.next()) {
  x = rs.getInt("idreteta_ingredient");
%>
<tr>
  <td><input type="radio" name="primarykey" value="<%= x %>" required></td>
  <td><%= x %></td>
  <td><%= rs.getString("NumeReteta") %></td>
  <td><%= rs.getString("NumeIngredient") %></td>
  <td><%= rs.getString("Cantitate") %></td>
  <td><%= rs.getString("Unitate") %></td>
</tr>
<%
}
rs.close();
jb.disconnect();
%>

</table>
<br/>
<p>
  <input type="submit" value="Modifică compoziția selectată" style="width: auto; min-width: 250px; padding: 0 20px;" />
</p>
</form>

</body>
</html>