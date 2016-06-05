// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.EmpresaDataOnDemand;
import es.uca.iw.findyourjob.domain.GestorEmpresa;
import es.uca.iw.reference.UsuarioRol;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect EmpresaDataOnDemand_Roo_DataOnDemand {
    
    declare @type: EmpresaDataOnDemand: @Component;
    
    private Random EmpresaDataOnDemand.rnd = new SecureRandom();
    
    private List<Empresa> EmpresaDataOnDemand.data;
    
    public Empresa EmpresaDataOnDemand.getNewTransientEmpresa(int index) {
        Empresa obj = new Empresa();
        setActividadProfesional(obj, index);
        setCif(obj, index);
        setEmail(obj, index);
        setEnabled(obj, index);
        setGestion_propia(obj, index);
        setGestor(obj, index);
        setNombre(obj, index);
        setNumeroEmpleados(obj, index);
        setPassword(obj, index);
        setRol(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void EmpresaDataOnDemand.setActividadProfesional(Empresa obj, int index) {
        String actividadProfesional = "actividadProfesional_" + index;
        if (actividadProfesional.length() > 30) {
            actividadProfesional = actividadProfesional.substring(0, 30);
        }
        obj.setActividadProfesional(actividadProfesional);
    }
    
    public void EmpresaDataOnDemand.setCif(Empresa obj, int index) {
        String cif = "cif_" + index;
        if (cif.length() > 30) {
            cif = cif.substring(0, 30);
        }
        obj.setCif(cif);
    }
    
    public void EmpresaDataOnDemand.setEmail(Empresa obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 30) {
            email = email.substring(0, 30);
        }
        obj.setEmail(email);
    }
    
    public void EmpresaDataOnDemand.setEnabled(Empresa obj, int index) {
        Boolean enabled = true;
        obj.setEnabled(enabled);
    }
    
    public void EmpresaDataOnDemand.setGestion_propia(Empresa obj, int index) {
        Boolean gestion_propia = true;
        obj.setGestion_propia(gestion_propia);
    }
    
    public void EmpresaDataOnDemand.setGestor(Empresa obj, int index) {
        GestorEmpresa gestor = null;
        obj.setGestor(gestor);
    }
    
    public void EmpresaDataOnDemand.setNombre(Empresa obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 30) {
            nombre = nombre.substring(0, 30);
        }
        obj.setNombre(nombre);
    }
    
    public void EmpresaDataOnDemand.setNumeroEmpleados(Empresa obj, int index) {
        int numeroEmpleados = index;
        if (numeroEmpleados < 0) {
            numeroEmpleados = 0;
        }
        obj.setNumeroEmpleados(numeroEmpleados);
    }
    
    public void EmpresaDataOnDemand.setPassword(Empresa obj, int index) {
        String password = "password_" + index;
        if (password.length() > 10) {
            password = password.substring(0, 10);
        }
        obj.setPassword(password);
    }
    
    public void EmpresaDataOnDemand.setRol(Empresa obj, int index) {
        UsuarioRol rol = UsuarioRol.class.getEnumConstants()[0];
        obj.setRol(rol);
    }
    
    public void EmpresaDataOnDemand.setUsername(Empresa obj, int index) {
        String username = "username_" + index;
        if (username.length() > 10) {
            username = username.substring(0, 10);
        }
        obj.setUsername(username);
    }
    
    public Empresa EmpresaDataOnDemand.getSpecificEmpresa(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Empresa obj = data.get(index);
        Long id = obj.getId();
        return Empresa.findEmpresa(id);
    }
    
    public Empresa EmpresaDataOnDemand.getRandomEmpresa() {
        init();
        Empresa obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Empresa.findEmpresa(id);
    }
    
    public boolean EmpresaDataOnDemand.modifyEmpresa(Empresa obj) {
        return false;
    }
    
    public void EmpresaDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Empresa.findEmpresaEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Empresa' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Empresa>();
        for (int i = 0; i < 10; i++) {
            Empresa obj = getNewTransientEmpresa(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
