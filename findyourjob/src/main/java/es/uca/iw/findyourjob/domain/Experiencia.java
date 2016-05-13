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
@RooJpaActiveRecord(sequenceName = "EXPERIENCIA_SEQ")
public class Experiencia {
	@Id
	private Long id;
    private String nombre_empresa;

    private Date fecha_contrato_inicio;

    private Date fecha_contrato_fin;

    private String trabajo_desempenado;

    /**
     */
    @NotNull
    @ManyToOne
    private Curriculum curriculum;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "experiencia")
    private Set<PuestoTrabajo> puestosTrabajos = new HashSet<PuestoTrabajo>();
}
