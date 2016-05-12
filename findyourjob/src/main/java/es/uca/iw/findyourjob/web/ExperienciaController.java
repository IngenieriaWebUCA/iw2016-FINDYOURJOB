package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Experiencia;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/experiencias")
@Controller
@RooWebScaffold(path = "experiencias", formBackingObject = Experiencia.class)
public class ExperienciaController {
}
