// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.GestorEmpresa;
import es.uca.iw.findyourjob.domain.Oferta;
import java.util.Set;

privileged aspect Empresa_Roo_JavaBean {
    
    public String Empresa.getNombre() {
        return this.nombre;
    }
    
    public void Empresa.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Empresa.getCif() {
        return this.cif;
    }
    
    public void Empresa.setCif(String cif) {
        this.cif = cif;
    }
    
    public String Empresa.getEmail() {
        return this.email;
    }
    
    public void Empresa.setEmail(String email) {
        this.email = email;
    }
    
    public String Empresa.getActividadProfesional() {
        return this.actividadProfesional;
    }
    
    public void Empresa.setActividadProfesional(String actividadProfesional) {
        this.actividadProfesional = actividadProfesional;
    }
    
    public int Empresa.getNumeroEmpleados() {
        return this.numeroEmpleados;
    }
    
    public void Empresa.setNumeroEmpleados(int numeroEmpleados) {
        this.numeroEmpleados = numeroEmpleados;
    }
    
    public boolean Empresa.isGestion_propia() {
        return this.gestion_propia;
    }
    
    public void Empresa.setGestion_propia(boolean gestion_propia) {
        this.gestion_propia = gestion_propia;
    }
    
    public Set<Oferta> Empresa.getOfertas() {
        return this.ofertas;
    }
    
    public void Empresa.setOfertas(Set<Oferta> ofertas) {
        this.ofertas = ofertas;
    }
    
    public GestorEmpresa Empresa.getGestor() {
        return this.gestor;
    }
    
    public void Empresa.setGestor(GestorEmpresa gestor) {
        this.gestor = gestor;
    }
    
}
