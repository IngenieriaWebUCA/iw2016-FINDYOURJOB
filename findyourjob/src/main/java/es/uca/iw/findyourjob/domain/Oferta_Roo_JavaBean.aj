// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Localizacion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.domain.PuestoTrabajo;
import java.util.Date;
import java.util.Set;

privileged aspect Oferta_Roo_JavaBean {
    
    public String Oferta.getTipologia() {
        return this.tipologia;
    }
    
    public void Oferta.setTipologia(String tipologia) {
        this.tipologia = tipologia;
    }
    
    public float Oferta.getSueldo_bruto() {
        return this.sueldo_bruto;
    }
    
    public void Oferta.setSueldo_bruto(float sueldo_bruto) {
        this.sueldo_bruto = sueldo_bruto;
    }
    
    public Date Oferta.getFecha_inicio_actividad() {
        return this.fecha_inicio_actividad;
    }
    
    public void Oferta.setFecha_inicio_actividad(Date fecha_inicio_actividad) {
        this.fecha_inicio_actividad = fecha_inicio_actividad;
    }
    
    public int Oferta.getVacantes() {
        return this.vacantes;
    }
    
    public void Oferta.setVacantes(int vacantes) {
        this.vacantes = vacantes;
    }
    
    public String Oferta.getPerfil() {
        return this.perfil;
    }
    
    public void Oferta.setPerfil(String perfil) {
        this.perfil = perfil;
    }
    
    public Date Oferta.getFecha_disponible_inicio() {
        return this.fecha_disponible_inicio;
    }
    
    public void Oferta.setFecha_disponible_inicio(Date fecha_disponible_inicio) {
        this.fecha_disponible_inicio = fecha_disponible_inicio;
    }
    
    public Date Oferta.getFecha_disponible_fin() {
        return this.fecha_disponible_fin;
    }
    
    public void Oferta.setFecha_disponible_fin(Date fecha_disponible_fin) {
        this.fecha_disponible_fin = fecha_disponible_fin;
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
    
    public PuestoTrabajo Oferta.getPuestoTrabajo() {
        return this.puestoTrabajo;
    }
    
    public void Oferta.setPuestoTrabajo(PuestoTrabajo puestoTrabajo) {
        this.puestoTrabajo = puestoTrabajo;
    }
    
}