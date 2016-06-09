package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.reference.OfertaEstado;
import es.uca.iw.reference.Role;
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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;

@RequestMapping("/ofertas")
@Controller
@RooWebScaffold(path = "ofertas", formBackingObject = Oferta.class)
@GvNIXWebJQuery
@RooWebFinder
@GvNIXDatatables(ajax = true)
public class OfertaController {

    private Usuario getUsuarioSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return Usuario.findUsuariosByUsername(username).getSingleResult();
    }

    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        Usuario us = getUsuarioSesion();
        if (us.getRol() == Role.ADMINISTRADOR || us.getRol() == Role.GESTOR_ETT || us.getRol() == Role.GESTOR_EMPRESA) uiModel.addAttribute("ofertas", Oferta.findAllOfertas(sortFieldName, sortOrder));
        if (us.getRol() == Role.DEMANDANTE) uiModel.addAttribute("ofertas", Oferta.findOfertasByEstado(OfertaEstado.Activa));
        return "ofertas/list";
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Oferta oferta, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, oferta);
            return "ofertas/create";
        }
        uiModel.asMap().clear();
        Date fechaHoy = (Calendar.getInstance()).getTime(); //style="M-"
        if (fechaHoy.compareTo(oferta.getFechaDisponibleInicio()) < 0) oferta.setEstado(OfertaEstado.En_Espera);
        if (fechaHoy.compareTo(oferta.getFechaDisponibleInicio()) >= 0 && fechaHoy.compareTo(oferta.getFechaDisponibleFin()) <= 0) oferta.setEstado(OfertaEstado.Activa);
        if (fechaHoy.compareTo(oferta.getFechaDisponibleFin()) > 0) oferta.setEstado(OfertaEstado.Detenida);
        oferta.persist();
        return "redirect:/ofertas/" + encodeUrlPathSegment(oferta.getId().toString(), httpServletRequest);
    }
}
