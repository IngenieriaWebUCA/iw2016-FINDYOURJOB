package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Min;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "DEMANDANTE_SEQ")
public class Demandante extends Usuario{

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String nombre;


    
    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String apellidos;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String fechaNacimiento;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String sexo;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String email;

    /**
     */
    @NotNull
    @Min(0L)
    private Double telefono;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "demandante")
    private Set<Inscripcion> inscripciones = new HashSet<Inscripcion>();

    @ManyToOne
    private Curriculum curriculum;
    
    /*private String username;
    private String password;
    private String rol;
    
    @OneToOne(cascade={CascadeType.ALL})
    private Usuario usuario;*/
    
 
    
    
}
