package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import es.uca.iw.reference.InscripcionEstado;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.Enumerated;
import javax.persistence.ManyToOne;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "INSCRIPCION_SEQ")
public class Inscripcion {

    /**
     */
    @Enumerated
    private InscripcionEstado inscripcion_estado;

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

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fecha;
}
