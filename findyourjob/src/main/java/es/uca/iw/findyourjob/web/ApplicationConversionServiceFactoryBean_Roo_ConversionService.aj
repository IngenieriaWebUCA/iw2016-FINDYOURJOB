// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.Experiencia;
import es.uca.iw.findyourjob.domain.Formacion;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Localizacion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Curriculum, String> ApplicationConversionServiceFactoryBean.getCurriculumToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Curriculum, java.lang.String>() {
            public String convert(Curriculum curriculum) {
                return new StringBuilder().append(curriculum.getTrayectoria()).append(' ').append(curriculum.getFoto()).toString();
            }
        };
    }
    
    public Converter<Long, Curriculum> ApplicationConversionServiceFactoryBean.getIdToCurriculumConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Curriculum>() {
            public es.uca.iw.findyourjob.domain.Curriculum convert(java.lang.Long id) {
                return Curriculum.findCurriculum(id);
            }
        };
    }
    
    public Converter<String, Curriculum> ApplicationConversionServiceFactoryBean.getStringToCurriculumConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Curriculum>() {
            public es.uca.iw.findyourjob.domain.Curriculum convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Curriculum.class);
            }
        };
    }
    
    public Converter<Demandante, String> ApplicationConversionServiceFactoryBean.getDemandanteToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Demandante, java.lang.String>() {
            public String convert(Demandante demandante) {
                return new StringBuilder().append(demandante.getNombre()).append(' ').append(demandante.getApellidos()).append(' ').append(demandante.getFecha_nacimiento()).append(' ').append(demandante.getSexo()).toString();
            }
        };
    }
    
    public Converter<Long, Demandante> ApplicationConversionServiceFactoryBean.getIdToDemandanteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Demandante>() {
            public es.uca.iw.findyourjob.domain.Demandante convert(java.lang.Long id) {
                return Demandante.findDemandante(id);
            }
        };
    }
    
    public Converter<String, Demandante> ApplicationConversionServiceFactoryBean.getStringToDemandanteConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Demandante>() {
            public es.uca.iw.findyourjob.domain.Demandante convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Demandante.class);
            }
        };
    }
    
    public Converter<Empresa, String> ApplicationConversionServiceFactoryBean.getEmpresaToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Empresa, java.lang.String>() {
            public String convert(Empresa empresa) {
                return new StringBuilder().append(empresa.getNombre()).append(' ').append(empresa.getCif()).append(' ').append(empresa.getEmail()).append(' ').append(empresa.getActividad_profesional()).toString();
            }
        };
    }
    
    public Converter<Long, Empresa> ApplicationConversionServiceFactoryBean.getIdToEmpresaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Empresa>() {
            public es.uca.iw.findyourjob.domain.Empresa convert(java.lang.Long id) {
                return Empresa.findEmpresa(id);
            }
        };
    }
    
    public Converter<String, Empresa> ApplicationConversionServiceFactoryBean.getStringToEmpresaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Empresa>() {
            public es.uca.iw.findyourjob.domain.Empresa convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Empresa.class);
            }
        };
    }
    
    public Converter<Experiencia, String> ApplicationConversionServiceFactoryBean.getExperienciaToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Experiencia, java.lang.String>() {
            public String convert(Experiencia experiencia) {
                return new StringBuilder().append(experiencia.getNombre_empresa()).append(' ').append(experiencia.getFecha_contrato_inicio()).append(' ').append(experiencia.getFecha_contrato_fin()).append(' ').append(experiencia.getTrabajo_desempenado()).toString();
            }
        };
    }
    
    public Converter<Long, Experiencia> ApplicationConversionServiceFactoryBean.getIdToExperienciaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Experiencia>() {
            public es.uca.iw.findyourjob.domain.Experiencia convert(java.lang.Long id) {
                return Experiencia.findExperiencia(id);
            }
        };
    }
    
    public Converter<String, Experiencia> ApplicationConversionServiceFactoryBean.getStringToExperienciaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Experiencia>() {
            public es.uca.iw.findyourjob.domain.Experiencia convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Experiencia.class);
            }
        };
    }
    
    public Converter<Formacion, String> ApplicationConversionServiceFactoryBean.getFormacionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Formacion, java.lang.String>() {
            public String convert(Formacion formacion) {
                return "(no displayable fields)";
            }
        };
    }
    
    public Converter<Long, Formacion> ApplicationConversionServiceFactoryBean.getIdToFormacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Formacion>() {
            public es.uca.iw.findyourjob.domain.Formacion convert(java.lang.Long id) {
                return Formacion.findFormacion(id);
            }
        };
    }
    
    public Converter<String, Formacion> ApplicationConversionServiceFactoryBean.getStringToFormacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Formacion>() {
            public es.uca.iw.findyourjob.domain.Formacion convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Formacion.class);
            }
        };
    }
    
    public Converter<Inscripcion, String> ApplicationConversionServiceFactoryBean.getInscripcionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Inscripcion, java.lang.String>() {
            public String convert(Inscripcion inscripcion) {
                return new StringBuilder().append(inscripcion.getEstado()).append(' ').append(inscripcion.getFecha()).toString();
            }
        };
    }
    
    public Converter<Long, Inscripcion> ApplicationConversionServiceFactoryBean.getIdToInscripcionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Inscripcion>() {
            public es.uca.iw.findyourjob.domain.Inscripcion convert(java.lang.Long id) {
                return Inscripcion.findInscripcion(id);
            }
        };
    }
    
    public Converter<String, Inscripcion> ApplicationConversionServiceFactoryBean.getStringToInscripcionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Inscripcion>() {
            public es.uca.iw.findyourjob.domain.Inscripcion convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Inscripcion.class);
            }
        };
    }
    
    public Converter<Localizacion, String> ApplicationConversionServiceFactoryBean.getLocalizacionToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Localizacion, java.lang.String>() {
            public String convert(Localizacion localizacion) {
                return new StringBuilder().append(localizacion.getDireccion()).append(' ').append(localizacion.getLocalidad()).toString();
            }
        };
    }
    
    public Converter<Long, Localizacion> ApplicationConversionServiceFactoryBean.getIdToLocalizacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Localizacion>() {
            public es.uca.iw.findyourjob.domain.Localizacion convert(java.lang.Long id) {
                return Localizacion.findLocalizacion(id);
            }
        };
    }
    
    public Converter<String, Localizacion> ApplicationConversionServiceFactoryBean.getStringToLocalizacionConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Localizacion>() {
            public es.uca.iw.findyourjob.domain.Localizacion convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Localizacion.class);
            }
        };
    }
    
    public Converter<Oferta, String> ApplicationConversionServiceFactoryBean.getOfertaToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<es.uca.iw.findyourjob.domain.Oferta, java.lang.String>() {
            public String convert(Oferta oferta) {
                return new StringBuilder().append(oferta.getTipologia()).append(' ').append(oferta.getSueldo_bruto()).append(' ').append(oferta.getFecha_inicio_actividad()).append(' ').append(oferta.getVacantes()).toString();
            }
        };
    }
    
    public Converter<Long, Oferta> ApplicationConversionServiceFactoryBean.getIdToOfertaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, es.uca.iw.findyourjob.domain.Oferta>() {
            public es.uca.iw.findyourjob.domain.Oferta convert(java.lang.Long id) {
                return Oferta.findOferta(id);
            }
        };
    }
    
    public Converter<String, Oferta> ApplicationConversionServiceFactoryBean.getStringToOfertaConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, es.uca.iw.findyourjob.domain.Oferta>() {
            public es.uca.iw.findyourjob.domain.Oferta convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Oferta.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getCurriculumToStringConverter());
        registry.addConverter(getIdToCurriculumConverter());
        registry.addConverter(getStringToCurriculumConverter());
        registry.addConverter(getDemandanteToStringConverter());
        registry.addConverter(getIdToDemandanteConverter());
        registry.addConverter(getStringToDemandanteConverter());
        registry.addConverter(getEmpresaToStringConverter());
        registry.addConverter(getIdToEmpresaConverter());
        registry.addConverter(getStringToEmpresaConverter());
        registry.addConverter(getExperienciaToStringConverter());
        registry.addConverter(getIdToExperienciaConverter());
        registry.addConverter(getStringToExperienciaConverter());
        registry.addConverter(getFormacionToStringConverter());
        registry.addConverter(getIdToFormacionConverter());
        registry.addConverter(getStringToFormacionConverter());
        registry.addConverter(getInscripcionToStringConverter());
        registry.addConverter(getIdToInscripcionConverter());
        registry.addConverter(getStringToInscripcionConverter());
        registry.addConverter(getLocalizacionToStringConverter());
        registry.addConverter(getIdToLocalizacionConverter());
        registry.addConverter(getStringToLocalizacionConverter());
        registry.addConverter(getOfertaToStringConverter());
        registry.addConverter(getIdToOfertaConverter());
        registry.addConverter(getStringToOfertaConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}