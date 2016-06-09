// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.GestorEmpresa;
import es.uca.iw.findyourjob.web.EmpresaController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect EmpresaController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByGestor", "form" }, method = RequestMethod.GET)
    public String EmpresaController.findEmpresasByGestorForm(Model uiModel) {
        uiModel.addAttribute("gestorempresas", GestorEmpresa.findAllGestorEmpresas());
        return "empresas/findEmpresasByGestor";
    }
    
    @RequestMapping(params = "find=ByGestor", method = RequestMethod.GET)
    public String EmpresaController.findEmpresasByGestor(@RequestParam("gestor") GestorEmpresa gestor, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("empresas", Empresa.findEmpresasByGestor(gestor, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Empresa.countFindEmpresasByGestor(gestor) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("empresas", Empresa.findEmpresasByGestor(gestor, sortFieldName, sortOrder).getResultList());
        }
        return "empresas/list";
    }
    
    @RequestMapping(params = { "find=ByUsuarioGestor", "form" }, method = RequestMethod.GET)
    public String EmpresaController.findEmpresasByUsuarioGestorForm(Model uiModel) {
        return "empresas/findEmpresasByUsuarioGestor";
    }
    
    @RequestMapping(params = "find=ByUsuarioGestor", method = RequestMethod.GET)
    public String EmpresaController.findEmpresasByUsuarioGestor(@RequestParam("usuarioGestor") String usuarioGestor, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("empresas", Empresa.findEmpresasByUsuarioGestor(usuarioGestor, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Empresa.countFindEmpresasByUsuarioGestor(usuarioGestor) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("empresas", Empresa.findEmpresasByUsuarioGestor(usuarioGestor, sortFieldName, sortOrder).getResultList());
        }
        return "empresas/list";
    }
    
}