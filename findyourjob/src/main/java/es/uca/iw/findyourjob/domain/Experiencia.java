package es.uca.iw.findyourjob.domain;
import java.util.Date;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "EXPERIENCIA_SEQ")
public class Experiencia {
	String nombre_empresa;
	Date fecha_contrato_inicio;
	Date fecha_contrato_fin;
	String trabajo_desempeñado;
}
