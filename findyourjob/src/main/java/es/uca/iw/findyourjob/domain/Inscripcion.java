package es.uca.iw.findyourjob.domain;
import java.util.Date;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "INSCRIPCION_SEQ")
public class Inscripcion {

    String estado;

    Date fecha;

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