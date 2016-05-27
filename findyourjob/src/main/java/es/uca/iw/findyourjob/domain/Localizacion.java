package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "LOCALIZACION_SEQ")
public class Localizacion {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String direccion;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String localidad;

  
    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "localizacion")
    private Set<Oferta> ofertas = new HashSet<Oferta>();
}
