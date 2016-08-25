          /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sistema;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

/**
 *
 * @author Gerardo
 */
public class Minuta {
    private int id_reunion;
    private String fecha;
    private String hora;
    private String asunto;
    private String lugar;
    private String secretario;
    private int id_secretario;
    private String presidente;
    private int id_presidente;
    private int id_academia;
    private String ordenDia;
    private String detalles;
    private String acuerdos;
    private String[] participantes;
    public String resultado;
    
    public Minuta(int id_reunion,String fecha,String hora, String asunto, String lugar, String secretario, int id_secretario, String presidente, int id_presidente, int id_academia, String ordenDia, String detalles, String acuerdos, String[] participantes) {
        this.id_reunion = id_reunion;
        this.fecha = fecha;
        this.hora = hora;
        this.asunto = asunto;
        this.lugar = lugar;
        this.secretario = secretario;
        this.id_secretario = id_secretario;
        this.presidente = presidente;
        this.id_presidente = id_presidente;
        this.id_academia = id_academia;
        this.ordenDia = ordenDia;
        this.detalles = detalles;
        this.acuerdos = acuerdos;
        this.participantes = participantes;
    }
    
    public void guardarMinuta() {
        ConexionSQL conexion = new ConexionSQL();
        String sql = null;
        String[] mTotalAsistentes = participantes;
        String asistentes = "";
        for(int i=0; i<mTotalAsistentes.length; i++){
            asistentes += mTotalAsistentes[i] + ",";
        }
       
        if(conexion.conecta() != 0)
        {
            System.out.println("Error al contectar!");
        }  else {
            sql = "INSERT INTO minutas (id_academia,asistentes,fecha,hora,lugar,ordenDia,detalles,acuerdos) VALUES ("+id_academia+", \""+asistentes+"\", \""+fecha+"\", \""+hora+"\", \""+lugar+"\",\""+ordenDia+"\", \""+detalles+"\", \""+acuerdos+"\")";
        }
        
        
        if (conexion.ejecuta(sql) != 0)
       {
           System.out.println("Error al insertar datos");
           resultado = "Error al agregar nueva minuta";
       } else {
           System.out.println("Minuta guardada satisfactoriamente");
           resultado = "Minuta guardada satisfactoriamente"; 
           generarMinutaPDF();
       }
        
    }
    
    public void generarMinutaPDF() {
         Document document = new Document();

        try {
            String ruta = "C:\\Users\\Gerardo\\Documents\\Facultad 5E\\Programación Distribuida\\Programas\\SistemaControl\\minutas\\";
            PdfWriter.getInstance(document,
                new FileOutputStream(ruta+"Minuta_Reunion"+id_reunion+".pdf"));

            document.open();

            PdfPTable table = new PdfPTable(6); // 3 columns.

            PdfPCell fecha = new PdfPCell(new Paragraph("Fecha"));
            PdfPCell nReunion = new PdfPCell(new Paragraph("No. Reunión"));

            fecha.setColspan(3);
            nReunion.setColspan(3);
            
            table.addCell(fecha);
            table.addCell(nReunion);
            
            PdfPCell cFecha = new PdfPCell(new Paragraph(this.fecha));
            PdfPCell cNReunion = new PdfPCell(new Paragraph(id_reunion));
            
            cFecha.setColspan(3);
            cNReunion.setColspan(3);
            
            table.addCell(cFecha);
            table.addCell(cNReunion);
            
            PdfPCell asunto = new PdfPCell(new Paragraph("Asunto:"));
            PdfPCell cAsunto = new PdfPCell(new Paragraph(this.asunto));
            
            cAsunto.setColspan(5);
            
            table.addCell(asunto);
            table.addCell(cAsunto);
            
            PdfPCell lugar = new PdfPCell(new Paragraph("Lugar:"));
            PdfPCell cLugar = new PdfPCell(new Paragraph(this.lugar));
            
            cLugar.setColspan(5);
            
            table.addCell(lugar);
            table.addCell(cLugar);
            
            PdfPCell presidente = new PdfPCell(new Paragraph("Presidente:"));
            PdfPCell cPresidente = new PdfPCell(new Paragraph(this.presidente));
            
            cPresidente.setColspan(5);
            
            table.addCell(presidente);
            table.addCell(cPresidente);
            
            PdfPCell secretario = new PdfPCell(new Paragraph("Secretario:"));
            PdfPCell cSecretario = new PdfPCell(new Paragraph(this.secretario));
            
            cSecretario.setColspan(5);
            
            table.addCell(secretario);
            table.addCell(cSecretario);
            
            PdfPCell ordenDia = new PdfPCell(new Paragraph("Orden del día"));
            
            ordenDia.setColspan(6);
            
            table.addCell(ordenDia);
            
            PdfPCell cOrdenDia = new PdfPCell(new Paragraph(this.ordenDia));
            
            cOrdenDia.setColspan(6);
            
            table.addCell(cOrdenDia);
            
            PdfPCell detalles = new PdfPCell(new Paragraph("Detalles de la reunión"));
            
            detalles.setColspan(6);
            
            table.addCell(detalles);
            
            PdfPCell cDetalles = new PdfPCell(new Paragraph(this.detalles));
            
            cDetalles.setColspan(6);
            
            table.addCell(cDetalles);
            
            PdfPCell acuerdos = new PdfPCell(new Paragraph("Acuerdos"));
            
            acuerdos.setColspan(6);
            
            table.addCell(acuerdos);
            
            PdfPCell cAcuerdos = new PdfPCell(new Paragraph(this.acuerdos));
            
            cAcuerdos.setColspan(6);
            
            table.addCell(cAcuerdos);
            
            PdfPCell proximaReunion = new PdfPCell(new Paragraph("Fecha de la próxima reunión"));
            PdfPCell cProximaReunion = new PdfPCell(new Paragraph("2015-11-30"));
            
            proximaReunion.setColspan(3);
            cProximaReunion.setColspan(3);         
            
            table.addCell(proximaReunion);
            table.addCell(cProximaReunion);
            
            PdfPCell participantes = new PdfPCell(new Paragraph("Participantes"));
            
            participantes.setColspan(6);
            
            table.addCell(participantes);
            
            PdfPCell profesor = new PdfPCell(new Paragraph("Nombre del profesor"));
            PdfPCell asistencia = new PdfPCell(new Paragraph("Asistencia"));
            PdfPCell firma = new PdfPCell(new Paragraph("Firma"));
            
            profesor.setColspan(3);
            asistencia.setColspan(1);
            firma.setColspan(2);
            
            table.addCell(profesor);
            table.addCell(asistencia);
            table.addCell(firma);
            
            int i = 0;
            while(i < this.participantes.length)
            {
                PdfPCell nProfesor = new PdfPCell(new Paragraph(this.participantes[i]));
                PdfPCell nAsistencia = new PdfPCell(new Paragraph("Si"));
                PdfPCell nFirma = new PdfPCell(new Paragraph(" \n "));

                nProfesor.setColspan(3);
                nAsistencia.setColspan(1);
                nFirma.setColspan(2);
                nProfesor.setRowspan(2);
                nAsistencia.setRowspan(2);
                nFirma.setRowspan(2);

                table.addCell(nProfesor);
                table.addCell(nAsistencia);
                table.addCell(nFirma);
                i++;
            }
            
            document.add(table);
            
            Paragraph pFirmas = new Paragraph();
            pFirmas.setAlignment(Element.ALIGN_CENTER);
            Chunk firmas = new Chunk("Firmas");
            pFirmas.add(firmas);
            document.add(pFirmas);
            
            PdfPTable tCargos = new PdfPTable(8); 
            PdfPCell fPresidente = new PdfPCell(new Paragraph("Presidente"));
            PdfPCell fSecretario = new PdfPCell(new Paragraph("Secretario"));
            PdfPCell fespacio = new PdfPCell(new Paragraph(" "));
            
            fPresidente.setColspan(3);
            fSecretario.setColspan(3);
            
            fPresidente.setHorizontalAlignment(Element.ALIGN_CENTER);
            fSecretario.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            fPresidente.setBorder(Rectangle.NO_BORDER);
            fSecretario.setBorder(Rectangle.NO_BORDER);
            fespacio.setBorder(Rectangle.NO_BORDER);
            
            tCargos.addCell(fespacio);
            tCargos.addCell(fPresidente);
            tCargos.addCell(fSecretario);
            tCargos.addCell(fespacio);
            
            document.add(tCargos);
            
            PdfPTable tFirmas = new PdfPTable(8); 
            PdfPCell firmaPresidente = new PdfPCell(new Paragraph("_____________________"));
            PdfPCell firmaSecretario = new PdfPCell(new Paragraph("______________________"));
            PdfPCell tespacio = new PdfPCell(new Paragraph(" "));
            PdfPCell nombrePresidente = new PdfPCell(new Paragraph(this.presidente));
            PdfPCell nombreSecretario = new PdfPCell(new Paragraph(this.secretario));
            
            firmaPresidente.setColspan(3);
            firmaSecretario.setColspan(3);
            firmaPresidente.setRowspan(3);
            firmaSecretario.setRowspan(3);
            tespacio.setColspan(1);
            
            nombrePresidente.setColspan(3);
            nombreSecretario.setColspan(3);
            
            firmaPresidente.setHorizontalAlignment(Element.ALIGN_CENTER);
            firmaSecretario.setHorizontalAlignment(Element.ALIGN_CENTER);
            firmaPresidente.setVerticalAlignment(Element.ALIGN_BOTTOM);
            firmaSecretario.setVerticalAlignment(Element.ALIGN_BOTTOM);
            nombrePresidente.setHorizontalAlignment(Element.ALIGN_CENTER);
            nombreSecretario.setHorizontalAlignment(Element.ALIGN_CENTER);
            
            firmaPresidente.setBorder(Rectangle.NO_BORDER);
            firmaSecretario.setBorder(Rectangle.NO_BORDER);
            tespacio.setBorder(Rectangle.NO_BORDER);
            nombrePresidente.setBorder(Rectangle.NO_BORDER);
            nombreSecretario.setBorder(Rectangle.NO_BORDER);
            
            tFirmas.addCell(tespacio);
            tFirmas.addCell(firmaPresidente);
            tFirmas.addCell(firmaSecretario);
            tFirmas.addCell(tespacio);
            tFirmas.addCell(tespacio);
            tFirmas.addCell(tespacio);
            tFirmas.addCell(tespacio);
            tFirmas.addCell(tespacio);
            tFirmas.addCell(tespacio);
            tFirmas.addCell(nombrePresidente);
            tFirmas.addCell(nombreSecretario);
            tFirmas.addCell(tespacio);
            
            document.add(tFirmas);
            
            document.close();


            } catch (DocumentException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
    }

    /**
     * @return the id_reunion
     */
    public int getId_reunion() {
        return id_reunion;
    }

    /**
     * @param id_reunion the id_reunion to set
     */
    public void setId_reunion(int id_reunion) {
        this.id_reunion = id_reunion;
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

    /**
     * @return the lugar
     */
    public String getLugar() {
        return lugar;
    }

    /**
     * @param lugar the lugar to set
     */
    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    /**
     * @return the secretario
     */
    public String getSecretario() {
        return secretario;
    }

    /**
     * @param secretario the secretario to set
     */
    public void setSecretario(String secretario) {
        this.secretario = secretario;
    }

    /**
     * @return the presidente
     */
    public String getPresidente() {
        return presidente;
    }

    /**
     * @param presidente the presidente to set
     */
    public void setPresidente(String presidente) {
        this.presidente = presidente;
    }

    /**
     * @return the id_academia
     */
    public int getId_academia() {
        return id_academia;
    }

    /**
     * @param id_academia the id_academia to set
     */
    public void setId_academia(int id_academia) {
        this.id_academia = id_academia;
    }

    /**
     * @return the ordenDia
     */
    public String getOrdenDia() {
        return ordenDia;
    }

    /**
     * @param ordenDia the ordenDia to set
     */
    public void setOrdenDia(String ordenDia) {
        this.ordenDia = ordenDia;
    }

    /**
     * @return the detalles
     */
    public String getDetalles() {
        return detalles;
    }

    /**
     * @param detalles the detalles to set
     */
    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }

    /**
     * @return the acuerdos
     */
    public String getAcuerdos() {
        return acuerdos;
    }

    /**
     * @param acuerdos the acuerdos to set
     */
    public void setAcuerdos(String acuerdos) {
        this.acuerdos = acuerdos;
    }

    /**
     * @return the participantes
     */
    public String[] getParticipantes() {
        return participantes;
    }

    /**
     * @param participantes the participantes to set
     */
    public void setParticipantes(String[] participantes) {
        this.participantes = participantes;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @return the id_secretario
     */
    public int getId_secretario() {
        return id_secretario;
    }

    /**
     * @param id_secretario the id_secretario to set
     */
    public void setId_secretario(int id_secretario) {
        this.id_secretario = id_secretario;
    }

    /**
     * @return the id_presidente
     */
    public int getId_presidente() {
        return id_presidente;
    }

    /**
     * @param id_presidente the id_presidente to set
     */
    public void setId_presidente(int id_presidente) {
        this.id_presidente = id_presidente;
    }

    /**
     * @return the hora
     */
    public String getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    public void setHora(String hora) {
        this.hora = hora;
    }
}
