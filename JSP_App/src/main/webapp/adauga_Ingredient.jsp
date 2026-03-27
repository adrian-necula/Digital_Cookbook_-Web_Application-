<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Adaugă Ingredient</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
try {
    String nume = request.getParameter("NumeIngredient");
    String alergen = request.getParameter("Alergen");

    jb.connect();
    jb.adaugaIngredient(nume, alergen);
    jb.disconnect();

    response.sendRedirect("tabela_Ingrediente.jsp");
} catch (Exception e) {
%>
  <h2>Eroare la adăugare ingredient</h2>
  <p><%= e.getMessage() %></p>
  <p><a href="nou_Ingredient.jsp"><b>Înapoi</b></a> |
  <a href="index.html"><b>Meniu principal</b></a></p>
<%
}
%>
</body>
</html>