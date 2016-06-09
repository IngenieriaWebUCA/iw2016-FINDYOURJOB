// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Usuario;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Usuario_Roo_Finder {
    
    public static Long Usuario.countFindUsuariosByUsername(String username) {
        if (username == null || username.length() == 0) throw new IllegalArgumentException("The username argument is required");
        EntityManager em = Usuario.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Usuario AS o WHERE o.username = :username", Long.class);
        q.setParameter("username", username);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Usuario> Usuario.findUsuariosByUsername(String username) {
        if (username == null || username.length() == 0) throw new IllegalArgumentException("The username argument is required");
        EntityManager em = Usuario.entityManager();
        TypedQuery<Usuario> q = em.createQuery("SELECT o FROM Usuario AS o WHERE o.username = :username", Usuario.class);
        q.setParameter("username", username);
        return q;
    }
    
    public static TypedQuery<Usuario> Usuario.findUsuariosByUsername(String username, String sortFieldName, String sortOrder) {
        if (username == null || username.length() == 0) throw new IllegalArgumentException("The username argument is required");
        EntityManager em = Usuario.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Usuario AS o WHERE o.username = :username");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Usuario> q = em.createQuery(queryBuilder.toString(), Usuario.class);
        q.setParameter("username", username);
        return q;
    }
    
}