package es.uca.iw.findyourjob.domain;
import java.util.Date;
import java.util.Set;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "DEMANDANTE_SEQ")
public class Demandante {
	String nombre;
	String apellidos;
	Date fecha_nacimiento;
	String sexo;
	String direccion;
	String email;
	double telefono;
	Curriculum curriculum;
	Set<Inscripcion> inscripciones;
}
