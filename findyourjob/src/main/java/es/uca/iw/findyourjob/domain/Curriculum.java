package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "CURRICULUM_SEQ", finders = { "findCurriculumsByDemandante" })
public class Curriculum {

    /**
     */
    @Size(min = 3, max = 30)
    private String trayectoria;

    /**
     */
    @Size(min = 3, max = 30)
    private String foto;

    /**
     */
    @NotNull
    @ManyToOne
    private Demandante demandante;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "curriculum")
    private Set<Experiencia> experiencias = new HashSet<Experiencia>();

}
