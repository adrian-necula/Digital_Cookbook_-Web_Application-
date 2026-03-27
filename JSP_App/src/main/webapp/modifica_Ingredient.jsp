<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Modifică Ingrediente</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<h1>Modifică Ingrediente</h1>
<br/>

<p>
  <a href="tabela_Ingrediente.jsp"><b>Înapoi la ingrediente</b></a>
  <a href="index.html"><b>Meniu principal</b></a>
</p>

<form action="m1_Ingredient.jsp" method="post">
<table>
<tr>
  <td><b>Selectare</b></td>
  <td><b>ID Ingredient</b></td>
  <td><b>Nume Ingredient</b></td>
  <td><b>Alergen</b></td>
</tr>

<%
jb.connect();
ResultSet rs = jb.vedeTabela("ingrediente");
long x;

while (rs.next()) {
  x = rs.getInt("idingredient");
%>
<tr>
  <td><input type="radio" name="primarykey" value="<%= x %>" required></td>
  <td><%= x %></td>
  <td><%= rs.getString("NumeIngredient") %></td>
  <td><%= rs.getString("Alergen") %></td>
</tr>
<%
}
rs.close();
jb.disconnect();
%>

</table>
<br/>
<p>
  <input type="submit" value="Modifică ingredientul selectat " style="width: auto; min-width: 250px; padding: 0 20px;" />
</p>
</form>

</body>
</html>