package es.uca.iw.findyourjob.domain;
import java.util.Date;
import java.util.Set;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "DEMANDANTE_SEQ")
public class Demandante {

    String nombre;

    String apellidos;

    Date fecha_nacimiento;

    String sexo;

    String direccion;

    String email;

    double telefono;

    Curriculum curriculum;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "demandante")
    private Set<Inscripcion> inscripciones = new HashSet<Inscripcion>();

    /**
     */
    @NotNull
    @ManyToOne
    private Curriculum demandante;
}
