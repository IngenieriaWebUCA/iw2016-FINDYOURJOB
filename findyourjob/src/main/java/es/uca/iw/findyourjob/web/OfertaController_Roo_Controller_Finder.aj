// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.web.OfertaController;
import es.uca.iw.reference.OfertaEstado;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect OfertaController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByEstado", "form" }, method = RequestMethod.GET)
    public String OfertaController.findOfertasByEstadoForm(Model uiModel) {
        uiModel.addAttribute("ofertaestadoes", java.util.Arrays.asList(OfertaEstado.class.getEnumConstants()));
        return "ofertas/findOfertasByEstado";
    }
    
    @RequestMapping(params = "find=ByEstado", method = RequestMethod.GET)
    public String OfertaController.findOfertasByEstado(@RequestParam("estado") OfertaEstado estado, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertasByEstado(estado, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Oferta.countFindOfertasByEstado(estado) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findOfertasByEstado(estado, sortFieldName, sortOrder).getResultList());
        }
        addDateTimeFormatPatterns(uiModel);
        return "ofertas/list";
    }
    
}
