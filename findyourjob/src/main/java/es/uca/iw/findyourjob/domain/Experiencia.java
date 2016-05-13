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
@RooJpaActiveRecord(sequenceName = "EXPERIENCIA_SEQ")
public class Experiencia {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String nombreEmpresa;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String fechaContratoInicio;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String fechaContratoFin;

    /**
     */
    @NotNull
    @ManyToOne
    private Curriculum curriculum;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "experiencia")
    private Set<Puesto> puestos = new HashSet<Puesto>();
}
