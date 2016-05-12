package es.uca.iw.findyourjob.domain;
import java.util.List;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "FORMACION_SEQ")
public class Formacion {
	List<String> titulos_academicos;
	List<String> cursos_idiomas;
	Curriculum curriculum;
}
