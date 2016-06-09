package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import es.uca.iw.reference.Role;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.Enumerated;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "PUESTO_SEQ", finders = { "findUsuariosByUsername" })
public class Usuario {

	public Usuario(String username, String password, Role rol, boolean enabled) {
		this.username = username;
		this.password = password;
		this.rol = rol;
		this.enabled = enabled;
		
	}
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
    private Role rol;
    
    /**
     */
    private boolean enabled;

}
