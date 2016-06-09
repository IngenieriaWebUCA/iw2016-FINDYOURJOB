package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.GestorEmpresa;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.reference.Role;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/empresas")
@Controller
@RooWebScaffold(path = "empresas", formBackingObject = Empresa.class)
@GvNIXWebJQuery
@GvNIXDatatables(ajax = true)
@RooWebFinder
public class EmpresaController {

    private Usuario getUsuarioSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return Usuario.findUsuariosByUsername(username).getSingleResult();
    }

    private GestorEmpresa getGestorSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return GestorEmpresa.findGestorEmpresasByUsername(username).getSingleResult();
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Empresa empresa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, empresa);
            return "empresas/create";
        }
        uiModel.asMap().clear();
        Usuario us = getUsuarioSesion();
        if (empresa.isGestion_propia()) {
            empresa.setRol(Role.GESTOR_EMPRESA);
            empresa.setEnabled(true);
            empresa.setUsuarioGestor(empresa.getUsername());
        } else {
            if (us.getRol() == Role.ADMINISTRADOR) {
                empresa.setEnabled(false);
                String u = "gestor1"; //En el sistema hay un gestor por defecto que es gestor1
                GestorEmpresa ge = GestorEmpresa.findGestorEmpresasByUsername(u).getSingleResult();
                Set<Empresa> empresasges = ge.getEmpresasGestionadas();
                empresasges.add(empresa);
                ge.setEmpresasGestionadas(empresasges);
                empresa.setGestor(ge);
                empresa.setUsuarioGestor(ge.getUsername());
            } else {
                GestorEmpresa gestor_ett;
                gestor_ett = GestorEmpresa.findGestorEmpresasByUsername(us.getUsername()).getSingleResult();
                Set<Empresa> empresasges = gestor_ett.getEmpresasGestionadas();
                empresasges.add(empresa);
                gestor_ett.setEmpresasGestionadas(empresasges);
                empresa.setGestor(gestor_ett);
                empresa.setUsuarioGestor(gestor_ett.getUsername());
            }
        }
        empresa.persist();
        return "redirect:/empresas/" + encodeUrlPathSegment(empresa.getId().toString(), httpServletRequest);
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Empresa());
        return "empresas/create";
    }

    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("empresa", Empresa.findEmpresa(id));
        uiModel.addAttribute("itemId", id);
        return "empresas/show";
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Empresa.findEmpresa(id));
        return "empresas/update";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Empresa empresa = Empresa.findEmpresa(id);
        empresa.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/empresas";
    }

    void populateEditForm(Model uiModel, Empresa empresa) {
        uiModel.addAttribute("empresa", empresa);
        uiModel.addAttribute("ofertas", Oferta.findAllOfertas());
    }

    String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {
        }
        return pathSegment;
    }
}
