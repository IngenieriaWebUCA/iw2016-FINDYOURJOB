package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.GestorEmpresa;
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
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/gestorempresas")
@Controller
@RooWebScaffold(path = "gestorempresas", formBackingObject = GestorEmpresa.class)
@RooWebFinder
@GvNIXDatatables(ajax = true)
@GvNIXWebJQuery
public class GestorEmpresaController {

    private GestorEmpresa getGestorSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!Usuario es:" + username);
        return GestorEmpresa.findGestorEmpresasByUsername(username).getSingleResult();
    }

    private Usuario getUsuarioSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return Usuario.findUsuariosByUsername(username).getSingleResult();
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid GestorEmpresa gestorEmpresa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, gestorEmpresa);
            return "gestorempresas/create";
        }
        uiModel.asMap().clear();
        GestorEmpresa gestor = GestorEmpresa.findGestorEmpresasByUsername(gestorEmpresa.getUsername()).getSingleResult();
        if (gestor == null) {
            gestorEmpresa.setEmpresasGestionadas(null);
            gestorEmpresa.persist();
            Usuario us = new Usuario(gestorEmpresa.getUsername(), gestorEmpresa.getPassword(), Role.GESTOR_ETT, true);
            us.persist();
            return "redirect:/gestorempresas/" + encodeUrlPathSegment(gestorEmpresa.getId().toString(), httpServletRequest);
        } else return "gestorempresas/create";
    }
}
