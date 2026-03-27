<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Editare Compoziție Rețetă</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
int id = Integer.parseInt(request.getParameter("primarykey"));
jb.connect();
ResultSet rs = jb.intoarceRetetaIngredientId(id);
rs.first();
%>

<h1>Editează compoziția (ID: <%= id %>)</h1>
<br/>

<form action="m2_RetetaIngredient.jsp" method="post">
  <input type="hidden" name="idreteta_ingredient" value="<%= id %>">

  <table>
    <tr>
      <td><b>Rețetă</b></td>
      <td><input type="text" value="<%= rs.getString("NumeReteta") %>" readonly></td>
    </tr>
    <tr>
      <td><b>Ingredient</b></td>
      <td><input type="text" value="<%= rs.getString("NumeIngredient") %>" readonly></td>
    </tr>
    <tr>
      <td><b>Cantitate</b></td>
      <td><input type="text" name="Cantitate" value="<%= rs.getString("Cantitate") %>"></td>
    </tr>
    <tr>
      <td><b>Unitate măsură</b></td>
      <td><input type="text" name="Unitate" value="<%= rs.getString("Unitate") %>"></td>
    </tr>
  </table>

  <br/>
  <p>
    <input type="submit" value="Salvează modificări" style="width: auto; min-width: 250px; padding: 0 20px;" />
  </p>
  <p>
    <a href="modifica_RetetaIngredient.jsp"><b>Anulează</b></a>
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
</form>

<%
rs.close();
jb.disconnect();
%>

</body>
</html>