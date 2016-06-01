package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "PUESTO_SEQ", finders = { "findPuestoesByNombre" })
public class Puesto {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String nombre;

    /**
     */
    @ManyToOne
    private Experiencia experiencia;
}
