// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Experiencia;
import es.uca.iw.findyourjob.web.ExperienciaController;
import java.io.UnsupportedEncodingException;
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

privileged aspect ExperienciaController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ExperienciaController.create(@Valid Experiencia experiencia, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, experiencia);
            return "experiencias/create";
        }
        uiModel.asMap().clear();
        experiencia.persist();
        return "redirect:/experiencias/" + encodeUrlPathSegment(experiencia.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ExperienciaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Experiencia());
        return "experiencias/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ExperienciaController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("experiencia", Experiencia.findExperiencia(id));
        uiModel.addAttribute("itemId", id);
        return "experiencias/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ExperienciaController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("experiencias", Experiencia.findExperienciaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Experiencia.countExperiencias() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("experiencias", Experiencia.findAllExperiencias(sortFieldName, sortOrder));
        }
        return "experiencias/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ExperienciaController.update(@Valid Experiencia experiencia, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, experiencia);
            return "experiencias/update";
        }
        uiModel.asMap().clear();
        experiencia.merge();
        return "redirect:/experiencias/" + encodeUrlPathSegment(experiencia.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ExperienciaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Experiencia.findExperiencia(id));
        return "experiencias/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ExperienciaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Experiencia experiencia = Experiencia.findExperiencia(id);
        experiencia.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/experiencias";
    }
    
    void ExperienciaController.populateEditForm(Model uiModel, Experiencia experiencia) {
        uiModel.addAttribute("experiencia", experiencia);
    }
    
    String ExperienciaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
