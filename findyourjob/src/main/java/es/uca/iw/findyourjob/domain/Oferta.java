package es.uca.iw.findyourjob.domain;
import java.util.Date;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(sequenceName = "OFERTA_SEQ")
public class Oferta {
	String tipologia;
	float sueldo_bruto;
	Date fecha_inicio_actividad;
	int vacantes;
	String perfil;
	Date fecha_disponible_inicio;
	Date fecha_disponible_fin;
	String estado;
	Empresa empresa;
}
