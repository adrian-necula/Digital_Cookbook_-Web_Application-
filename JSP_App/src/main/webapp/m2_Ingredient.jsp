<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Salvează Ingredient</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
try {
    int id = Integer.parseInt(request.getParameter("idingredient"));
    
    String[] campuri = {"NumeIngredient", "Alergen"};
    String[] valori = {
        request.getParameter("NumeIngredient"),
        request.getParameter("Alergen")
    };
    
    jb.connect();
    jb.modificaTabela("ingrediente", "idingredient", id, campuri, valori);
    jb.disconnect();

    response.sendRedirect("tabela_Ingrediente.jsp");
} catch (Exception e) {
%>
  <h2>Eroare la modificare ingredient</h2>
  <p><%= e.getMessage() %></p>
  <p>
    <a href="modifica_Ingredient.jsp"><b>Înapoi</b></a> |
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
<%
}
%>
</body>
</html>