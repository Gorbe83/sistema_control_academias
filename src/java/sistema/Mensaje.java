/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistema;

import java.sql.ResultSet;

/**
 *
 * @author Gerardo
 */
public class Mensaje {
    
    private String id_remitente;
    private String[] id_destinatarios;
    private String mensaje;
    private String asunto;
    private String rutaArchivo;
    public String resultado;
    
    public Mensaje() {
        this.id_remitente = null;
        this.id_destinatarios = null;
        this.mensaje = null;
        this.asunto = null;
        this.rutaArchivo = null;
    }
    
    public void nuevoMensaje(String id_remitente, String[] id_destinatarios, String asunto, String mensaje, String rutaArchivo) {
       
       ConexionSQL conexion;
       String sql = "";
        
        conexion = new ConexionSQL();
        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");
        }  else {
            String asistentes = "";
            if(rutaArchivo != null)
            {
                for(int i=0; i<id_destinatarios.length; i++){
                    sql = "INSERT INTO mensajes (id_remitente,id_destinatario,asunto,mensaje,fecha_envio,archivo) VALUES('"+id_remitente+"','"+id_destinatarios[i]+"','"+asunto+"','"+mensaje+"',CURDATE(),'"+rutaArchivo+"')";                             
                    if (conexion.ejecuta(sql) != 0)
                    {
                        System.out.println("Error al insertar datos");
                        resultado = "Error al mandar mensaje";
                    } else {
                        System.out.println("Mensaje enviado");
                        resultado = "Mensaje enviado"; 
                    }
                }
            } else {
                for(int i=0; i<id_destinatarios.length; i++){
                    sql = "INSERT INTO mensajes (id_remitente,id_destinatario,asunto,mensaje,fecha_envio) VALUES('"+id_remitente+"','"+id_destinatarios[i]+"','"+asunto+"','"+mensaje+"',CURDATE());";
                    if (conexion.ejecuta(sql) != 0)
                    {
                        System.out.println("Error al insertar datos");
                        resultado = "Error al mandar mensaje";
                    } else {
                        System.out.println("Mensaje enviado");
                        resultado = "Mensaje enviado"; 
                    }
                }
            }
        }
        conexion.cerrar();
    }
    

    /**
     * @return the id_remitente
     */
    public String getIdRemitente() {
        return id_remitente;
    }

    /**
     * @param id_remitente the id_remitente to set
     */
    public void setIdRemitente(String id_remitente) {
        this.id_remitente = id_remitente;
    }

    /**
     * @return the destinatarios
     */
    public String[] getIdDestinatarios() {
        return id_destinatarios;
    }

    /**
     * @param id_destinatarios the id_destinatarios to set
     */
    public void setDestinatario(String[] id_destinatarios) {
        this.id_destinatarios = id_destinatarios;
    }

    /**
     * @return the mensaje
     */
    public String getMensaje() {
        return mensaje;
    }

    /**
     * @param mensaje the mensaje to set
     */
    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    /**
     * @return the rutaArchivo
     */
    public String getRutaArchivo() {
        return rutaArchivo;
    }

    /**
     * @param rutaArchivo the rutaArchivo to set
     */
    public void setRutaMensaje(String rutaArchivo) {
        this.rutaArchivo = rutaArchivo;
    }

    /**
     * @return the asunto
     */
    public String getAsunto() {
        return asunto;
    }

    /**
     * @param asunto the asunto to set
     */
    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
    
}
