package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.reference.OfertaEstado;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
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
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/ofertas")
@Controller
@RooWebScaffold(path = "ofertas", formBackingObject = Oferta.class)
@GvNIXWebJQuery
@RooWebFinder
public class OfertaController {

    @RequestMapping(params = "find=candidatos", method = RequestMethod.GET)
    public String buscarCandidatos() {
        return "hola";
    }

    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Oferta.countOfertas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findAllOfertas(sortFieldName, sortOrder));
        }
        return "ofertas/list";
    }

    /*@RequestMapping(produces = "text/html")
     public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
     Usuario user = (Usuario)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
     System.out.println ("El usuario se llama" + user.getUsername());
     if(user == null || user.getRol()=="DEMANDANTE"){
     if(page != null || size != null){
     int sizeNo = size == null ? 10 : size.intValue();
     final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
     uiModel.addAttribute("ofertas", Oferta.findOfertasByEstado("Activa", sortFieldName, sortOrder));
     float nrOfPages = (float) Oferta.countOfertas() / sizeNo;
     uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
     }else {
     uiModel.addAttribute("ofertas", Oferta.findAllOfertas(sortFieldName, sortOrder));
     }
     }else if (page != null || size != null) {
     int sizeNo = size == null ? 10 : size.intValue();
     final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
     uiModel.addAttribute("ofertas", Oferta.findOfertaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
     float nrOfPages = (float) Oferta.countOfertas() / sizeNo;
     uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
     } else {
     uiModel.addAttribute("ofertas", Oferta.findAllOfertas(sortFieldName, sortOrder));
     }
     return "ofertas/list";
     }*/
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Oferta oferta, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, oferta);
            return "ofertas/create";
        }
        uiModel.asMap().clear();
        Date fechaHoy = (Calendar.getInstance()).getTime(); //style="M-"
        if (fechaHoy.compareTo(oferta.getFechaDisponibleInicio()) < 0) oferta.setOferta_estado(OfertaEstado.En_Espera);
        if (fechaHoy.compareTo(oferta.getFechaDisponibleInicio()) >= 0 && fechaHoy.compareTo(oferta.getFechaDisponibleFin()) <= 0) oferta.setOferta_estado(OfertaEstado.Activa);
        if (fechaHoy.compareTo(oferta.getFechaDisponibleFin()) > 0) oferta.setOferta_estado(OfertaEstado.Detenida);
        oferta.persist();
        return "redirect:/ofertas/" + encodeUrlPathSegment(oferta.getId().toString(), httpServletRequest);
    }
}
