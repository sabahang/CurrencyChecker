
<%@ page import="currencychecker.Currency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-currency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-currency" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list currency">
			
				<g:if test="${currencyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="currency.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${currencyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.rate_one}">
				<li class="fieldcontain">
					<span id="rate_one-label" class="property-label"><g:message code="currency.rate_one.label" default="Rateone" /></span>
					
						<span class="property-value" aria-labelledby="rate_one-label"><g:fieldValue bean="${currencyInstance}" field="rate_one"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.rate_three}">
				<li class="fieldcontain">
					<span id="rate_three-label" class="property-label"><g:message code="currency.rate_three.label" default="Ratethree" /></span>
					
						<span class="property-value" aria-labelledby="rate_three-label"><g:fieldValue bean="${currencyInstance}" field="rate_three"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.rate_two}">
				<li class="fieldcontain">
					<span id="rate_two-label" class="property-label"><g:message code="currency.rate_two.label" default="Ratetwo" /></span>
					
						<span class="property-value" aria-labelledby="rate_two-label"><g:fieldValue bean="${currencyInstance}" field="rate_two"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${currencyInstance?.symbol}">
				<li class="fieldcontain">
					<span id="symbol-label" class="property-label"><g:message code="currency.symbol.label" default="Symbol" /></span>
					
						<span class="property-value" aria-labelledby="symbol-label"><g:fieldValue bean="${currencyInstance}" field="symbol"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:currencyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${currencyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
