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
import javax.persistence.Id;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "OFERTA_SEQ")
public class Oferta {
	@Id
	private Long id;
    private String tipologia;

    private float sueldo_bruto;

    private Date fecha_inicio_actividad;

    private int vacantes;

    private String perfil;

    private Date fecha_disponible_inicio;

    private Date fecha_disponible_fin;

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
    @NotNull
    @ManyToOne
    private PuestoTrabajo puestoTrabajo;
}
