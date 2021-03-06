// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.GestorEmpresa;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Empresa_Roo_Finder {
    
    public static Long Empresa.countFindEmpresasByGestor(GestorEmpresa gestor) {
        if (gestor == null) throw new IllegalArgumentException("The gestor argument is required");
        EntityManager em = Empresa.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Empresa AS o WHERE o.gestor = :gestor", Long.class);
        q.setParameter("gestor", gestor);
        return ((Long) q.getSingleResult());
    }
    
    public static Long Empresa.countFindEmpresasByUsuarioGestor(String usuarioGestor) {
        if (usuarioGestor == null || usuarioGestor.length() == 0) throw new IllegalArgumentException("The usuarioGestor argument is required");
        EntityManager em = Empresa.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Empresa AS o WHERE o.usuarioGestor = :usuarioGestor", Long.class);
        q.setParameter("usuarioGestor", usuarioGestor);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Empresa> Empresa.findEmpresasByGestor(GestorEmpresa gestor) {
        if (gestor == null) throw new IllegalArgumentException("The gestor argument is required");
        EntityManager em = Empresa.entityManager();
        TypedQuery<Empresa> q = em.createQuery("SELECT o FROM Empresa AS o WHERE o.gestor = :gestor", Empresa.class);
        q.setParameter("gestor", gestor);
        return q;
    }
    
    public static TypedQuery<Empresa> Empresa.findEmpresasByGestor(GestorEmpresa gestor, String sortFieldName, String sortOrder) {
        if (gestor == null) throw new IllegalArgumentException("The gestor argument is required");
        EntityManager em = Empresa.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Empresa AS o WHERE o.gestor = :gestor");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Empresa> q = em.createQuery(queryBuilder.toString(), Empresa.class);
        q.setParameter("gestor", gestor);
        return q;
    }
    
    public static TypedQuery<Empresa> Empresa.findEmpresasByUsuarioGestor(String usuarioGestor) {
        if (usuarioGestor == null || usuarioGestor.length() == 0) throw new IllegalArgumentException("The usuarioGestor argument is required");
        EntityManager em = Empresa.entityManager();
        TypedQuery<Empresa> q = em.createQuery("SELECT o FROM Empresa AS o WHERE o.usuarioGestor = :usuarioGestor", Empresa.class);
        q.setParameter("usuarioGestor", usuarioGestor);
        return q;
    }
    
    public static TypedQuery<Empresa> Empresa.findEmpresasByUsuarioGestor(String usuarioGestor, String sortFieldName, String sortOrder) {
        if (usuarioGestor == null || usuarioGestor.length() == 0) throw new IllegalArgumentException("The usuarioGestor argument is required");
        EntityManager em = Empresa.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Empresa AS o WHERE o.usuarioGestor = :usuarioGestor");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Empresa> q = em.createQuery(queryBuilder.toString(), Empresa.class);
        q.setParameter("usuarioGestor", usuarioGestor);
        return q;
    }
    
}
