// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.domain;

import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.CurriculumDataOnDemand;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.DemandanteDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CurriculumDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CurriculumDataOnDemand: @Component;
    
    private Random CurriculumDataOnDemand.rnd = new SecureRandom();
    
    private List<Curriculum> CurriculumDataOnDemand.data;
    
    @Autowired
    DemandanteDataOnDemand CurriculumDataOnDemand.demandanteDataOnDemand;
    
    public Curriculum CurriculumDataOnDemand.getNewTransientCurriculum(int index) {
        Curriculum obj = new Curriculum();
        setDemandante(obj, index);
        setFoto(obj, index);
        setTrayectoria(obj, index);
        return obj;
    }
    
    public void CurriculumDataOnDemand.setDemandante(Curriculum obj, int index) {
        Demandante demandante = demandanteDataOnDemand.getRandomDemandante();
        obj.setDemandante(demandante);
    }
    
    public void CurriculumDataOnDemand.setFoto(Curriculum obj, int index) {
        String foto = "foto_" + index;
        if (foto.length() > 30) {
            foto = foto.substring(0, 30);
        }
        obj.setFoto(foto);
    }
    
    public void CurriculumDataOnDemand.setTrayectoria(Curriculum obj, int index) {
        String trayectoria = "trayectoria_" + index;
        if (trayectoria.length() > 30) {
            trayectoria = trayectoria.substring(0, 30);
        }
        obj.setTrayectoria(trayectoria);
    }
    
    public Curriculum CurriculumDataOnDemand.getSpecificCurriculum(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Curriculum obj = data.get(index);
        Long id = obj.getId();
        return Curriculum.findCurriculum(id);
    }
    
    public Curriculum CurriculumDataOnDemand.getRandomCurriculum() {
        init();
        Curriculum obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Curriculum.findCurriculum(id);
    }
    
    public boolean CurriculumDataOnDemand.modifyCurriculum(Curriculum obj) {
        return false;
    }
    
    public void CurriculumDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Curriculum.findCurriculumEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Curriculum' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Curriculum>();
        for (int i = 0; i < 10; i++) {
            Curriculum obj = getNewTransientCurriculum(i);
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
