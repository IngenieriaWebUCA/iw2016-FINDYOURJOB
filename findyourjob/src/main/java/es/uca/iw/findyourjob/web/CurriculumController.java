package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.reference.Role;
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

@RequestMapping("/curriculums")
@Controller
@RooWebScaffold(path = "curriculums", formBackingObject = Curriculum.class)
@GvNIXWebJQuery
@RooWebFinder
@GvNIXDatatables(ajax = true)
public class CurriculumController {

    private Usuario getUsuarioSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return Usuario.findUsuariosByUsername(username).getSingleResult();
    }

    private Demandante getDemandanteSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return Demandante.findDemandantesByUsername(username).getSingleResult();
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Curriculum curriculum, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, curriculum);
            return "curriculums/create";
        }
        uiModel.asMap().clear();
        Demandante de = getDemandanteSesion();
        curriculum.setDemandante(de);
        curriculum.persist();
        return "redirect:/curriculums/" + encodeUrlPathSegment(curriculum.getId().toString(), httpServletRequest);
    }

    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        Usuario us = getUsuarioSesion();
        if (us.getRol() == Role.DEMANDANTE) {
            Demandante de = Demandante.findDemandantesByUsername(us.getUsername()).getSingleResult();
            uiModel.addAttribute("curriculums", Curriculum.findCurriculumsByDemandante(de));
        } else {
            uiModel.addAttribute("curriculums", Curriculum.findAllCurriculums());
        }
        return "curriculums/list";
    }
}
