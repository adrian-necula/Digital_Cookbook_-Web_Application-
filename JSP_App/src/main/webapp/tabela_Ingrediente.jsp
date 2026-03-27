<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Tabela Ingrediente</title>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var checkboxes = document.getElementsByName('primarykey');
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].onclick = function() {
                var cbs = document.getElementsByName('primarykey');
                if (cbs.length > 0) {
                    cbs[0].setCustomValidity(""); 
                }
            };
        }
    });

    function valideazaSelectie() {
        var checkboxes = document.getElementsByName('primarykey');
        var esteSelectat = false;
        
        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                esteSelectat = true;
                break;
            }
        }

        if (!esteSelectat) {
            if (checkboxes.length > 0) {
                checkboxes[0].setCustomValidity("Te rog să selectezi cel puțin un ingredient pentru ștergere.");
                checkboxes[0].reportValidity();
            }
            return false;
        }
        
        return confirm("Sigur dorești să ștergi ingredientele selectate?");
    }
</script>

</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<h1>Ingrediente</h1>
<br/>

<p>
  <a href="nou_Ingredient.jsp"><b>Adaugă un nou ingredient</b></a>
  <a href="index.html"><b>Meniu principal</b></a>
</p>

<form action="sterge_Ingredient.jsp" method="post" onsubmit="return valideazaSelectie()">
<table>
<tr>
   <td><b>Selectare</b></td>
   <td><b>ID Ingredient</b></td>
   <td><b>Nume Ingredient</b></td>
   <td><b>Alergen</b></td>
</tr>

<%
jb.connect();
ResultSet rs = jb.vedeTabela("ingrediente");
long x;

while (rs.next()) {
  x = rs.getInt("idingredient");
%>
<tr>
  <td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
  <td><%= x %></td>
  <td><%= rs.getString("NumeIngredient") %></td>
  <td><%= rs.getString("Alergen") %></td>
</tr>
<%
}
rs.close();
jb.disconnect();
%>

</table>
<br/>
<p>
  <input type="submit" value="Șterge ingredientele selectate" style="width: auto; min-width: 250px; padding: 0 20px;" />
</p>
</form>

<br/>
<p>
  <a href="modifica_Ingredient.jsp"><b>Modifică Ingrediente</b></a>
</p>

</body>
</html>