package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import es.uca.iw.reference.OfertaEstado;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Min;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.OneToMany;
import java.util.Calendar;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "OFERTA_SEQ", finders = { "findOfertasByEstado"})
public class Oferta {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String tipologia;

    /**
     */
    @Min(0L)
    private float sueldoBruto;

    /**
     */
    @NotNull
    private String vacantes;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String perfil;

    /**
     */
    @Enumerated
    private OfertaEstado estado;

    /**
     */
    @ManyToOne
    private Localizacion localizacion;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "oferta")
    private Set<Inscripcion> inscripciones = new HashSet<Inscripcion>();

    /**
     */
    @ManyToOne
    private Puesto puestoTrabajo;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaDisponibleInicio;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaDisponibleFin;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fechaInicioActividad;

    /**
     */
    @NotNull
    @ManyToOne
    private Empresa empresa;

    public OfertaEstado getOferta_estado() {
        /*Date fechaHoy = (Calendar.getInstance()).getTime();  //style="M-"
         if (oferta_estado != OfertaEstado.Cancelada && oferta_estado != OfertaEstado.En_Trámite && oferta_estado != OfertaEstado.Resuelta){
         if(fechaHoy.compareTo(getFechaDisponibleInicio()) < 0)
         oferta_estado = OfertaEstado.En_Espera;
         if(fechaHoy.compareTo(getFechaDisponibleInicio()) >= 0 && fechaHoy.compareTo(getFechaDisponibleFin()) <=0)
         oferta_estado = OfertaEstado.Activa;
         if(fechaHoy.compareTo(getFechaDisponibleFin()) > 0)
         oferta_estado = OfertaEstado.Detenida;
         }*/
        return this.estado;
    }
}
