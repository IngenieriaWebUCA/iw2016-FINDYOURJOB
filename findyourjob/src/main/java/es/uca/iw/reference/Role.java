package es.uca.iw.reference;
import org.gvnix.addon.datatables.annotations.GvNIXDatatables;
import org.gvnix.addon.web.mvc.annotations.jquery.GvNIXWebJQuery;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.gvnix.addon.loupefield.annotations.GvNIXLoupeController;

@Controller
@RooWebScaffold(formBackingObject = Role.class, path = "roles")
@GvNIXWebJQuery
@RooWebFinder
@GvNIXDatatables(ajax = true)
@GvNIXLoupeController
public enum Role {

    ADMINISTRADOR, DEMANDANTE, GESTOR_EMPRESA, GESTOR_ETT
}
