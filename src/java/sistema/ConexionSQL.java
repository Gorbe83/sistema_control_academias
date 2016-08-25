package sistema;


import java.sql.*;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Gerardo
 */
public class ConexionSQL {
    private static final String controlador = "com.mysql.jdbc.Driver";
    private static final String direccion = "jdbc:mysql://localhost:3306/siscoac";
    private static final String usuario = "orbe";
    private static final String clave = "orbe";
    private Connection conexion;
    private Statement consulta;
    private String sql;

    public ConexionSQL() {

    }

    public int conecta() {
        try {
            Class.forName(controlador);
            conexion = DriverManager.getConnection(direccion, usuario, clave);
            consulta = conexion.createStatement();
            return 0;
        }
        catch(Exception e) {
            System.out.println("ConexionSQL: Error al conectar: " + e.toString());
            return 1;
        }
    }

    public ResultSet consulta(String sql) {
        if(conexion == null) {
            System.out.println("ConexionSQL: No está conectado a la base de datos");
            return null;
        }
        else {
            try {
                ResultSet resultado = consulta.executeQuery(sql);
                return resultado;
            }
            catch(Exception e) {
                System.out.println("ConexionSQL: Error al consultar " + e.toString());
                return null;
            }
        }
    }

    public int ejecuta(String sql) {
        if(conexion == null) {
            System.out.println("ConexionSQL: No está conectado a la base de datos");
            return 1;
        }
        else {
            try {
                consulta.executeUpdate(sql);
                return 0;
            }
            catch(Exception e) {
                System.out.println("ConexionSQL: Error al ejecutar sentencia " + e.toString());
                return 1;
            }
        }
    }

    public int cerrar() {
        try {
            if(consulta != null)
                consulta.close();
            if(conexion != null)
                conexion.close();
            return 0;
        }
        catch(Exception e) {
            System.out.println("ConexionSQL: Error al cerrar sesión " + e.toString());
            return 1;
        }
    }
}
