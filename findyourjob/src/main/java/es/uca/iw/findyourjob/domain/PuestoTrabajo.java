package es.uca.iw.findyourjob.domain;
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
@RooJpaActiveRecord(sequenceName = "PUESTOTRABAJO_SEQ")
public class PuestoTrabajo {
	@Id
	private Integer id;
	private String nombre;
    /**
     */
    @NotNull
    @ManyToOne
    private Curriculum curriculum;

    /**
     */
    @NotNull
    @ManyToOne
    private Experiencia experiencia;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "puestoTrabajo")
    private Set<Oferta> ofertas = new HashSet<Oferta>();
}
