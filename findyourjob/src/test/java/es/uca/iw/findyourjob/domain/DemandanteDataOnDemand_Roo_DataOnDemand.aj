// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.CurriculumDataOnDemand;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.DemandanteDataOnDemand;
import es.uca.iw.reference.Role;
import es.uca.iw.reference.Sexo;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect DemandanteDataOnDemand_Roo_DataOnDemand {
    
    declare @type: DemandanteDataOnDemand: @Component;
    
    private Random DemandanteDataOnDemand.rnd = new SecureRandom();
    
    private List<Demandante> DemandanteDataOnDemand.data;
    
    @Autowired
    CurriculumDataOnDemand DemandanteDataOnDemand.curriculumDataOnDemand;
    
    public Demandante DemandanteDataOnDemand.getNewTransientDemandante(int index) {
        Demandante obj = new Demandante();
        setApellidos(obj, index);
        setEmail(obj, index);
        setEnabled(obj, index);
        setFechaNacimiento(obj, index);
        setNombre(obj, index);
        setPassword(obj, index);
        setRol(obj, index);
        setSexo(obj, index);
        setTelefono(obj, index);
        setUsername(obj, index);
        return obj;
    }
    
    public void DemandanteDataOnDemand.setApellidos(Demandante obj, int index) {
        String apellidos = "apellidos_" + index;
        if (apellidos.length() > 30) {
            apellidos = apellidos.substring(0, 30);
        }
        obj.setApellidos(apellidos);
    }
    
    public void DemandanteDataOnDemand.setEmail(Demandante obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 30) {
            email = email.substring(0, 30);
        }
        obj.setEmail(email);
    }
    
    public void DemandanteDataOnDemand.setEnabled(Demandante obj, int index) {
        Boolean enabled = true;
        obj.setEnabled(enabled);
    }
    
    public void DemandanteDataOnDemand.setFechaNacimiento(Demandante obj, int index) {
        Date fechaNacimiento = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setFechaNacimiento(fechaNacimiento);
    }
    
    public void DemandanteDataOnDemand.setNombre(Demandante obj, int index) {
        String nombre = "nombre_" + index;
        if (nombre.length() > 30) {
            nombre = nombre.substring(0, 30);
        }
        obj.setNombre(nombre);
    }
    
    public void DemandanteDataOnDemand.setPassword(Demandante obj, int index) {
        String password = "password_" + index;
        if (password.length() > 10) {
            password = password.substring(0, 10);
        }
        obj.setPassword(password);
    }
    
    public void DemandanteDataOnDemand.setRol(Demandante obj, int index) {
        Role rol = Role.class.getEnumConstants()[0];
        obj.setRol(rol);
    }
    
    public void DemandanteDataOnDemand.setSexo(Demandante obj, int index) {
        Sexo sexo = Sexo.class.getEnumConstants()[0];
        obj.setSexo(sexo);
    }
    
    public void DemandanteDataOnDemand.setTelefono(Demandante obj, int index) {
        Double telefono = new Integer(index).doubleValue();
        obj.setTelefono(telefono);
    }
    
    public void DemandanteDataOnDemand.setUsername(Demandante obj, int index) {
        String username = "username_" + index;
        if (username.length() > 10) {
            username = username.substring(0, 10);
        }
        obj.setUsername(username);
    }
    
    public Demandante DemandanteDataOnDemand.getSpecificDemandante(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Demandante obj = data.get(index);
        Long id = obj.getId();
        return Demandante.findDemandante(id);
    }
    
    public Demandante DemandanteDataOnDemand.getRandomDemandante() {
        init();
        Demandante obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Demandante.findDemandante(id);
    }
    
    public boolean DemandanteDataOnDemand.modifyDemandante(Demandante obj) {
        return false;
    }
    
    public void DemandanteDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Demandante.findDemandanteEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Demandante' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Demandante>();
        for (int i = 0; i < 10; i++) {
            Demandante obj = getNewTransientDemandante(i);
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
