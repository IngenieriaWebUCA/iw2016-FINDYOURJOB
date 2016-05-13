// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Experiencia;
import es.uca.iw.findyourjob.domain.Formacion;
import es.uca.iw.findyourjob.domain.PuestoTrabajo;
import es.uca.iw.findyourjob.web.CurriculumController;
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

privileged aspect CurriculumController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CurriculumController.create(@Valid Curriculum curriculum, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, curriculum);
            return "curriculums/create";
        }
        uiModel.asMap().clear();
        curriculum.persist();
        return "redirect:/curriculums/" + encodeUrlPathSegment(curriculum.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CurriculumController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Curriculum());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Demandante.countDemandantes() == 0) {
            dependencies.add(new String[] { "formacion_academica", "demandantes" });
        }
        if (Formacion.countFormacions() == 0) {
            dependencies.add(new String[] { "demandante", "formacions" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "curriculums/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CurriculumController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("curriculum", Curriculum.findCurriculum(id));
        uiModel.addAttribute("itemId", id);
        return "curriculums/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CurriculumController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("curriculums", Curriculum.findCurriculumEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Curriculum.countCurriculums() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("curriculums", Curriculum.findAllCurriculums(sortFieldName, sortOrder));
        }
        return "curriculums/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CurriculumController.update(@Valid Curriculum curriculum, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, curriculum);
            return "curriculums/update";
        }
        uiModel.asMap().clear();
        curriculum.merge();
        return "redirect:/curriculums/" + encodeUrlPathSegment(curriculum.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CurriculumController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Curriculum.findCurriculum(id));
        return "curriculums/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CurriculumController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Curriculum curriculum = Curriculum.findCurriculum(id);
        curriculum.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/curriculums";
    }
    
    void CurriculumController.populateEditForm(Model uiModel, Curriculum curriculum) {
        uiModel.addAttribute("curriculum", curriculum);
        uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
        uiModel.addAttribute("experiencias", Experiencia.findAllExperiencias());
        uiModel.addAttribute("formacions", Formacion.findAllFormacions());
        uiModel.addAttribute("puestotrabajoes", PuestoTrabajo.findAllPuestoTrabajoes());
    }
    
    String CurriculumController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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