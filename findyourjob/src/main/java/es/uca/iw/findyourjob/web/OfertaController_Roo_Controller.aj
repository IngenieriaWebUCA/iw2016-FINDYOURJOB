// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Localizacion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.domain.Puesto;
import es.uca.iw.findyourjob.web.OfertaController;
import es.uca.iw.reference.OfertaEstado;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect OfertaController_Roo_Controller {
    
    @RequestMapping(params = "form", produces = "text/html")
    public String OfertaController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Oferta());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Empresa.countEmpresas() == 0) {
            dependencies.add(new String[] { "estado", "empresas" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "ofertas/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String OfertaController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("oferta", Oferta.findOferta(id));
        uiModel.addAttribute("itemId", id);
        return "ofertas/show";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String OfertaController.update(@Valid Oferta oferta, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, oferta);
            return "ofertas/update";
        }
        uiModel.asMap().clear();
        oferta.merge();
        return "redirect:/ofertas/" + encodeUrlPathSegment(oferta.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String OfertaController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Oferta.findOferta(id));
        return "ofertas/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String OfertaController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Oferta oferta = Oferta.findOferta(id);
        oferta.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/ofertas";
    }
    
    void OfertaController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("oferta_fechadisponibleinicio_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("oferta_fechadisponiblefin_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("oferta_fechainicioactividad_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void OfertaController.populateEditForm(Model uiModel, Oferta oferta) {
        uiModel.addAttribute("oferta", oferta);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        uiModel.addAttribute("inscripcions", Inscripcion.findAllInscripcions());
        uiModel.addAttribute("localizacions", Localizacion.findAllLocalizacions());
        uiModel.addAttribute("puestoes", Puesto.findAllPuestoes());
        uiModel.addAttribute("ofertaestadoes", Arrays.asList(OfertaEstado.values()));
    }
    
    String OfertaController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
