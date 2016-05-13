// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Formacion;
import es.uca.iw.findyourjob.web.FormacionController;
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

privileged aspect FormacionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String FormacionController.create(@Valid Formacion formacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, formacion);
            return "formacions/create";
        }
        uiModel.asMap().clear();
        formacion.persist();
        return "redirect:/formacions/" + encodeUrlPathSegment(formacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String FormacionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Formacion());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Curriculum.countCurriculums() == 0) {
            dependencies.add(new String[] { "curriculum", "curriculums" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "formacions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String FormacionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("formacion", Formacion.findFormacion(id));
        uiModel.addAttribute("itemId", id);
        return "formacions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String FormacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("formacions", Formacion.findFormacionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Formacion.countFormacions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("formacions", Formacion.findAllFormacions(sortFieldName, sortOrder));
        }
        return "formacions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String FormacionController.update(@Valid Formacion formacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, formacion);
            return "formacions/update";
        }
        uiModel.asMap().clear();
        formacion.merge();
        return "redirect:/formacions/" + encodeUrlPathSegment(formacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String FormacionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Formacion.findFormacion(id));
        return "formacions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String FormacionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Formacion formacion = Formacion.findFormacion(id);
        formacion.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/formacions";
    }
    
    void FormacionController.populateEditForm(Model uiModel, Formacion formacion) {
        uiModel.addAttribute("formacion", formacion);
        uiModel.addAttribute("curriculums", Curriculum.findAllCurriculums());
    }
    
    String FormacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
