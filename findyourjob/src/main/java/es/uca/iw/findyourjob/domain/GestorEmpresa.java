package es.uca.iw.findyourjob.domain;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import es.uca.iw.reference.Role;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "PUESTO_SEQ", finders = { "findGestorEmpresasByUsername" })
public class GestorEmpresa {

    /**
     */
    @NotNull
    @Size(min = 5, max = 10)
    private String username;

    /**
     */
    @NotNull
    @Size(min = 5, max = 10)
    private String password;

    private boolean enabled;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "gestor")
    private Set<Empresa> empresasGestionadas = new HashSet<Empresa>();
}
