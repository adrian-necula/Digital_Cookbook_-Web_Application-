package db;

import java.sql.*;

public class JavaBean {

    String error;
    Connection con;

    public JavaBean() { }

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/proiect?useSSL=false",
                    "root",
                    "abcd1234"
            );
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException sqle) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    }

    public void connect(String bd) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + bd, "root", "abcd1234");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException sqle) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    }

    public void connect(String bd, String ip) throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://" + ip + ":3306/" + bd, "root", "abcd1234");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException sqle) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    }

    public void disconnect() throws SQLException {
        try {
            if (con != null) con.close();
        } catch (SQLException sqle) {
            error = "SQLException: Nu se poate inchide conexiunea la baza de date.";
            throw new SQLException(error);
        }
    }

    public void adaugaReteta(String NumeReteta, String Descriere, int TimpPreparareMin, int Portii)
            throws SQLException, Exception {
        if (con != null) {
            try {
                Statement stmt = con.createStatement();
                stmt.executeUpdate(
                        "insert into retete(NumeReteta, Descriere, TimpPreparareMin, Portii) values('" +
                                NumeReteta + "', '" + Descriere + "', '" + TimpPreparareMin + "', '" + Portii + "');"
                );
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public void adaugaIngredient(String NumeIngredient, String Alergen)
            throws SQLException, Exception {
        if (con != null) {
            try {
                Statement stmt = con.createStatement();
                stmt.executeUpdate(
                        "insert into ingrediente(NumeIngredient, Alergen) values('" +
                                NumeIngredient + "', '" + Alergen + "');"
                );
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public void adaugaRetetaIngredient(int idreteta, int idingredient, String Cantitate, String Unitate)
            throws SQLException, Exception {
        if (con != null) {
            try {
                Statement stmt = con.createStatement();
                stmt.executeUpdate(
                        "insert into reteta_ingredient(idreteta, idingredient, Cantitate, Unitate) values('" +
                                idreteta + "', '" + idingredient + "', '" + Cantitate + "', '" + Unitate + "');"
                );
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = "select * from `proiect`.`" + tabel + "`;";
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

    public ResultSet vedeRetetaIngredient() throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString =
                    "select " +
                    "  r.NumeReteta, r.Descriere, r.TimpPreparareMin, r.Portii, " +
                    "  i.NumeIngredient, i.Alergen, " +
                    "  ri.idreteta_ingredient, ri.idreteta idreteta_link, ri.idingredient idingredient_link, " +
                    "  ri.Cantitate, ri.Unitate " +
                    "from retete r, ingrediente i, reteta_ingredient ri " +
                    "where r.idreteta = ri.idreteta and i.idingredient = ri.idingredient;";
            Statement stmt = con.createStatement();
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        if (con != null) {
            try {
                long aux;
                PreparedStatement delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                for (int i = 0; i < primaryKeys.length; i++) {
                    aux = Long.parseLong(primaryKeys[i]);
                    delete.setLong(1, aux);
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch (Exception e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public void stergeTabela(String tabela) throws SQLException, Exception {
        if (con != null) {
            try {
                Statement stmt = con.createStatement();
                stmt.executeUpdate("delete from " + tabela + ";");
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Stergere nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public void modificaTabela(String tabela, String IDTabela, int ID, String[] campuri, String[] valori)
            throws SQLException, Exception {
        String update = "update " + tabela + " set ";
        String temp = "";
        if (con != null) {
            try {
                for (int i = 0; i < campuri.length; i++) {
                    if (i != (campuri.length - 1)) {
                        temp = temp + campuri[i] + "='" + valori[i] + "', ";
                    } else {
                        temp = temp + campuri[i] + "='" + valori[i] + "' where " + IDTabela + " = '" + ID + "';";
                    }
                }
                update = update + temp;
                Statement stmt = con.createStatement();
                stmt.executeUpdate(update);
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public ResultSet intoarceLinie(String tabela, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = "SELECT * FROM " + tabela + " where idreteta=" + ID + ";";
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = "SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";";
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }

    public ResultSet intoarceRetetaIngredientId(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString =
                    "select " +
                    "  r.NumeReteta, r.Descriere, r.TimpPreparareMin, r.Portii, " +
                    "  i.NumeIngredient, i.Alergen, " +
                    "  ri.idreteta_ingredient, ri.idreteta idreteta_link, ri.idingredient idingredient_link, " +
                    "  ri.Cantitate, ri.Unitate " +
                    "from retete r, ingrediente i, reteta_ingredient ri " +
                    "where r.idreteta = ri.idreteta and i.idingredient = ri.idingredient " +
                    "and ri.idreteta_ingredient = '" + ID + "';";
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    }
}