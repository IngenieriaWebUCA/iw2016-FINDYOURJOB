package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Oferta;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/ofertas")
@Controller
@RooWebScaffold(path = "ofertas", formBackingObject = Oferta.class)
@GvNIXWebJQuery
public class OfertaController {
	@RequestMapping(params = "find=candidatos", method = RequestMethod.GET)
	public String buscarCandidatos(){

		
		return "hola";
	}
}
