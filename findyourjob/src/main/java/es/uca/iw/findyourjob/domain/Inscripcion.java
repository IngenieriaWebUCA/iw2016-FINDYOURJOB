package es.uca.iw.findyourjob.domain;
import java.util.Date;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "INSCRIPCION_SEQ")
public class Inscripcion {
	String estado;
	Date fecha;
	Oferta oferta;
	Demandante demandante;
}
