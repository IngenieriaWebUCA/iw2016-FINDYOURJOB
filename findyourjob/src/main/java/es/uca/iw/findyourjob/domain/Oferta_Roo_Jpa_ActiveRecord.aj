// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Oferta;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Oferta_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Oferta.entityManager;
    
    public static final List<String> Oferta.fieldNames4OrderClauseFilter = java.util.Arrays.asList("tipologia", "sueldo_bruto", "fecha_inicio_actividad", "vacantes", "perfil", "fecha_disponible_inicio", "fecha_disponible_fin", "estado", "localizacion", "empresa", "inscripciones", "puestoTrabajo");
    
    public static final EntityManager Oferta.entityManager() {
        EntityManager em = new Oferta().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Oferta.countOfertas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Oferta o", Long.class).getSingleResult();
    }
    
    public static List<Oferta> Oferta.findAllOfertas() {
        return entityManager().createQuery("SELECT o FROM Oferta o", Oferta.class).getResultList();
    }
    
    public static List<Oferta> Oferta.findAllOfertas(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Oferta o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Oferta.class).getResultList();
    }
    
    public static Oferta Oferta.findOferta(Long id) {
        if (id == null) return null;
        return entityManager().find(Oferta.class, id);
    }
    
    public static List<Oferta> Oferta.findOfertaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Oferta o", Oferta.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Oferta> Oferta.findOfertaEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Oferta o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Oferta.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Oferta.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Oferta.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Oferta attached = Oferta.findOferta(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Oferta.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Oferta.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Oferta Oferta.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Oferta merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
