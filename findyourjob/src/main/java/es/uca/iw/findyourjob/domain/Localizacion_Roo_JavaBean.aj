// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Localizacion;
import es.uca.iw.findyourjob.domain.Oferta;
import java.util.Set;

privileged aspect Localizacion_Roo_JavaBean {
    
    public String Localizacion.getDireccion() {
        return this.direccion;
    }
    
    public void Localizacion.setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String Localizacion.getLocalidad() {
        return this.localidad;
    }
    
    public void Localizacion.setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    
    public Set<Oferta> Localizacion.getOfertas() {
        return this.ofertas;
    }
    
    public void Localizacion.setOfertas(Set<Oferta> ofertas) {
        this.ofertas = ofertas;
    }
    
}
