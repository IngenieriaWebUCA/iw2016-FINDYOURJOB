// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Localizacion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.domain.Puesto;
import java.util.Set;

privileged aspect Oferta_Roo_JavaBean {
    
    public String Oferta.getTipologia() {
        return this.tipologia;
    }
    
    public void Oferta.setTipologia(String tipologia) {
        this.tipologia = tipologia;
    }
    
    public Float Oferta.getSueldoBruto() {
        return this.sueldoBruto;
    }
    
    public void Oferta.setSueldoBruto(Float sueldoBruto) {
        this.sueldoBruto = sueldoBruto;
    }
    
    public String Oferta.getFechaInicioActividad() {
        return this.fechaInicioActividad;
    }
    
    public void Oferta.setFechaInicioActividad(String fechaInicioActividad) {
        this.fechaInicioActividad = fechaInicioActividad;
    }
    
    public String Oferta.getVacantes() {
        return this.vacantes;
    }
    
    public void Oferta.setVacantes(String vacantes) {
        this.vacantes = vacantes;
    }
    
    public String Oferta.getPerfil() {
        return this.perfil;
    }
    
    public void Oferta.setPerfil(String perfil) {
        this.perfil = perfil;
    }
    
    public String Oferta.getFechaDisponibleInicio() {
        return this.fechaDisponibleInicio;
    }
    
    public void Oferta.setFechaDisponibleInicio(String fechaDisponibleInicio) {
        this.fechaDisponibleInicio = fechaDisponibleInicio;
    }
    
    public String Oferta.getEstado() {
        return this.estado;
    }
    
    public void Oferta.setEstado(String estado) {
        this.estado = estado;
    }
    
    public Localizacion Oferta.getLocalizacion() {
        return this.localizacion;
    }
    
    public void Oferta.setLocalizacion(Localizacion localizacion) {
        this.localizacion = localizacion;
    }
    
    public Empresa Oferta.getEmpresa() {
        return this.empresa;
    }
    
    public void Oferta.setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }
    
    public Set<Inscripcion> Oferta.getInscripciones() {
        return this.inscripciones;
    }
    
    public void Oferta.setInscripciones(Set<Inscripcion> inscripciones) {
        this.inscripciones = inscripciones;
    }
    
    public Puesto Oferta.getPuestoTrabajo() {
        return this.puestoTrabajo;
    }
    
    public void Oferta.setPuestoTrabajo(Puesto puestoTrabajo) {
        this.puestoTrabajo = puestoTrabajo;
    }
    
}
