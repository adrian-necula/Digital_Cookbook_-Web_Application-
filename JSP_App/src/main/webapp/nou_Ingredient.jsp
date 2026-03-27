<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Adaugă Ingredient</title>
</head>
<body>

<h1>Adaugă un nou ingredient</h1>
<br/>

<form action="adauga_Ingredient.jsp" method="post">
  <table>
    <tr><td><b>Nume Ingredient</b></td><td><input type="text" name="NumeIngredient" size="40" required></td></tr>
    <tr><td><b>Alergen</b></td><td><input type="text" name="Alergen" size="40"></td></tr>
  </table>

  <br/>
  <p>
    <input type="submit" value="Salvează">
  </p>
  <p>
    <a href="tabela_Ingrediente.jsp"><b>Înapoi</b></a>
    <a href="index.html"><b>Meniu principal</b></a>
  </p>
</form>

</body>
</html>