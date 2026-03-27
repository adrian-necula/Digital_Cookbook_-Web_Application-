<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Adaugă Rețetă</title>
</head>
<body>

<h1>Adaugă o nouă rețetă</h1>
<br/>

<form action="adauga_Reteta.jsp" method="post">
  <table>
    <tr><td><b>Nume Rețetă</b></td><td><input type="text" name="NumeReteta" size="40" required></td></tr>
    <tr><td><b>Descriere</b></td><td><input type="text" name="Descriere" size="60"></td></tr>
    <tr><td><b>Timp Preparare</b></td><td><input type="number" name="TimpPreparareMin" min="0"></td></tr>
    <tr><td><b>Porții</b></td><td><input type="number" name="Portii" min="0"></td></tr>
  </table>

  <br/>
  <p>
    <input type="submit" value="Salvează">
  </p>
  <p>
    <a href="tabela_Retete.jsp"><b>Înapoi</b></a>
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
</form>

</body>
</html>