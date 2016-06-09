package es.uca.iw.findyourjob.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "PUESTO_SEQ", finders = { "findPuestoesByNombre" })
public class Puesto {

    /**
     */
    @NotNull
    @Size(min = 3, max = 30)
    private String nombre;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "puesto")
    private Set<Experiencia> experiencias = new HashSet<Experiencia>();
}
