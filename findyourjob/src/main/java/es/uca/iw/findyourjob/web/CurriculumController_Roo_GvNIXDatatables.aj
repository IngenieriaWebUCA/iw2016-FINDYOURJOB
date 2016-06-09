// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package es.uca.iw.findyourjob.web;

import com.github.dandelion.datatables.core.ajax.DataSet;
import com.github.dandelion.datatables.core.ajax.DatatablesCriterias;
import com.github.dandelion.datatables.core.ajax.DatatablesResponse;
import com.github.dandelion.datatables.core.exception.ExportException;
import com.github.dandelion.datatables.core.export.CsvExport;
import com.github.dandelion.datatables.core.export.DatatablesExport;
import com.github.dandelion.datatables.core.export.ExportConf;
import com.github.dandelion.datatables.core.export.ExportType;
import com.github.dandelion.datatables.core.export.ExportUtils;
import com.github.dandelion.datatables.core.export.XmlExport;
import com.github.dandelion.datatables.core.html.HtmlTable;
import com.github.dandelion.datatables.extras.export.itext.PdfExport;
import com.github.dandelion.datatables.extras.export.poi.XlsExport;
import com.github.dandelion.datatables.extras.export.poi.XlsxExport;
import com.github.dandelion.datatables.extras.spring3.ajax.DatatablesParams;
import com.mysema.query.BooleanBuilder;
import com.mysema.query.types.path.PathBuilder;
import es.uca.iw.findyourjob.domain.Curriculum;
import es.uca.iw.findyourjob.domain.Demandante;
import es.uca.iw.findyourjob.web.CurriculumController;
import es.uca.iw.findyourjob.web.CurriculumController_Roo_Controller;
import es.uca.iw.findyourjob.web.CurriculumController_Roo_GvNIXDatatables;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.gvnix.web.datatables.query.SearchResults;
import org.gvnix.web.datatables.util.DatatablesUtilsBean;
import org.gvnix.web.datatables.util.EntityManagerProvider;
import org.gvnix.web.datatables.util.QuerydslUtilsBean;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

privileged aspect CurriculumController_Roo_GvNIXDatatables {
    
    declare precedence: CurriculumController_Roo_GvNIXDatatables, CurriculumController_Roo_Controller;
    
    @Autowired
    public ConversionService CurriculumController.conversionService_dtt;
    
    @Autowired
    public MessageSource CurriculumController.messageSource_dtt;
    
    public BeanWrapper CurriculumController.beanWrapper_dtt;
    
    @Autowired
    private EntityManagerProvider CurriculumController.entityManagerProvider_dtt;
    
    @Autowired
    public DatatablesUtilsBean CurriculumController.datatablesUtilsBean_dtt;
    
    @Autowired
    public QuerydslUtilsBean CurriculumController.querydslUtilsBean_dtt;
    
    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public String CurriculumController.listDatatables(Model uiModel, HttpServletRequest request) {
        Map<String, String> params = populateParametersMap(request);
        // Get parentId information for details render
        String parentId = params.remove("_dt_parentId");
        if (StringUtils.isNotBlank(parentId)) {
            uiModel.addAttribute("parentId", parentId);
        }
        String parentTableHashId = params.remove("dtt_parent_table_id_hash");
        if (StringUtils.isNotBlank(parentTableHashId)) {
            uiModel.addAttribute("dtt_parent_table_id_hash", parentTableHashId);
        }
        String tableHashId = params.remove("dtt_table_id_hash");
        if (StringUtils.isNotBlank(tableHashId) && !uiModel.containsAttribute("dtt_table_id_hash")) {
            uiModel.addAttribute("dtt_table_id_hash", tableHashId);
        }
        String rowOnTopIds = params.remove("dtt_row_on_top_ids");
        if (StringUtils.isNotBlank(rowOnTopIds)) {
            uiModel.addAttribute("dtt_row_on_top_ids", rowOnTopIds);
        }
        if (!params.isEmpty()) {
            uiModel.addAttribute("baseFilter", params);
        }
        return "curriculums/list";
    }
    
    @ModelAttribute
    public void CurriculumController.populateDatatablesConfig(Model uiModel) {
        uiModel.addAttribute("datatablesHasBatchSupport", false);
        uiModel.addAttribute("datatablesUseAjax",true);
        uiModel.addAttribute("datatablesInlineEditing",false);
        uiModel.addAttribute("datatablesInlineCreating",false);
        uiModel.addAttribute("datatablesSecurityApplied",true);
        uiModel.addAttribute("datatablesStandardMode",true);
        uiModel.addAttribute("finderNameParam","ajax_find");
    }
    
    public Map<String, String> CurriculumController.populateParametersMap(HttpServletRequest request) {
        Map<String, Object> params;
        if (request == null) {
            params = Collections.emptyMap();
        } else {
            params = new HashMap<String, Object>(request.getParameterMap());
        }
        
        Map<String, String> allParams = new HashMap<String, String>(params.size());
        
        String value;
        Object objValue;
        for (String key : params.keySet()) {
            objValue = params.get(key);
            if (objValue instanceof String[]) {
                value = ((String[]) objValue)[0];
            } else {
                value = (String) objValue;
            }
            allParams.put(key, value);
        }
        return allParams;
    }
    
    public Map<String, Object> CurriculumController.getPropertyMap(Curriculum Curriculum, Enumeration<Map<String, String>> propertyNames) {
        Map<String, Object> propertyValuesMap = new HashMap<String, Object>();
        
        // If no entity or properties given, return empty Map
        if(Curriculum == null || propertyNames == null) {
            return propertyValuesMap;
        }
        
        List<String> properties = new ArrayList<String>();
        CollectionUtils.addAll(properties, propertyNames);
        
        // There must be at least one property name, otherwise return empty Map
        if (properties.isEmpty()) {
            return propertyValuesMap;
        }
        
        // Iterate over given properties to get each property value
        BeanWrapper entityBean = new BeanWrapperImpl(Curriculum);
        for (String propertyName : properties) {
            if (entityBean.isReadableProperty(propertyName)) {
                Object propertyValue = null;
                try {
                    propertyValue = entityBean.getPropertyValue(propertyName);
                } catch (Exception e){
                    // TODO log warning
                    continue;
                }
                propertyValuesMap.put(propertyName, propertyValue);
            }
        }
        return propertyValuesMap;
    }
    
    public Map<String, Object> CurriculumController.getPropertyMap(Curriculum Curriculum, HttpServletRequest request) {
        // URL parameters are used as base search filters
        @SuppressWarnings("unchecked") Map<String, Object> propertyValuesMap = getPropertyMap(Curriculum, request.getParameterNames());
        // Add to the property map the parameters used as query operators
        Map<String, Object> params = new HashMap<String, Object>(populateParametersMap(request));
        Set<String> keySet = params.keySet();
        for (String key : keySet) {
            if (datatablesUtilsBean_dtt.isSpecialFilterParameters(key)) {
                propertyValuesMap.put(key, params.get(key));
            }
        }
        return propertyValuesMap;
    }
    
    public void CurriculumController.setDatatablesBaseFilter(Map<String, Object> propertyMap) {
        // Add here your baseFilters to propertyMap.
    }
    
    @ResponseBody
    @RequestMapping(headers = "Accept=application/json", params = "getColumnType")
    public String CurriculumController.getColumnType(Model uiModel, HttpServletRequest request, @RequestParam(value = "_columnName_", required = false) String columnName) {
        // Getting all declared fields
        boolean fieldExists = false;
        Field attr = null;
        for(Field field : Curriculum.class.getDeclaredFields()){
            if(field.getName().equals(columnName)){
                attr = field;
                fieldExists = true;
                break;
            }
        }
        // If current field not exists on entity, find on superclass
        if(!fieldExists){
            if(Curriculum.class.getSuperclass() != null){
                for(Field field : Curriculum.class.getSuperclass().getDeclaredFields()){
                    if(field.getName().equals(columnName)){
                        attr = field;
                        fieldExists = true;
                        break;
                    }
                }
            }
        }
        if(fieldExists){
            // Getting field type
            Object fieldType = null;
            if (attr != null) {
                fieldType = attr.getType();
                String type = fieldType.toString();
                // Returning value based on type
                if ("String".equals(type)){
                    return "{\"columnType\": \"string\"}";
                } else if ("float".equals(type) || type.contains("Float")){
                    return "{\"columnType\": \"number\"}";
                } else if ("short".equals(type) || type.contains("Short")){
                    return "{\"columnType\": \"number\"}";
                } else if ("long".equals(type) || type.contains("Long")){
                    return "{\"columnType\": \"number\"}";
                } else if ("double".equals(type) || type.contains("Double")){
                    return "{\"columnType\": \"number\"}";
                } else if ("int".equals(type) || type.contains("Integer")){
                    return "{\"columnType\": \"number\"}";
                } else if ("Date".equals(type)){
                    return "{\"columnType\": \"date\"}";
                } else if ("boolean".equals(type) || type.contains("Boolean")){
                    return "{\"columnType\": \"boolean\"}";
                } else {
                    // Returning by default
                    return "{\"columnType\": \"undefined\"}";
                }
            }
        }
        // Returning by default
        return "{\"columnType\": \"undefined\"}";
    }
    
    @ResponseBody
    @RequestMapping(headers = "Accept=application/json", params = "geti18nText")
    public String CurriculumController.geti18nText(Model uiModel, HttpServletRequest request, @RequestParam(value = "_locale_", required = false) String locale) {
        // Getting current locale
        Locale defaultLocale = new Locale(locale);
        // Building JSON response
        StringBuilder json = new StringBuilder();
        json.append("{");
        json.append("\"all_isnull\": \"" + messageSource_dtt.getMessage("global.filters.operations.all.isnull", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"all_notnull\": \"" + messageSource_dtt.getMessage("global.filters.operations.all.notnull", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"boolean_false\": \"" + messageSource_dtt.getMessage("global.filters.operations.boolean.false", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"boolean_true\": \"" + messageSource_dtt.getMessage("global.filters.operations.boolean.true", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"date_between\": \"" + messageSource_dtt.getMessage("global.filters.operations.date.between", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"date_date\": \"" + messageSource_dtt.getMessage("global.filters.operations.date.date", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"date_day\": \"" + messageSource_dtt.getMessage("global.filters.operations.date.day", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"date_month\": \"" + messageSource_dtt.getMessage("global.filters.operations.date.month", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"date_year\": \"" + messageSource_dtt.getMessage("global.filters.operations.date.year", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"number_between\": \"" + messageSource_dtt.getMessage("global.filters.operations.number.between", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"string_contains\": \"" + messageSource_dtt.getMessage("global.filters.operations.string.contains", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"string_ends\": \"" + messageSource_dtt.getMessage("global.filters.operations.string.ends", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"string_isempty\": \"" + messageSource_dtt.getMessage("global.filters.operations.string.isempty", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"string_isnotempty\": \"" + messageSource_dtt.getMessage("global.filters.operations.string.isnotempty", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"string_starts\": \"" + messageSource_dtt.getMessage("global.filters.operations.string.starts", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"button_find\": \"" + messageSource_dtt.getMessage("button_find", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_all_isnull\": \"" + messageSource_dtt.getMessage("help.all.isnull", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_all_notnull\": \"" + messageSource_dtt.getMessage("help.all.notnull", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_boolean_false\": \"" + messageSource_dtt.getMessage("help.boolean.false", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_boolean_true\": \"" + messageSource_dtt.getMessage("help.boolean.true", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_date_between\": \"" + messageSource_dtt.getMessage("help.date.between", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_date_date\": \"" + messageSource_dtt.getMessage("help.date.date", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_date_day\": \"" + messageSource_dtt.getMessage("help.date.day", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_date_month\": \"" + messageSource_dtt.getMessage("help.date.month", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_date_year\": \"" + messageSource_dtt.getMessage("help.date.year", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_number_between\": \"" + messageSource_dtt.getMessage("help.number.between", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_number_eq\": \"" + messageSource_dtt.getMessage("help.number.eq", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_number_neq\": \"" + messageSource_dtt.getMessage("help.number.neq", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_number_gt\": \"" + messageSource_dtt.getMessage("help.number.gt", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_number_lt\": \"" + messageSource_dtt.getMessage("help.number.lt", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_number_goe\": \"" + messageSource_dtt.getMessage("help.number.goe", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_number_loe\": \"" + messageSource_dtt.getMessage("help.number.loe", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_string_contains\": \"" + messageSource_dtt.getMessage("help.string.contains", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_string_ends\": \"" + messageSource_dtt.getMessage("help.string.ends", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_string_isempty\": \"" + messageSource_dtt.getMessage("help.string.isempty", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_string_isnotempty\": \"" + messageSource_dtt.getMessage("help.string.isnotempty", null, defaultLocale) + "\"");
        json.append(",");
        json.append("\"help_string_starts\": \"" + messageSource_dtt.getMessage("help.string.starts", null, defaultLocale) + "\"");
        json.append("}");
        // return JSON with locale strings
        return json.toString();
    }
    
    /**
     * Show only the list view fragment for entity as detail datatables into a master datatables.
     */
    @RequestMapping(produces = "text/html", value = "/list")
    public String CurriculumController.listDatatablesDetail(Model uiModel, HttpServletRequest request, @ModelAttribute Curriculum curriculum) {
        // Do common datatables operations: get entity list filtered by request parameters
        listDatatables(uiModel, request);
        // Show only the list fragment (without footer, header, menu, etc.) 
        return "forward:/WEB-INF/views/curriculums/list.jspx";
    }
    
    /**
     * Create an entity and redirect to given URL.
     */
    @RequestMapping(produces = "text/html", method = RequestMethod.POST, params = "datatablesRedirect")
    public String CurriculumController.createDatatablesDetail(@RequestParam(value = "datatablesRedirect", required = true) String redirect, @Valid Curriculum curriculum, BindingResult bindingResult, Model uiModel, RedirectAttributes redirectModel, HttpServletRequest httpServletRequest) {
        // Do common create operations (check errors, populate, persist, ...)
        String view = create(curriculum, bindingResult, uiModel, httpServletRequest);
        // If binding errors or no redirect, return common create error view (remain in create form)
        if (bindingResult.hasErrors() || redirect == null || redirect.trim().isEmpty()) {
            return view;
        }
        String[] paramValues = httpServletRequest.getParameterValues("dtt_table_id_hash");
        if(paramValues != null && paramValues.length > 0) {
            redirectModel.addFlashAttribute("dtt_table_id_hash", paramValues[0]);
        }else{
            redirectModel.addFlashAttribute("dtt_table_id_hash", "");
        }
        redirectModel.addFlashAttribute(DatatablesUtilsBean.ROWS_ON_TOP_IDS_PARAM, curriculum.getId());
        // If create success, redirect to given URL: master datatables
        return "redirect:".concat(redirect);
    }
    
    /**
     * Update an entity and redirect to given URL.
     */
    @RequestMapping(produces = "text/html", method = RequestMethod.PUT, params = "datatablesRedirect")
    public String CurriculumController.updateDatatablesDetail(@RequestParam(value = "datatablesRedirect", required = true) String redirect, @Valid Curriculum curriculum, BindingResult bindingResult, Model uiModel, RedirectAttributes redirectModel, HttpServletRequest httpServletRequest) {
        // Do common update operations (check errors, populate, merge, ...)
        String view = update(curriculum, bindingResult, uiModel, httpServletRequest);
        // If binding errors or no redirect, return common update error view (remain in update form)
        if (bindingResult.hasErrors() || redirect == null || redirect.trim().isEmpty()) {
            return view;
        }
        String[] paramValues = httpServletRequest.getParameterValues("dtt_table_id_hash");
        if(paramValues != null && paramValues.length > 0) {
            redirectModel.addFlashAttribute("dtt_table_id_hash", paramValues[0]);
        }else{
            redirectModel.addFlashAttribute("dtt_table_id_hash", "");
        }
        redirectModel.addFlashAttribute(DatatablesUtilsBean.ROWS_ON_TOP_IDS_PARAM, curriculum.getId());
        // If update success, redirect to given URL: master datatables
        return "redirect:".concat(redirect);
    }
    
    /**
     * Delete an entity and redirect to given URL.
     */
    @RequestMapping(produces = "text/html", method = RequestMethod.DELETE, params = "datatablesRedirect", value = "/{id}")
    public String CurriculumController.deleteDatatablesDetail(@RequestParam(value = "datatablesRedirect", required = true) String redirect, @PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        // Do common delete operations (find, remove, add pagination attributes, ...)
        String view = delete(id, page, size, uiModel);
        // If no redirect, return common list view
        if (redirect == null || redirect.trim().isEmpty()) {
            return view;
        }
        // Redirect to given URL: master datatables
        return "redirect:".concat(redirect);
    }
    
    @RequestMapping(headers = "Accept=application/json", value = "/datatables/ajax", produces = "application/json")
    @ResponseBody
    public DatatablesResponse<Map<String, String>> CurriculumController.findAllCurriculums(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Curriculum curriculum, HttpServletRequest request) {
        // URL parameters are used as base search filters
        Map<String, Object> baseSearchValuesMap = getPropertyMap(curriculum, request);
        setDatatablesBaseFilter(baseSearchValuesMap);
        SearchResults<Curriculum> searchResult = datatablesUtilsBean_dtt.findByCriteria(Curriculum.class, criterias, baseSearchValuesMap);
        
        // Get datatables required counts
        long totalRecords = searchResult.getTotalCount();
        long recordsFound = searchResult.getResultsCount();
        
        // Entity pk field name
        String pkFieldName = "id";
        
        DataSet<Map<String, String>> dataSet = datatablesUtilsBean_dtt.populateDataSet(searchResult.getResults(), pkFieldName, totalRecords, recordsFound, criterias.getColumnDefs(), null); 
        return DatatablesResponse.build(dataSet,criterias);
    }
    
    @RequestMapping(headers = "Accept=application/json", params = "checkFilters")
    @ResponseBody
    public ResponseEntity<String> CurriculumController.checkFilterExpressions(WebRequest request, @RequestParam(value = "property", required = false) String property, @RequestParam(value = "expression", required = false) String expression) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if(beanWrapper_dtt == null){
            beanWrapper_dtt = new BeanWrapperImpl(Curriculum.class);
        }
        Class type = beanWrapper_dtt.getPropertyType(property);
        boolean response = datatablesUtilsBean_dtt.checkFilterExpressions(type,expression);
        return new ResponseEntity<String>(String.format("{ \"response\": %s, \"property\": \"%s\"}",response, property), headers, org.springframework.http.HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json", value = "/datatables/ajax", params = "ajax_find=ByDemandante", produces = "application/json")
    @ResponseBody
    public DatatablesResponse<Map<String, String>> CurriculumController.findCurriculumsByDemandante(@DatatablesParams DatatablesCriterias criterias, @RequestParam("demandante") Demandante demandante) {
        BooleanBuilder baseSearch = new BooleanBuilder();
        
        // Base Search. Using BooleanBuilder, a cascading builder for
        // Predicate expressions
        PathBuilder<Curriculum> entity = new PathBuilder<Curriculum>(Curriculum.class, "entity");
        
        if(demandante != null){
            baseSearch.and(entity.get("demandante").eq(demandante));
        }else{
            baseSearch.and(entity.get("demandante").isNull());
        }
        
        SearchResults<Curriculum> searchResult = datatablesUtilsBean_dtt.findByCriteria(entity, criterias, baseSearch);
        
        // Get datatables required counts
        long totalRecords = searchResult.getTotalCount();
        long recordsFound = searchResult.getResultsCount();
        
        // Entity pk field name
        String pkFieldName = "id";
        
        DataSet<Map<String, String>> dataSet = datatablesUtilsBean_dtt.populateDataSet(searchResult.getResults(), pkFieldName, totalRecords, recordsFound, criterias.getColumnDefs(), null); 
        return DatatablesResponse.build(dataSet,criterias);
    }
    
    @RequestMapping(value = "/exportcsv", produces = "text/csv")
    public void CurriculumController.exportCsv(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Curriculum curriculum, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, curriculum, ExportType.CSV, new CsvExport(), request, response);
    }
    
    @RequestMapping(value = "/exportpdf", produces = "text/pdf")
    public void CurriculumController.exportPdf(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Curriculum curriculum, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, curriculum, ExportType.PDF, new PdfExport(), request, response);
    }
    
    @RequestMapping(value = "/exportxls", produces = "text/xls")
    public void CurriculumController.exportXls(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Curriculum curriculum, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, curriculum, ExportType.XLS, new XlsExport(), request, response);
    }
    
    @RequestMapping(value = "/exportxlsx", produces = "text/xlsx")
    public void CurriculumController.exportXlsx(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Curriculum curriculum, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, curriculum, ExportType.XLSX, new XlsxExport(), request, response);
    }
    
    @RequestMapping(value = "/exportxml", produces = "text/xml")
    public void CurriculumController.exportXml(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Curriculum curriculum, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, curriculum, ExportType.XML, new XmlExport(), request, response);
    }
    
    public void CurriculumController.export(DatatablesCriterias criterias, Curriculum curriculum, ExportType exportType, DatatablesExport datatablesExport, HttpServletRequest request, HttpServletResponse response) throws ExportException {
        // Does the export process as is explained in http://dandelion.github.io/datatables/tutorials/export/controller-based-exports.html
        // 1. Retrieve the data
        List<Map<String, String>> data = retrieveData(criterias, curriculum, request);
        // 2. Build an instance of "ExportConf"
        ExportConf exportConf = new ExportConf.Builder(exportType).header(true).exportClass(datatablesExport).autoSize(true).fileName(curriculum.getClass().getSimpleName()).build();
        // 3. Build an instance of "HtmlTable"
        HtmlTable table = datatablesUtilsBean_dtt.makeHtmlTable(data, criterias, exportConf, request);
        // 4. Render the generated export file
        ExportUtils.renderExport(table, exportConf, response);
    }
    
    private List<Map<String, String>> CurriculumController.retrieveData(DatatablesCriterias criterias, Curriculum Curriculum, HttpServletRequest request) {
        // Cloned criteria in order to not paginate the results
        DatatablesCriterias noPaginationCriteria = new DatatablesCriterias(criterias.getSearch(), 0, null, criterias.getColumnDefs(), criterias.getSortingColumnDefs(), criterias.getInternalCounter());
        // Do the search to obtain the data
        Map<String, Object> baseSearchValuesMap = getPropertyMap(Curriculum, request);
        setDatatablesBaseFilter(baseSearchValuesMap);
        org.gvnix.web.datatables.query.SearchResults<es.uca.iw.findyourjob.domain.Curriculum> searchResult = datatablesUtilsBean_dtt.findByCriteria(Curriculum.class, noPaginationCriteria, baseSearchValuesMap);
        // Use ConversionService with the obtained data
        return datatablesUtilsBean_dtt.populateDataSet(searchResult.getResults(), "id", searchResult.getTotalCount(), searchResult.getResultsCount(), criterias.getColumnDefs(), null).getRows();
    }
    
}