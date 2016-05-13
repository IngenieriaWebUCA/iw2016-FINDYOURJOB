package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "INSCRIPCION_SEQ")
public class Inscripcion {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String fecha;

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String estado;

    /**
     */
    @NotNull
    @ManyToOne
    private Oferta oferta;

    /**
     */
    @NotNull
    @ManyToOne
    private Demandante demandante;
}
