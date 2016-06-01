package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Formacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RequestMapping("/formacions")
@Controller
@RooWebScaffold(path = "formacions", formBackingObject = Formacion.class)
@GvNIXWebJQuery
@RooWebFinder
public class FormacionController {
}
