package es.uca.iw.findyourjob.web;
import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.GestorEmpresa;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.reference.UsuarioRol;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;

@RequestMapping("/empresas")
@Controller
@RooWebScaffold(path = "empresas", formBackingObject = Empresa.class)
@GvNIXWebJQuery
public class EmpresaController {
	
    private Usuario getUsuarioSesion() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return Usuario.findUsuariosByUsername(username).getSingleResult();
    }
    private GestorEmpresa getGestorSesion() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return GestorEmpresa.findGestorEmpresasByUsername(username).getSingleResult();
    }
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Empresa empresa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, empresa);
            return "empresas/create";
        }
        uiModel.asMap().clear();
        if (empresa.isGestion_propia()) {
            empresa.setRol(UsuarioRol.GESTOR_EMPRESA);
            empresa.setEnabled(true);
        } else{
        	empresa.setEnabled(false);
        	GestorEmpresa gestor_ett = getGestorSesion();
        	gestor_ett.getEmpresasGestionadas().add(empresa);
        	empresa.setGestor(gestor_ett);
        } 
        empresa.persist();
        return "redirect:/empresas/" + encodeUrlPathSegment(empresa.getId().toString(), httpServletRequest);
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Empresa());
        return "empresas/create";
    }

    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("empresa", Empresa.findEmpresa(id));
        uiModel.addAttribute("itemId", id);
        return "empresas/show";
    }

    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
    	if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("empresas", Empresa.findEmpresaEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Empresa.countEmpresas() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("empresas", Empresa.findAllEmpresas(sortFieldName, sortOrder));
        }
        return "empresas/list";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Empresa empresa, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, empresa);
            return "empresas/update";
        }
        uiModel.asMap().clear();
        empresa.merge();
        return "redirect:/empresas/" + encodeUrlPathSegment(empresa.getId().toString(), httpServletRequest);
    }

    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Empresa.findEmpresa(id));
        return "empresas/update";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Empresa empresa = Empresa.findEmpresa(id);
        empresa.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/empresas";
    }

    void populateEditForm(Model uiModel, Empresa empresa) {
        uiModel.addAttribute("empresa", empresa);
        uiModel.addAttribute("ofertas", Oferta.findAllOfertas());
    }

    String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {
        }
        return pathSegment;
    }
}
