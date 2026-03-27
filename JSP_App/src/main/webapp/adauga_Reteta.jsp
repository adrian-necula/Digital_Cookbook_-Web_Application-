<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="db.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Adaugă Rețetă</title>
</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<%
try {
    String nume = request.getParameter("NumeReteta");
    String descriere = request.getParameter("Descriere");

    int timp = 0;
    int portii = 0;

    String t = request.getParameter("TimpPreparareMin");
    if (t != null && t.trim().length() > 0) timp = Integer.parseInt(t);

    String p = request.getParameter("Portii");
    if (p != null && p.trim().length() > 0) portii = Integer.parseInt(p);

    jb.connect();
    jb.adaugaReteta(nume, descriere, timp, portii);
    jb.disconnect();

    response.sendRedirect("tabela_Retete.jsp");
} catch (Exception e) {
%>
  <h2>Eroare la adăugare rețetă</h2>
  <p><%= e.getMessage() %></p>
  <p><a href="nou_Reteta.jsp"><b>Înapoi</b></a> |
  <a href="index.html"><b>Meniu principal</b></a></p>
<%
}
%>
</body>
</html>