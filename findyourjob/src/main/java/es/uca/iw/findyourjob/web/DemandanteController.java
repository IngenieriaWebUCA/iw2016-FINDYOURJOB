package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.reference.UsuarioRol;
import es.uca.iw.findyourjob.domain.Usuario;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/demandantes")
@Controller
@RooWebScaffold(path = "demandantes", formBackingObject = Demandante.class)
@GvNIXWebJQuery
public class DemandanteController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Demandante demandante, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, demandante);
            return "demandantes/create";
        }
        uiModel.asMap().clear();
        demandante.setRol(UsuarioRol.DEMANDANTE);
        demandante.setEnabled(true);
        demandante.persist();
        return "redirect:/login";
    }
}
