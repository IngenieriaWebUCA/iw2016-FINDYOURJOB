package es.uca.iw.findyourjob.domain;
import java.util.List;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "FORMACION_SEQ")
public class Formacion {

    List<String> titulos_academicos;

    List<String> cursos_idiomas;

    /**
     */
    @NotNull
    @ManyToOne
    private Curriculum curriculum;
}