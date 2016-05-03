package es.uca.iw.findyourjob.domain;
import java.util.List;
import java.util.Set;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "CURRICULUM_SEQ")
public class Curriculum {
	String trayectoria;
	String foto;
	List<String> trabajos;
	Formacion formacion_academica;
	Set<Experiencia> experiencia_profesional;
}
