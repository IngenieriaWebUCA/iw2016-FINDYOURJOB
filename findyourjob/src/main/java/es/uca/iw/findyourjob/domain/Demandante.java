package es.uca.iw.findyourjob.domain;
import java.util.Date;
import java.util.Set;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "DEMANDANTE_SEQ")
public class Demandante {
	@Id
	private Integer id;
    private String nombre;

    private String apellidos;

    private Date fecha_nacimiento;

    private String sexo;

    private String direccion;

    private String email;

    private double telefono;

    private Curriculum curriculum;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "demandante")
    private Set<Inscripcion> inscripciones = new HashSet<Inscripcion>();

}
