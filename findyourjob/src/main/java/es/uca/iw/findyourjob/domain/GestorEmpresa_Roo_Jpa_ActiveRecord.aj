// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.GestorEmpresa;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect GestorEmpresa_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager GestorEmpresa.entityManager;
    
    public static final List<String> GestorEmpresa.fieldNames4OrderClauseFilter = java.util.Arrays.asList("username", "password", "enabled", "empresasGestionadas");
    
    public static final EntityManager GestorEmpresa.entityManager() {
        EntityManager em = new GestorEmpresa().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long GestorEmpresa.countGestorEmpresas() {
        return entityManager().createQuery("SELECT COUNT(o) FROM GestorEmpresa o", Long.class).getSingleResult();
    }
    
    public static List<GestorEmpresa> GestorEmpresa.findAllGestorEmpresas() {
        return entityManager().createQuery("SELECT o FROM GestorEmpresa o", GestorEmpresa.class).getResultList();
    }
    
    public static List<GestorEmpresa> GestorEmpresa.findAllGestorEmpresas(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM GestorEmpresa o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, GestorEmpresa.class).getResultList();
    }
    
    public static GestorEmpresa GestorEmpresa.findGestorEmpresa(Long id) {
        if (id == null) return null;
        return entityManager().find(GestorEmpresa.class, id);
    }
    
    public static List<GestorEmpresa> GestorEmpresa.findGestorEmpresaEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM GestorEmpresa o", GestorEmpresa.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<GestorEmpresa> GestorEmpresa.findGestorEmpresaEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM GestorEmpresa o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, GestorEmpresa.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void GestorEmpresa.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void GestorEmpresa.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            GestorEmpresa attached = GestorEmpresa.findGestorEmpresa(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void GestorEmpresa.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void GestorEmpresa.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public GestorEmpresa GestorEmpresa.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        GestorEmpresa merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
