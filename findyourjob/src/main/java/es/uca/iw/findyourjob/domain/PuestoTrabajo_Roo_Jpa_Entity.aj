// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.PuestoTrabajo;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Version;

privileged aspect PuestoTrabajo_Roo_Jpa_Entity {
    
    declare @type: PuestoTrabajo: @Entity;
    
    @Id
    @SequenceGenerator(name = "puestoTrabajoGen", sequenceName = "PUESTOTRABAJO_SEQ")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "puestoTrabajoGen")
    @Column(name = "id")
    private Long PuestoTrabajo.id;
    
    @Version
    @Column(name = "version")
    private Integer PuestoTrabajo.version;
    
    public Long PuestoTrabajo.getId() {
        return this.id;
    }
    
    public void PuestoTrabajo.setId(Long id) {
        this.id = id;
    }
    
    public Integer PuestoTrabajo.getVersion() {
        return this.version;
    }
    
    public void PuestoTrabajo.setVersion(Integer version) {
        this.version = version;
    }
    
}
