<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Salvează Rețeta</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
try {
    int id = Integer.parseInt(request.getParameter("idreteta"));
    String[] campuri = {"NumeReteta", "Descriere", "TimpPreparareMin", "Portii"};
    String[] valori = {
        request.getParameter("NumeReteta"),
        request.getParameter("Descriere"),
        request.getParameter("TimpPreparareMin"),
        request.getParameter("Portii")
    };
    jb.connect();
    jb.modificaTabela("retete", "idreteta", id, campuri, valori);
    jb.disconnect();

    response.sendRedirect("tabela_Retete.jsp");
} catch (Exception e) {
%>
  <h2>Eroare la modificare rețetă</h2>
  <p><%= e.getMessage() %></p>
  <p>
    <a href="modifica_Reteta.jsp"><b>Înapoi</b></a> |
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
<%
}
%>
</body>
</html>