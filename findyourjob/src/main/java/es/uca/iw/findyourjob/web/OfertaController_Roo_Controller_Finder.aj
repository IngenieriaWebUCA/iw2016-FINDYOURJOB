// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import es.uca.iw.findyourjob.domain.Empresa;
import es.uca.iw.findyourjob.domain.Localizacion;
import es.uca.iw.findyourjob.domain.Oferta;
import es.uca.iw.findyourjob.domain.Puesto;
import es.uca.iw.findyourjob.web.OfertaController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

privileged aspect OfertaController_Roo_Controller_Finder {
    
    @RequestMapping(params = { "find=ByEmpresa", "form" }, method = RequestMethod.GET)
    public String OfertaController.findOfertasByEmpresaForm(Model uiModel) {
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        return "ofertas/findOfertasByEmpresa";
    }
    
    @RequestMapping(params = "find=ByEmpresa", method = RequestMethod.GET)
    public String OfertaController.findOfertasByEmpresa(@RequestParam("empresa") Empresa empresa, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertasByEmpresa(empresa, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Oferta.countFindOfertasByEmpresa(empresa) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findOfertasByEmpresa(empresa, sortFieldName, sortOrder).getResultList());
        }
        return "ofertas/list";
    }
    
    @RequestMapping(params = { "find=ByPerfil", "form" }, method = RequestMethod.GET)
    public String OfertaController.findOfertasByPerfilForm(Model uiModel) {
        return "ofertas/findOfertasByPerfil";
    }
    
    @RequestMapping(params = "find=ByPerfil", method = RequestMethod.GET)
    public String OfertaController.findOfertasByPerfil(@RequestParam("perfil") String perfil, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertasByPerfil(perfil, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Oferta.countFindOfertasByPerfil(perfil) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findOfertasByPerfil(perfil, sortFieldName, sortOrder).getResultList());
        }
        return "ofertas/list";
    }
    
    @RequestMapping(params = { "find=ByPuestoTrabajo", "form" }, method = RequestMethod.GET)
    public String OfertaController.findOfertasByPuestoTrabajoForm(Model uiModel) {
        uiModel.addAttribute("puestoes", Puesto.findAllPuestoes());
        return "ofertas/findOfertasByPuestoTrabajo";
    }
    
    @RequestMapping(params = "find=ByPuestoTrabajo", method = RequestMethod.GET)
    public String OfertaController.findOfertasByPuestoTrabajo(@RequestParam("puestoTrabajo") Puesto puestoTrabajo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertasByPuestoTrabajo(puestoTrabajo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Oferta.countFindOfertasByPuestoTrabajo(puestoTrabajo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findOfertasByPuestoTrabajo(puestoTrabajo, sortFieldName, sortOrder).getResultList());
        }
        return "ofertas/list";
    }
    
    @RequestMapping(params = { "find=ByTipologiaAndSueldoBrutoAndVacantes", "form" }, method = RequestMethod.GET)
    public String OfertaController.findOfertasByTipologiaAndSueldoBrutoAndVacantesForm(Model uiModel) {
        return "ofertas/findOfertasByTipologiaAndSueldoBrutoAndVacantes";
    }
    
    @RequestMapping(params = "find=ByTipologiaAndSueldoBrutoAndVacantes", method = RequestMethod.GET)
    public String OfertaController.findOfertasByTipologiaAndSueldoBrutoAndVacantes(@RequestParam("tipologia") String tipologia, @RequestParam("sueldoBruto") Float sueldoBruto, @RequestParam("vacantes") String vacantes, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertasByTipologiaAndSueldoBrutoAndVacantes(tipologia, sueldoBruto, vacantes, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Oferta.countFindOfertasByTipologiaAndSueldoBrutoAndVacantes(tipologia, sueldoBruto, vacantes) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findOfertasByTipologiaAndSueldoBrutoAndVacantes(tipologia, sueldoBruto, vacantes, sortFieldName, sortOrder).getResultList());
        }
        return "ofertas/list";
    }
    
    @RequestMapping(params = { "find=ByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstado", "form" }, method = RequestMethod.GET)
    public String OfertaController.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoForm(Model uiModel) {
        return "ofertas/findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstado";
    }
    
    @RequestMapping(params = "find=ByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstado", method = RequestMethod.GET)
    public String OfertaController.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstado(@RequestParam("tipologia") String tipologia, @RequestParam("sueldoBruto") Float sueldoBruto, @RequestParam("vacantes") String vacantes, @RequestParam("perfil") String perfil, @RequestParam("fechaInicioActividad") String fechaInicioActividad, @RequestParam("fechaDisponibleInicio") String fechaDisponibleInicio, @RequestParam("estado") String estado, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstado(tipologia, sueldoBruto, vacantes, perfil, fechaInicioActividad, fechaDisponibleInicio, estado, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Oferta.countFindOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstado(tipologia, sueldoBruto, vacantes, perfil, fechaInicioActividad, fechaDisponibleInicio, estado) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstado(tipologia, sueldoBruto, vacantes, perfil, fechaInicioActividad, fechaDisponibleInicio, estado, sortFieldName, sortOrder).getResultList());
        }
        return "ofertas/list";
    }
    
    @RequestMapping(params = { "find=ByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajo", "form" }, method = RequestMethod.GET)
    public String OfertaController.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajoForm(Model uiModel) {
        uiModel.addAttribute("localizacions", Localizacion.findAllLocalizacions());
        uiModel.addAttribute("empresas", Empresa.findAllEmpresas());
        uiModel.addAttribute("puestoes", Puesto.findAllPuestoes());
        return "ofertas/findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajo";
    }
    
    @RequestMapping(params = "find=ByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajo", method = RequestMethod.GET)
    public String OfertaController.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajo(@RequestParam("tipologia") String tipologia, @RequestParam("sueldoBruto") Float sueldoBruto, @RequestParam("vacantes") String vacantes, @RequestParam("perfil") String perfil, @RequestParam("fechaInicioActividad") String fechaInicioActividad, @RequestParam("fechaDisponibleInicio") String fechaDisponibleInicio, @RequestParam("estado") String estado, @RequestParam("localizacion") Localizacion localizacion, @RequestParam("empresa") Empresa empresa, @RequestParam("puestoTrabajo") Puesto puestoTrabajo, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("ofertas", Oferta.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajo(tipologia, sueldoBruto, vacantes, perfil, fechaInicioActividad, fechaDisponibleInicio, estado, localizacion, empresa, puestoTrabajo, sortFieldName, sortOrder).setFirstResult(firstResult).setMaxResults(sizeNo).getResultList());
            float nrOfPages = (float) Oferta.countFindOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajo(tipologia, sueldoBruto, vacantes, perfil, fechaInicioActividad, fechaDisponibleInicio, estado, localizacion, empresa, puestoTrabajo) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("ofertas", Oferta.findOfertasByTipologiaAndSueldoBrutoAndVacantesAndPerfilAndFechaInicioActividadAndFechaDisponibleInicioAndEstadoAndLocalizacionAndEmpresaAndPuestoTrabajo(tipologia, sueldoBruto, vacantes, perfil, fechaInicioActividad, fechaDisponibleInicio, estado, localizacion, empresa, puestoTrabajo, sortFieldName, sortOrder).getResultList());
        }
        return "ofertas/list";
    }
    
}