// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.web.DemandanteController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DemandanteController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DemandanteController.create(@Valid Demandante demandante, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, demandante);
            return "demandantes/create";
        }
        uiModel.asMap().clear();
        demandante.persist();
        return "redirect:/demandantes/" + encodeUrlPathSegment(demandante.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DemandanteController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Demandante());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Curriculum.countCurriculums() == 0) {
            dependencies.add(new String[] { "curriculum", "curriculums" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "demandantes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DemandanteController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("demandante", Demandante.findDemandante(id));
        uiModel.addAttribute("itemId", id);
        return "demandantes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DemandanteController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("demandantes", Demandante.findDemandanteEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Demandante.countDemandantes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("demandantes", Demandante.findAllDemandantes(sortFieldName, sortOrder));
        }
        return "demandantes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DemandanteController.update(@Valid Demandante demandante, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, demandante);
            return "demandantes/update";
        }
        uiModel.asMap().clear();
        demandante.merge();
        return "redirect:/demandantes/" + encodeUrlPathSegment(demandante.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DemandanteController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Demandante.findDemandante(id));
        return "demandantes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DemandanteController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Demandante demandante = Demandante.findDemandante(id);
        demandante.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/demandantes";
    }
    
    void DemandanteController.populateEditForm(Model uiModel, Demandante demandante) {
        uiModel.addAttribute("demandante", demandante);
        uiModel.addAttribute("curriculums", Curriculum.findAllCurriculums());
        uiModel.addAttribute("inscripcions", Inscripcion.findAllInscripcions());
    }
    
    String DemandanteController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
