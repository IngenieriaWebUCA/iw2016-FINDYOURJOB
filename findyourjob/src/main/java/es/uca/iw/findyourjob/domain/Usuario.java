package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import es.uca.iw.reference.Sexo;
import es.uca.iw.reference.UsuarioRol;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.Enumerated;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "PUESTO_SEQ", finders = { "findUsuariosByUsername" })
public class Usuario {

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

    /**
     */
    @Enumerated
    private UsuarioRol rol;
    /**
     */
    private boolean enabled;

}
