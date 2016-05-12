package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Localizacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/localizacions")
@Controller
@RooWebScaffold(path = "localizacions", formBackingObject = Localizacion.class)
public class LocalizacionController {
}
