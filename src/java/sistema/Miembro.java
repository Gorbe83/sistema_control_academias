/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistema;

/**
 *
 * @author Gerardo
 */
public class Miembro {
     private String nombre;
     private String apellido_p;
     private String apellido_m;
     private String email;
     private String tipoUsuario;
     private String academias;
     private String contrasenia;
     private int id_miembro;
     public String resultado = "";
     
     public Miembro() {
         nombre = null;
         apellido_p = null;
         apellido_m = null;
         email = null;
         tipoUsuario = null;
         academias = null;
         contrasenia = null;
         id_miembro = 0;
     }
     
     public Miembro(String nombre, String apellido_p, String apellido_m, String tipoUsuario) {
         this.nombre = nombre;
         this.apellido_p = apellido_p;
         this.apellido_m = apellido_m;
         this.tipoUsuario = tipoUsuario;
     }
     
     public Miembro(String nombre, String apellido_p, String apellido_m, int id_miembro) {
         this.nombre = nombre;
         this.apellido_p = apellido_p;
         this.apellido_m = apellido_m;
         this.id_miembro = id_miembro;
     }
     
     public Miembro(String nombre, String apellido_p, String apellido_m, String tipoUsuario, int id_miembro) {
         this.nombre = nombre;
         this.apellido_p = apellido_p;
         this.apellido_m = apellido_m;
         this.tipoUsuario = tipoUsuario;
         this.id_miembro = id_miembro;
     }
     
     public void agregarMiembro(String nombre, String apellido_p, String apellido_m, String email, String contrasenia) {
       
       ConexionSQL conexion;
       String sql;
        
        conexion = new ConexionSQL();
        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");
        }  else {
            sql = "INSERT INTO miembros (nombre, apellido_p, apellido_m, email, contrasenia) VALUES('"+nombre+"','"+apellido_p+"','"+apellido_m+"','"+email+"','"+contrasenia+"')";

            if (conexion.ejecuta(sql) != 0)
            {
                System.out.println("Error al insertar datos");
            } else {
                System.out.println("Miembro agregado satisfactoriamente");
                resultado = "Miembro agregado satisfactoriamente"; 
            }
        }
        conexion.cerrar();
    }
     
     public void inscribirAcademia(String id_miembro, String rol, String id_academia) {
        ConexionSQL conexion;
        String sql;

         conexion = new ConexionSQL();
         if(conexion.conecta() != 0)
             System.out.println("Error al contectar!");
           else 
         {
             sql = "INSERT INTO roles_miembros(id_miembro,rol,id_academia) VALUES('"+id_miembro+"','"+rol+"','"+id_academia+"')";
         
         
         if (conexion.ejecuta(sql) != 0)
            {
                System.out.println("Error al insertar datos");
                resultado = "Error al inscribir miembros";
            } else {
                System.out.println("Miembro agregado satisfactoriamente");
                resultado = "Miembros inscritos satisfactoriamente"; 
            }
        }
     }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @return the apellido_p
     */
    public String getApellido_p() {
        return apellido_p;
    }

    /**
     * @return the apellido_m
     */
    public String getApellido_m() {
        return apellido_m;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    
    /**
     * @return the tipoUsuario
     */
    public String getTipoUsuario() {
        return tipoUsuario;
    }

    /**
     * @return the academias
     */
    public String getAcademias() {
        return academias;
    }

    /**
     * @return the contrasenia
     */
    public String getContrasenia() {
        return contrasenia;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @param apellido_p the apellido_p to set
     */
    public void setApellido_p(String apellido_p) {
        this.apellido_p = apellido_p;
    }

    /**
     * @param apellido_m the apellido_m to set
     */
    public void setApellido_m(String apellido_m) {
        this.apellido_m = apellido_m;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
    /**
     * @param tipoUsuario the tipoUsuario to set
     */
    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    /**
     * @param academias the academias to set
     */
    public void setAcademias(String academias) {
        this.academias = academias;
    }

    /**
     * @param contrasenia the contrasenia to set
     */
    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    /**
     * @return the id_miembro
     */
    public int getId_miembro() {
        return id_miembro;
    }

    /**
     * @param id_miembro the id_miembro to set
     */
    public void setId_miembro(int id_miembro) {
        this.id_miembro = id_miembro;
    }

}
