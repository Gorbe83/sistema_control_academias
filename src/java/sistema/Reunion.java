/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package sistema;

/**
 *
 * @author Alf
 */
public class Reunion {
    private String id_academia;
    private String asunto;
    private String descripcion;
    private String fecha;
    private String hora;
    private String lugar;
    public String resultado;

    public Reunion() {
        this.id_academia = null;
        this.asunto = null;
        this.descripcion = null;
        this.fecha = null;
        this.hora = null;
        this.lugar = null;
    }
    
    public void agregarReunion(String id_academia, String asunto, String descripcion, String fecha, String hora, String lugar) {
       
       ConexionSQL conexion;
       String sql;
        
        conexion = new ConexionSQL();
        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");
        }  else {
            sql = "INSERT INTO reuniones (id_academia,asunto,descripcion,fecha,hora,lugar,fecha_creacion) VALUES("+id_academia+",\""+asunto+"\",\""+descripcion+"\",\""+fecha+"\",\""+hora+"\",\""+lugar+"\",now())";

            if (conexion.ejecuta(sql) != 0)
            {
                System.out.println("Error al insertar datos");
                resultado = "Error al insertar datos";
            } else {
                System.out.println("Reunion creada satisfactoriamente");
                resultado = "Reunion creada satisfactoriamente"; 
            }
        }
        conexion.cerrar();
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
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
    
}
