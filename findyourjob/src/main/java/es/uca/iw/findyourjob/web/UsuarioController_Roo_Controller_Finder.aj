// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.findyourjob.web.UsuarioController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect UsuarioController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByUsername", "form" }, method = RequestMethod.GET)
    public String UsuarioController.findUsuariosByUsernameForm(Model uiModel) {
        return "usuarios/findUsuariosByUsername";
    }
    
    @RequestMapping(params = "find=ByUsername", method = RequestMethod.GET)
    public String UsuarioController.findUsuariosByUsername(@RequestParam("username") String username, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("usuarios", Usuario.findUsuariosByUsername(username, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Usuario.countFindUsuariosByUsername(username) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("usuarios", Usuario.findUsuariosByUsername(username, sortFieldName, sortOrder).getResultList());
        }
        return "usuarios/list";
    }
    
}
