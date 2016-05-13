package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "LOCALIZACION_SEQ")
public class Localizacion {
	@Id
	private Long id;
    private String direccion;

    private String localidad;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "localizacion")
    private Set<Oferta> ofertas = new HashSet<Oferta>();
}
