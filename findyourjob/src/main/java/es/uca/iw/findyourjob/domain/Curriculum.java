package es.uca.iw.findyourjob.domain;
import java.util.List;
import java.util.Set;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "CURRICULUM_SEQ")
public class Curriculum {
	@Id
	private Long id;
    private String trayectoria;

    private String foto;

    private List<String> trabajos;

    private Formacion formacion_academica;

    /**
     */
    @NotNull
    @ManyToOne
    private Demandante demandante;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "curriculum")
    private Set<PuestoTrabajo> puestosTrabajos = new HashSet<PuestoTrabajo>();

    /**
     */
    @NotNull
    @ManyToOne
    private Formacion formacion;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "curriculum")
    private Set<Experiencia> experiencias = new HashSet<Experiencia>();
}
