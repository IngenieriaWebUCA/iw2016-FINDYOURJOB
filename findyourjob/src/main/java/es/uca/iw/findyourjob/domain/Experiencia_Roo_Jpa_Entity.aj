// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Experiencia;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect Experiencia_Roo_Jpa_Entity {
    
    declare @type: Experiencia: @Entity;
    
    @Id
    @SequenceGenerator(name = "experienciaGen", sequenceName = "EXPERIENCIA_SEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "experienciaGen")
    @Column(name = "id")
    private Long Experiencia.id;
    
    @Version
    @Column(name = "version")
    private Integer Experiencia.version;
    
    public Long Experiencia.getId() {
        return this.id;
    }
    
    public void Experiencia.setId(Long id) {
        this.id = id;
    }
    
    public Integer Experiencia.getVersion() {
        return this.version;
    }
    
    public void Experiencia.setVersion(Integer version) {
        this.version = version;
    }
    
}
