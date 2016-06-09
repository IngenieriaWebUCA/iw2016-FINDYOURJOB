package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Experiencia;
import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.reference.Role;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/experiencias")
@Controller
@RooWebScaffold(path = "experiencias", formBackingObject = Experiencia.class)
@GvNIXWebJQuery
@RooWebFinder
@GvNIXDatatables(ajax = true)
public class ExperienciaController {

    private Usuario getUsuarioSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return Usuario.findUsuariosByUsername(username).getSingleResult();
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Experiencia experiencia, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, experiencia);
            return "experiencias/create";
        }
        uiModel.asMap().clear();
        Usuario us = getUsuarioSesion();
        Demandante de = Demandante.findDemandantesByUsername(us.getUsername()).getSingleResult();
        experiencia.setCurriculum(de.getCurriculum());
        experiencia.persist();
        return "redirect:/experiencias/" + encodeUrlPathSegment(experiencia.getId().toString(), httpServletRequest);
    }

    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        /*if (page != null || size != null) {
         int sizeNo = size == null ? 10 : size.intValue();
         final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
         uiModel.addAttribute("experiencias", Experiencia.findExperienciaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
         float nrOfPages = (float) Experiencia.countExperiencias() / sizeNo;
         uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
         } else {*/
        Usuario us = getUsuarioSesion();
        if (us.getRol() == Role.DEMANDANTE) {
            Demandante de = Demandante.findDemandantesByUsername(us.getUsername()).getSingleResult();
            uiModel.addAttribute("experiencias", Experiencia.findExperienciasByCurriculum(de.getCurriculum()).getResultList());
        } else {
            uiModel.addAttribute("experiencias", Experiencia.findAllExperiencias(sortFieldName, sortOrder));
        }
        //}
        addDateTimeFormatPatterns(uiModel);
        return "experiencias/list";
    }
}
