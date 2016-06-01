// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Experiencia;
import es.uca.iw.findyourjob.web.ExperienciaController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect ExperienciaController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByNombreEmpresa", "form" }, method = RequestMethod.GET)
    public String ExperienciaController.findExperienciasByNombreEmpresaForm(Model uiModel) {
        return "experiencias/findExperienciasByNombreEmpresa";
    }
    
    @RequestMapping(params = "find=ByNombreEmpresa", method = RequestMethod.GET)
    public String ExperienciaController.findExperienciasByNombreEmpresa(@RequestParam("nombreEmpresa") String nombreEmpresa, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("experiencias", Experiencia.findExperienciasByNombreEmpresa(nombreEmpresa, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Experiencia.countFindExperienciasByNombreEmpresa(nombreEmpresa) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("experiencias", Experiencia.findExperienciasByNombreEmpresa(nombreEmpresa, sortFieldName, sortOrder).getResultList());
        }
        return "experiencias/list";
    }
    
}
