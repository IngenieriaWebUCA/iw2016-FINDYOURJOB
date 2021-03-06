// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Localizacion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.web.LocalizacionController;
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

privileged aspect LocalizacionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LocalizacionController.create(@Valid Localizacion localizacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, localizacion);
            return "localizacions/create";
        }
        uiModel.asMap().clear();
        localizacion.persist();
        return "redirect:/localizacions/" + encodeUrlPathSegment(localizacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LocalizacionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Localizacion());
        return "localizacions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LocalizacionController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("localizacion", Localizacion.findLocalizacion(id));
        uiModel.addAttribute("itemId", id);
        return "localizacions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LocalizacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("localizacions", Localizacion.findLocalizacionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Localizacion.countLocalizacions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("localizacions", Localizacion.findAllLocalizacions(sortFieldName, sortOrder));
        }
        return "localizacions/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LocalizacionController.update(@Valid Localizacion localizacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, localizacion);
            return "localizacions/update";
        }
        uiModel.asMap().clear();
        localizacion.merge();
        return "redirect:/localizacions/" + encodeUrlPathSegment(localizacion.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LocalizacionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Localizacion.findLocalizacion(id));
        return "localizacions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LocalizacionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Localizacion localizacion = Localizacion.findLocalizacion(id);
        localizacion.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/localizacions";
    }
    
    void LocalizacionController.populateEditForm(Model uiModel, Localizacion localizacion) {
        uiModel.addAttribute("localizacion", localizacion);
        uiModel.addAttribute("ofertas", Oferta.findAllOfertas());
    }
    
    String LocalizacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
