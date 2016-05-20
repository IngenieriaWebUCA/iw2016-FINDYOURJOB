package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Min;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "OFERTA_SEQ")
public class Oferta {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String tipologia;

    /**
     */
    @NotNull
    @Min(0L)
    private Float sueldoBruto;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String fechaInicioActividad;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String vacantes;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String perfil;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String fechaDisponibleInicio;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String estado;

    /**
     */
    @NotNull
    @ManyToOne
    private Localizacion localizacion;

    /**
     */
    @NotNull
    @ManyToOne
    private Empresa empresa;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "oferta")
    private Set<Inscripcion> inscripciones = new HashSet<Inscripcion>();

    /**
     */
    @ManyToOne
    private Puesto puestoTrabajo;
}
