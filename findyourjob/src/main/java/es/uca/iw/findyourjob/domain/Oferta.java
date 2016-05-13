package es.uca.iw.findyourjob.domain;
import java.util.Date;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "OFERTA_SEQ")
public class Oferta {

    String tipologia;

    float sueldo_bruto;

    Date fecha_inicio_actividad;

    int vacantes;

    String perfil;

    Date fecha_disponible_inicio;

    Date fecha_disponible_fin;

    String estado;

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
    @NotNull
    @ManyToOne
    private PuestoTrabajo puestoTrabajo;
}
