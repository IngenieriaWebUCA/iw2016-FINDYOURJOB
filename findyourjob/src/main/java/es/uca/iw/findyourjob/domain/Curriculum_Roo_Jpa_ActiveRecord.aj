// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Curriculum;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Curriculum_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Curriculum.entityManager;
    
    public static final List<String> Curriculum.fieldNames4OrderClauseFilter = java.util.Arrays.asList("trayectoria", "foto", "demandante", "formacion", "experiencias");
    
    public static final EntityManager Curriculum.entityManager() {
        EntityManager em = new Curriculum().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Curriculum.countCurriculums() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Curriculum o", Long.class).getSingleResult();
    }
    
    public static List<Curriculum> Curriculum.findAllCurriculums() {
        return entityManager().createQuery("SELECT o FROM Curriculum o", Curriculum.class).getResultList();
    }
    
    public static List<Curriculum> Curriculum.findAllCurriculums(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Curriculum o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Curriculum.class).getResultList();
    }
    
    public static Curriculum Curriculum.findCurriculum(Long id) {
        if (id == null) return null;
        return entityManager().find(Curriculum.class, id);
    }
    
    public static List<Curriculum> Curriculum.findCurriculumEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Curriculum o", Curriculum.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Curriculum> Curriculum.findCurriculumEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Curriculum o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Curriculum.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Curriculum.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Curriculum.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Curriculum attached = Curriculum.findCurriculum(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Curriculum.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Curriculum.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Curriculum Curriculum.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Curriculum merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
