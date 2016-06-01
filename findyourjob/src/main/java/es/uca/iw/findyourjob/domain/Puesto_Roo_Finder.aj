// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Puesto;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Puesto_Roo_Finder {
    
    public static Long Puesto.countFindPuestoesByNombre(String nombre) {
        if (nombre == null || nombre.length() == 0) throw new IllegalArgumentException("The nombre argument is required");
        EntityManager em = Puesto.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Puesto AS o WHERE o.nombre = :nombre", Long.class);
        q.setParameter("nombre", nombre);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Puesto> Puesto.findPuestoesByNombre(String nombre) {
        if (nombre == null || nombre.length() == 0) throw new IllegalArgumentException("The nombre argument is required");
        EntityManager em = Puesto.entityManager();
        TypedQuery<Puesto> q = em.createQuery("SELECT o FROM Puesto AS o WHERE o.nombre = :nombre", Puesto.class);
        q.setParameter("nombre", nombre);
        return q;
    }
    
    public static TypedQuery<Puesto> Puesto.findPuestoesByNombre(String nombre, String sortFieldName, String sortOrder) {
        if (nombre == null || nombre.length() == 0) throw new IllegalArgumentException("The nombre argument is required");
        EntityManager em = Puesto.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Puesto AS o WHERE o.nombre = :nombre");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Puesto> q = em.createQuery(queryBuilder.toString(), Puesto.class);
        q.setParameter("nombre", nombre);
        return q;
    }
    
}