// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.reference.OfertaEstado;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Oferta_Roo_Finder {
    
    public static Long Oferta.countFindOfertasByEstado(OfertaEstado estado) {
        if (estado == null) throw new IllegalArgumentException("The estado argument is required");
        EntityManager em = Oferta.entityManager();
        TypedQuery q = em.createQuery("SELECT COUNT(o) FROM Oferta AS o WHERE o.estado = :estado", Long.class);
        q.setParameter("estado", estado);
        return ((Long) q.getSingleResult());
    }
    
    public static TypedQuery<Oferta> Oferta.findOfertasByEstado(OfertaEstado estado) {
        if (estado == null) throw new IllegalArgumentException("The estado argument is required");
        EntityManager em = Oferta.entityManager();
        TypedQuery<Oferta> q = em.createQuery("SELECT o FROM Oferta AS o WHERE o.estado = :estado", Oferta.class);
        q.setParameter("estado", estado);
        return q;
    }
    
    public static TypedQuery<Oferta> Oferta.findOfertasByEstado(OfertaEstado estado, String sortFieldName, String sortOrder) {
        if (estado == null) throw new IllegalArgumentException("The estado argument is required");
        EntityManager em = Oferta.entityManager();
        StringBuilder queryBuilder = new StringBuilder("SELECT o FROM Oferta AS o WHERE o.estado = :estado");
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            queryBuilder.append(" ORDER BY ").append(sortFieldName);
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                queryBuilder.append(" ").append(sortOrder);
            }
        }
        TypedQuery<Oferta> q = em.createQuery(queryBuilder.toString(), Oferta.class);
        q.setParameter("estado", estado);
        return q;
    }
    
}
