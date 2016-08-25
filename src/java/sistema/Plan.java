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
public class Plan {
    private String nombre;
    private String id_academia;
    private String materia;
    private String comentarios;
    private String estado;
    private String fecha_creacion;
    private String id_autor;
    public String resultado;
    
    public Plan(String nombre, String id_academia, String materia, String comentarios, String estado, String id_autor) {
        this.nombre = nombre;
        this.id_academia = id_academia;
        this.materia = materia;
        this.comentarios = comentarios;
        this.estado = estado;
        this.fecha_creacion = null;
        this.id_autor = id_autor;
    }
    
    public void nuevoPlan() {
       
       ConexionSQL conexion;
       String sql;
        
        conexion = new ConexionSQL();
        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");
        }  else {
            sql = "INSERT INTO planes (nombre,id_academia,materia,comentarios,estado,fecha_creacion,id_autor) VALUES('"+nombre+"','"+id_academia+"','"+materia+"','"+comentarios+"','"+estado+"',now(),'"+id_autor+"');";

            if (conexion.ejecuta(sql) != 0)
            {
                System.out.println("Error al insertar datos");
                resultado = "Error al cargar plan";
            } else {
                System.out.println("Plan enviado");
                resultado = "Plan enviado"; 
            }
        }
        conexion.cerrar();
    }
    
    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the materia
     */
    public String getMateria() {
        return materia;
    }

    /**
     * @param materia the materia to set
     */
    public void setMateria(String materia) {
        this.materia = materia;
    }

    /**
     * @return the comentarios
     */
    public String getComentarios() {
        return comentarios;
    }

    /**
     * @param comentarios the comentarios to set
     */
    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    /**
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return the fecha_creacion
     */
    public String getFecha_creacion() {
        return fecha_creacion;
    }

    /**
     * @param fecha_creacion the fecha_creacion to set
     */
    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    /**
     * @return the id_academia
     */
    public String getId_academia() {
        return id_academia;
    }

    /**
     * @param id_academia the id_academia to set
     */
    public void setId_academia(String id_academia) {
        this.id_academia = id_academia;
    }

    /**
     * @return the id_autor
     */
    public String getId_autor() {
        return id_autor;
    }

    /**
     * @param id_autor the id_autor to set
     */
    public void setId_autor(String id_autor) {
        this.id_autor = id_autor;
    }
    
    
}
