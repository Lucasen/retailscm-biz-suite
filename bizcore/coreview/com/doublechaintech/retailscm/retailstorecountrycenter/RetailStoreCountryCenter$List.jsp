<%@ page import='java.util.*,com.doublechaintech.retailscm.*'%>
<%@ page language="java" contentType="text/plain; charset=utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sky" tagdir="/tags"%>
<fmt:setLocale value="zh_CN"/>
<c:set var="ignoreListAccessControl" value="${true}"/>


<c:if test="${ empty retailStoreCountryCenterList}" >
	<div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		 ${userContext.localeMap['@not_found']}${userContext.localeMap['retail_store_country_center']}! 
		 <a href="./${ownerBeanName}Manager/addRetailStoreCountryCenter/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 
		 
		 </div>
	</div>

</c:if>




	

 <c:if test="${not empty retailStoreCountryCenterList}" >
    
    
<%

 	SmartList list=(SmartList)request.getAttribute("retailStoreCountryCenterList"); 
 	int totalCount = list.getTotalCount();
 	List pages = list.getPages();
 	pageContext.setAttribute("rowsPerPage",list.getRowsPerPage()); 
 	
 	pageContext.setAttribute("pages",pages); 
 	pageContext.setAttribute("totalCount",totalCount); 
 	//pageContext.setAttribute("accessible",list.isAccessible()); 
 	//the reason using scriptlet here is the el express is currently not able resolv common property from a subclass of list
%>
    
 	   
    <div class="row" style="font-size: 30px;">
		<div class="col-xs-12 col-md-12" style="padding-left:20px">
		<i class='fa fa-table'></i> ${userContext.localeMap['retail_store_country_center']}(${totalCount})
		<a href="./${ownerBeanName}Manager/addRetailStoreCountryCenter/${result.id}/"><i class="fa fa-plus-square" aria-hidden="true"></i></a>
		 
		 		 	<div class="btn-group" role="group" aria-label="Button group with nested dropdown">		
	<c:forEach var="action" items="${result.actionList}">
		<c:if test="${'retailStoreCountryCenterList' eq action.actionGroup}">
		<a class="btn btn-${action.actionLevel} btn-sm" href="${action.managerBeanName}/${action.actionPath}">${userContext.localeMap[action.localeKey]}</a>
		</c:if>
	</c:forEach>
	</div><!--end of div class="btn-group" -->
	
		 
		 
		 
		 </div>
 </div>
    
    
<div class="table-responsive">


<c:set var="currentPageNumber" value="1"/>	



<nav aria-label="Page navigation example">
  <ul class="pagination">
<c:forEach var="page" items="${pages}"> 
<c:set var="classType" value=""/>
<c:if test='${page.selected}' >
<c:set var="classType" value="active"/>
<c:set var="currentPageNumber" value="${page.pageNumber}"/>
</c:if>


	<li class="page-item ${classType}">
		<a href='#${ownerBeanName}Manager/load${ownerClassName}/${result.id}/${retailStoreCountryCenterListName};${retailStoreCountryCenterListName}CurrentPage=${page.pageNumber};${retailStoreCountryCenterListName}RowsPerPage=${rowsPerPage}/' 
			class='page-link page-action '>${page.title}</a>
	</li>
</c:forEach>
 </ul>
</nav>


   


	<table class="table table-striped" pageToken='retailStoreCountryCenterListCurrentPage=${currentPageNumber}'>
		<thead><tr>
		<c:if test="${param.referName ne 'id'}">
	<th>${userContext.localeMap['retail_store_country_center.id']}</th>
</c:if>
<c:if test="${param.referName ne 'name'}">
	<th>${userContext.localeMap['retail_store_country_center.name']}</th>
</c:if>
<c:if test="${param.referName ne 'serviceNumber'}">
	<th>${userContext.localeMap['retail_store_country_center.service_number']}</th>
</c:if>
<c:if test="${param.referName ne 'founded'}">
	<th>${userContext.localeMap['retail_store_country_center.founded']}</th>
</c:if>
<c:if test="${param.referName ne 'webSite'}">
	<th>${userContext.localeMap['retail_store_country_center.web_site']}</th>
</c:if>
<c:if test="${param.referName ne 'address'}">
	<th>${userContext.localeMap['retail_store_country_center.address']}</th>
</c:if>
<c:if test="${param.referName ne 'operatedBy'}">
	<th>${userContext.localeMap['retail_store_country_center.operated_by']}</th>
</c:if>
<c:if test="${param.referName ne 'legalRepresentative'}">
	<th>${userContext.localeMap['retail_store_country_center.legal_representative']}</th>
</c:if>
<c:if test="${param.referName ne 'description'}">
	<th>${userContext.localeMap['retail_store_country_center.description']}</th>
</c:if>
<th>${userContext.localeMap['@action']}</th>
		</tr></thead>
		<tbody>
			
			<c:forEach var="item" items="${retailStoreCountryCenterList}">
				<tr currentVersion='${item.version}' id="retailStoreCountryCenter-${item.id}" ><td><a class="link-action-removed" href="./retailStoreCountryCenterManager/view/${item.id}/"> ${item.id}</a></td>
<c:if test="${param.referName ne 'name'}">	<td contenteditable='true' class='edit-value'  propertyToChange='name' storedCellValue='${item.name}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'>${item.name}</td>
</c:if><c:if test="${param.referName ne 'serviceNumber'}">	<td contenteditable='true' class='edit-value'  propertyToChange='serviceNumber' storedCellValue='${item.serviceNumber}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'>${item.serviceNumber}</td>
</c:if><c:if test="${param.referName ne 'founded'}">	<td contenteditable='true' class='edit-value'  propertyToChange='founded' storedCellValue='${item.founded}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'><fmt:formatDate pattern="yyyy-MM-dd" value="${item.founded}" /></td>
</c:if><c:if test="${param.referName ne 'webSite'}">	<td contenteditable='true' class='edit-value'  propertyToChange='webSite' storedCellValue='${item.webSite}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'>${item.webSite}</td>
</c:if><c:if test="${param.referName ne 'address'}">	<td contenteditable='true' class='edit-value'  propertyToChange='address' storedCellValue='${item.address}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'>${item.address}</td>
</c:if><c:if test="${param.referName ne 'operatedBy'}">	<td contenteditable='true' class='edit-value'  propertyToChange='operatedBy' storedCellValue='${item.operatedBy}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'>${item.operatedBy}</td>
</c:if><c:if test="${param.referName ne 'legalRepresentative'}">	<td contenteditable='true' class='edit-value'  propertyToChange='legalRepresentative' storedCellValue='${item.legalRepresentative}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'>${item.legalRepresentative}</td>
</c:if><c:if test="${param.referName ne 'description'}">	<td contenteditable='true' class='edit-value'  propertyToChange='description' storedCellValue='${item.description}' prefix='${ownerBeanName}Manager/updateRetailStoreCountryCenter/${result.id}/${item.id}/'>${item.description}</td>
</c:if>
				<td>

				<a href='#${ownerBeanName}Manager/removeRetailStoreCountryCenter/${result.id}/${item.id}/' class='delete-action btn btn-danger btn-xs'><i class="fa fa-trash-o fa-lg"></i> ${userContext.localeMap['@delete']}</a>
				<a href='#${ownerBeanName}Manager/copyRetailStoreCountryCenterFrom/${result.id}/${item.id}/' class='copy-action btn btn-success btn-xs'><i class="fa fa-files-o fa-lg"></i> ${userContext.localeMap['@copy']} </a>

				</td>
				</tr>
			</c:forEach>
		
		</tbody>
	</table>	
	

</div></c:if>


