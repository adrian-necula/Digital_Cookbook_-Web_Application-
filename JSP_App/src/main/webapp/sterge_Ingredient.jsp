<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Șterge Ingrediente</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
try {
    String[] ids = request.getParameterValues("primarykey");
    if (ids != null && ids.length > 0) {
        jb.connect();
        jb.stergeDateTabela(ids, "ingrediente", "idingredient");
        jb.disconnect();
    }
    response.sendRedirect("tabela_Ingrediente.jsp");
} catch (Exception e) {
%>
  <h2>Eroare la ștergere ingrediente</h2>
  <p><%= e.getMessage() %></p>
  <p>
    <a href="tabela_Ingrediente.jsp"><b>Înapoi</b></a> |
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
<%
}
%>
</body>
</html>