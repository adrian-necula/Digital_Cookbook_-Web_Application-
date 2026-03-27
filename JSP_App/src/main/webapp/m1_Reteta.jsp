<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Editare Rețetă</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
int id = Integer.parseInt(request.getParameter("primarykey"));
jb.connect();
ResultSet rs = jb.intoarceLinieDupaId("retete", "idreteta", id);
rs.first();
%>

<h1>Editează rețeta (ID: <%= id %>)</h1>
<br/>

<form action="m2_Reteta.jsp" method="post">
  <input type="hidden" name="idreteta" value="<%= id %>">

  <table>
    <tr><td><b>Nume Rețetă</b></td><td><input type="text" name="NumeReteta" value="<%= rs.getString("NumeReteta") %>" required></td></tr>
    <tr><td><b>Descriere</b></td><td><input type="text" name="Descriere" value="<%= rs.getString("Descriere") %>"></td></tr>
    <tr><td><b>Timp Preparare</b></td><td><input type="number" name="TimpPreparareMin" min="0" value="<%= rs.getInt("TimpPreparareMin") %>"></td></tr>
    <tr><td><b>Porții</b></td><td><input type="number" name="Portii" min="0" value="<%= rs.getInt("Portii") %>"></td></tr>
  </table>

  <br/>
  <p>
    <input type="submit" value="Salvează modificări" style="width: auto; min-width: 250px; padding: 0 20px;" />
  </p>
  <p>
    <a href="modifica_Reteta.jsp"><b>Anulează</b></a>
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
</form>

<%
rs.close();
jb.disconnect();
%>
</body>
</html>