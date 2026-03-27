<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Editare Ingredient</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
int id = Integer.parseInt(request.getParameter("primarykey"));
jb.connect();
ResultSet rs = jb.intoarceLinieDupaId("ingrediente", "idingredient", id);
rs.first();
%>

<h1>Editează ingredient (ID: <%= id %>)</h1>
<br/>

<form action="m2_Ingredient.jsp" method="post">
  <input type="hidden" name="idingredient" value="<%= id %>">

  <table>
    <tr><td><b>Nume Ingredient</b></td><td><input type="text" name="NumeIngredient" value="<%= rs.getString("NumeIngredient") %>" required></td></tr>
    <tr><td><b>Alergen</b></td><td><input type="text" name="Alergen" value="<%= rs.getString("Alergen") %>"></td></tr>
  </table>

  <br/>
  <p>
    <input type="submit" value="Salvează modificări" style="width: auto; min-width: 250px; padding: 0 20px;" />
  </p>
  <p>
    <a href="modifica_Ingredient.jsp"><b>Anulează</b></a>
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
</form>

<%
rs.close();
jb.disconnect();
%>
</body>
</html>