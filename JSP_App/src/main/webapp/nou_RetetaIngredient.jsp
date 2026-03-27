<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Adaugă Compoziție Rețetă</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<h1>Adaugă o compoziție</h1>
<br/>

<%
jb.connect();
ResultSet rsR = jb.vedeTabela("retete");
ResultSet rsI = jb.vedeTabela("ingrediente");
%>

<form action="adauga_RetetaIngredient.jsp" method="post">
  <table>
    <tr>
      <td><b>Rețetă</b></td>
      <td>
        <select name="idreteta" required>
          <option value="">-- Selectează --</option>
          <%
          while (rsR.next()) {
          %>
            <option value="<%= rsR.getInt("idreteta") %>">
              <%= rsR.getInt("idreteta") %> - <%= rsR.getString("NumeReteta") %>
            </option>
          <%
          }
          %>
        </select>
      </td>
    </tr>

    <tr>
      <td><b>Ingredient</b></td>
      <td>
        <select name="idingredient" required>
          <option value="">-- Selectează --</option>
          <%
          while (rsI.next()) {
          %>
            <option value="<%= rsI.getInt("idingredient") %>">
              <%= rsI.getInt("idingredient") %> - <%= rsI.getString("NumeIngredient") %>
            </option>
          <%
          }
          %>
        </select>
      </td>
    </tr>

    <tr>
      <td><b>Cantitate</b></td>
      <td><input type="text" name="Cantitate" size="20"></td>
    </tr>

    <tr>
      <td><b>Unitate măsură</b></td>
      <td><input type="text" name="Unitate" size="20"></td>
    </tr>
  </table>

  <br/>
  <p>
    <input type="submit" value="Salvează">
  </p>
  <p>
    <a href="tabela_RetetaIngredient.jsp"><b>Înapoi</b></a>
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
</form>

<%
rsR.close();
rsI.close();
jb.disconnect();
%>

</body>
</html>