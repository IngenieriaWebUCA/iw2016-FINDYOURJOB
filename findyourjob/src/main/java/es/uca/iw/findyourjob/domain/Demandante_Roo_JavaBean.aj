// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.reference.Sexo;
import java.util.Date;
import java.util.Set;

privileged aspect Demandante_Roo_JavaBean {
    
    public String Demandante.getNombre() {
        return this.nombre;
    }
    
    public void Demandante.setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Demandante.getApellidos() {
        return this.apellidos;
    }
    
    public void Demandante.setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    
    public Sexo Demandante.getSexo() {
        return this.sexo;
    }
    
    public void Demandante.setSexo(Sexo sexo) {
        this.sexo = sexo;
    }
    
    public String Demandante.getEmail() {
        return this.email;
    }
    
    public void Demandante.setEmail(String email) {
        this.email = email;
    }
    
    public Double Demandante.getTelefono() {
        return this.telefono;
    }
    
    public void Demandante.setTelefono(Double telefono) {
        this.telefono = telefono;
    }
    
    public Set<Inscripcion> Demandante.getInscripciones() {
        return this.inscripciones;
    }
    
    public void Demandante.setInscripciones(Set<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }
    
    public Curriculum Demandante.getCurriculum() {
        return this.curriculum;
    }
    
    public void Demandante.setCurriculum(Curriculum curriculum) {
        this.curriculum = curriculum;
    }
    
    public Date Demandante.getFechaNacimiento() {
        return this.fechaNacimiento;
    }
    
    public void Demandante.setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }
    
}
