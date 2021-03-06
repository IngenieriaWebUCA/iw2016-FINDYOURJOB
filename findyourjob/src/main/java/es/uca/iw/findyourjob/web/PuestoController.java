package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Puesto;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/puestoes")
@Controller
@RooWebScaffold(path = "puestoes", formBackingObject = Puesto.class)
@GvNIXWebJQuery
@RooWebFinder
@GvNIXDatatables(ajax = true)
public class PuestoController {
}
