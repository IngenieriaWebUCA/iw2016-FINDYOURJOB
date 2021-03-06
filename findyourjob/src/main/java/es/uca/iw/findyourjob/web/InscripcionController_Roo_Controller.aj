// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.web.InscripcionController;
import es.uca.iw.reference.InscripcionEstado;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect InscripcionController_Roo_Controller {
    
    @RequestMapping(params = "form", produces = "text/html")
    public String InscripcionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Inscripcion());
        return "inscripcions/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String InscripcionController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("inscripcion", Inscripcion.findInscripcion(id));
        uiModel.addAttribute("itemId", id);
        return "inscripcions/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String InscripcionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("inscripcions", Inscripcion.findInscripcionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Inscripcion.countInscripcions() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("inscripcions", Inscripcion.findAllInscripcions(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "inscripcions/list";
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String InscripcionController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Inscripcion.findInscripcion(id));
        return "inscripcions/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String InscripcionController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Inscripcion inscripcion = Inscripcion.findInscripcion(id);
        inscripcion.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/inscripcions";
    }
    
    void InscripcionController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("inscripcion_fecha_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void InscripcionController.populateEditForm(Model uiModel, Inscripcion inscripcion) {
        uiModel.addAttribute("inscripcion", inscripcion);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("demandantes", Demandante.findAllDemandantes());
        uiModel.addAttribute("ofertas", Oferta.findAllOfertas());
        uiModel.addAttribute("inscripcionestadoes", Arrays.asList(InscripcionEstado.values()));
    }
    
    String InscripcionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
