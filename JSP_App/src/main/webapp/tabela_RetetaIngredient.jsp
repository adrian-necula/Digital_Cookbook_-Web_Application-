<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*,java.io.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="site.css" />
<title>Compoziție Rețete</title>

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
                checkboxes[0].setCustomValidity("Te rog să selectezi cel puțin o compoziție pentru ștergere.");
                checkboxes[0].reportValidity();
            }
            return false;
        }
        
        return confirm("Sigur dorești să ștergi compozițiile selectate?");
    }
</script>

</head>

<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />

<body>
<h1>Compoziție Rețete</h1>
<br/>

<p>
  <a href="nou_RetetaIngredient.jsp"><b>Adaugă o nouă compoziție</b></a>
  <a href="index.html"><b>Meniu principal</b></a>
</p>

<form action="sterge_RetetaIngredient.jsp" method="post" onsubmit="return valideazaSelectie()">
<table>
<tr>
  <td><b>Selectare</b></td>
  <td><b>ID Compoziție</b></td>
  <td><b>Rețetă</b></td>
  <td><b>Ingredient</b></td>
  <td><b>Alergen</b></td>
  <td><b>Cantitate</b></td>
  <td><b>Unitate măsură</b></td>
</tr>

<%
jb.connect();
ResultSet rs = jb.vedeRetetaIngredient();
long x;

while (rs.next()) {
  x = rs.getInt("idreteta_ingredient");
%>
<tr>
  <td><input type="checkbox" name="primarykey" value="<%= x %>" /></td>
  <td><%= x %></td>
  <td><%= rs.getString("NumeReteta") %></td>
  <td><%= rs.getString("NumeIngredient") %></td>
  <td><%= rs.getString("Alergen") %></td>
  <td><%= rs.getString("Cantitate") %></td>
  <td><%= rs.getString("Unitate") %></td>
</tr>
<%
}
rs.close();
jb.disconnect();
%>

</table>
<br/>
<p>
  <input type="submit" value="Șterge compozițiile selectate" style="width: auto; min-width: 250px; padding: 0 20px;" />
</p>
</form>

<br/>
<p>
  <a href="modifica_RetetaIngredient.jsp"><b>Modifică Compoziție Rețete</b></a>
</p>

</body>
</html>