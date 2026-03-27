<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Adaugă Compoziție Rețetă</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
try {
    int idreteta = Integer.parseInt(request.getParameter("idreteta"));
    int idingredient = Integer.parseInt(request.getParameter("idingredient"));

    String cantitate = request.getParameter("Cantitate");
    String unitate = request.getParameter("Unitate");

    jb.connect();
    jb.adaugaRetetaIngredient(idreteta, idingredient, cantitate, unitate);
    jb.disconnect();

    response.sendRedirect("tabela_RetetaIngredient.jsp");
} catch (Exception e) {
%>
  <h2>Eroare la adăugare compoziție</h2>
  <p><%= e.getMessage() %></p>
  <p><a href="nou_RetetaIngredient.jsp"><b>Înapoi</b></a> |
  <a href="index.html"><b>Meniu principal</b></a></p>
<%
}
%>
</body>
</html>