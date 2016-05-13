package es.uca.iw.findyourjob.domain;
import java.util.Set;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "EMPRESA_SEQ")
public class Empresa {
	@Id
	private Long id;
    private String nombre;

    private String cif;

    private String email;

    private String actividad_profesional;

    private String numero_empleados;

    private Set<Localizacion> localizaciones;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "empresa")
    private Set<Oferta> ofertas = new HashSet<Oferta>();
}
