// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Usuario;
import es.uca.iw.findyourjob.web.UsuarioController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

privileged aspect UsuarioController_Roo_Controller {
    
    @RequestMapping(params = "form", produces = "text/html")
    public String UsuarioController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Usuario());
        return "usuarios/create";
    }
    
}
