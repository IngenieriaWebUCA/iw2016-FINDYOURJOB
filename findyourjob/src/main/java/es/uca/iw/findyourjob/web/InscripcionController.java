package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Experiencia;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.reference.InscripcionEstado;
import es.uca.iw.reference.OfertaEstado;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.loupefield.annotations.GvNIXLoupeController;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/inscripcions")
@Controller
@RooWebScaffold(path = "inscripcions", formBackingObject = Inscripcion.class)
@GvNIXWebJQuery
@RooWebFinder
@GvNIXDatatables(ajax = true)
@GvNIXLoupeController
public class InscripcionController {

    private Usuario getUsuarioSesion() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        return Usuario.findUsuariosByUsername(username).getSingleResult();
    }

    @RequestMapping(value = "/inscribir/{id}", produces = "text/html")
    public String inscribir(@PathVariable("id") Long id, Model uiModel) {
        //Usuario usuario = getUsuarioSesion();
        //Demandante demandante = Demandante.findDemandantesByUsername(usuario.getUsername()).getSingleResult();
        Oferta oferta = Oferta.findOferta(id);
        uiModel.addAttribute("inscripcion", new Inscripcion());
        uiModel.addAttribute("oferta", oferta);
        //uiModel.addAttribute("demandante", demandante);
        populateEditForm(uiModel, new Inscripcion());
        return "inscripcions/create";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Inscripcion inscripcion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inscripcion);
            return "inscripcions/update";
        }
        uiModel.asMap().clear();
        inscripcion.merge();
        return "redirect:/inscripcions/" + encodeUrlPathSegment(inscripcion.getId().toString(), httpServletRequest);
    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Inscripcion inscripcion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, inscripcion);
            return "inscripcions/create";
        }
        uiModel.asMap().clear();
        Usuario usuario = getUsuarioSesion();
        Demandante demandante = Demandante.findDemandantesByUsername(usuario.getUsername()).getSingleResult();
        inscripcion.setDemandante(demandante);
        inscripcion.setInscripcion_estado(InscripcionEstado.Recibida);
        Date fechaHoy = (Calendar.getInstance()).getTime();
        inscripcion.setFecha(fechaHoy);
        inscripcion.persist();
        return "redirect:/inscripcions/" + encodeUrlPathSegment(inscripcion.getId().toString(), httpServletRequest);
    }
}
