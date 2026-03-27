<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Salvează Compoziția</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
try {
    int id = Integer.parseInt(request.getParameter("idreteta_ingredient"));
    String[] campuri = {"Cantitate", "Unitate"};
    String[] valori = {
        request.getParameter("Cantitate"),
        request.getParameter("Unitate")
    };
    jb.connect();
    jb.modificaTabela("reteta_ingredient", "idreteta_ingredient", id, campuri, valori);
    jb.disconnect();

    response.sendRedirect("tabela_RetetaIngredient.jsp");
} catch (Exception e) {
%>
  <h2>Eroare la modificare compoziție</h2>
  <p><%= e.getMessage() %></p>
  <p><a href="modifica_RetetaIngredient.jsp"><b>Înapoi</b></a> |
  <a href="index.html"><b>Meniu principal</b></a></p>
<%
}
%>
</body>
</html>