package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Curriculum;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/curriculums")
@Controller
@RooWebScaffold(path = "curriculums", formBackingObject = Curriculum.class)
public class CurriculumController {
}
