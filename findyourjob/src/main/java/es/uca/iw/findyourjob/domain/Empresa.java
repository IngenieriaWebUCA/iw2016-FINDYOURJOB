package es.uca.iw.findyourjob.domain;
import java.util.Set;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "EMPRESA_SEQ")
public class Empresa {

    String nombre;

    String cif;

    String email;

    String actividad_profesional;

    String numero_empleados;

    Set<Localizacion> localizaciones;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "empresa")
    private Set<Oferta> ofertas = new HashSet<Oferta>();
}
