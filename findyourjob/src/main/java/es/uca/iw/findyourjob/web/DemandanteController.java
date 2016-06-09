package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.domain.Experiencia;
import es.uca.iw.findyourjob.domain.Inscripcion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.reference.Role;
import es.uca.iw.findyourjob.domain.Usuario;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/demandantes")
@Controller
@RooWebScaffold(path = "demandantes", formBackingObject = Demandante.class)
@GvNIXWebJQuery
@GvNIXDatatables(ajax = true)
@RooWebFinder
public class DemandanteController {

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Demandante demandante, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, demandante);
            return "demandantes/create";
        }
        uiModel.asMap().clear();
        demandante.setRol(Role.DEMANDANTE);
        demandante.setEnabled(true);
        demandante.persist();
        return "redirect:/login";
    }

    @RequestMapping(value = "/inscritos/{id}", produces = "text/html")
    public String inscritos(@PathVariable("id") Long id, Model uiModel) {
        // Lista los usuarios interesados en la oferta {id}
        List<Inscripcion> inscripciones = Inscripcion.findInscripcionsByOferta(Oferta.findOferta(id)).getResultList();
        System.out.println("!!!!!!!oferta id!!!!!!!!!" + id);
        if (inscripciones.isEmpty()) System.out.println("!!!!!!!No hay inscripciones para la oferta!!!!!!!!!"); else System.out.println("!!!!!!!Si hay inscripciones para la oferta!!!!!!!!!");
        ArrayList<Demandante> us_inscritos = new ArrayList<Demandante>();
        for (Inscripcion i : inscripciones) {
            us_inscritos.add(i.getDemandante());
            System.out.println("!!!Usuario incrito: " + i.getDemandante().getUsername());
        }
        uiModel.addAttribute("demandantes", us_inscritos);
        //addDateTimeFormatPatterns(uiModel);
        return "demandantes/list";
    }

    @RequestMapping(value = "/buscarcandidatos/{id}", produces = "text/html")
    public String buscarcandidatos(@PathVariable("id") Long id, Model uiModel) {
        List<Curriculum> cvs = Curriculum.findAllCurriculums();
        ArrayList<Demandante> demandantes_candidatos = new ArrayList<Demandante>();
        for (Curriculum cv : cvs) {
            Set<Experiencia> experiencias = cv.getExperiencias();
            if (experiencias.contains(Oferta.findOferta(id).getPuestoTrabajo())) demandantes_candidatos.add(cv.getDemandante());
        }
        uiModel.addAttribute("demandantes", demandantes_candidatos);
        //addDateTimeFormatPatterns(uiModel);
        return "demandantes/list";
    }
}
