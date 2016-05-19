package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "EMPRESA_SEQ")
public class Empresa {
	/**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String nombre;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String cif;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String email;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String actividadProfesional;

    /**
     */
    @NotNull
    @Min(0L)
    private int numeroEmpleados;

	
    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "empresa")
    private Set<Oferta> ofertas = new HashSet<Oferta>();
}
