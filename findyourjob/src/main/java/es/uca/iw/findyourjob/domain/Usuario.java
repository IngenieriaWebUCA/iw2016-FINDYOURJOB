package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "PUESTO_SEQ")
public class Usuario {
	/*public enum Rol{
		ADMINISTRADOR, INVITADO, DEMANDANTE, GESTOR_EMPRESA, GESTOR_ETT
	}*/
    public Usuario(String username , String password, String rol){
    	this.username = username;
    	this.password = password;
    	this.rol = rol;
    	//this.rol.add(rol);
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
 
    private String rol;

    public boolean enabled;
    
    //@OneToMany(cascade = CascadeType.ALL, mappedBy = "usuario")
    //private Set<String> rol = new HashSet<String>();
    
}
