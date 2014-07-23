
<%@ page import="currencychecker.Currency" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'currency.label', default: 'Currency')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-currency" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-currency" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'currency.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="rate_one" title="${message(code: 'currency.rate_one.label', default: 'Rateone')}" />
					
						<g:sortableColumn property="rate_three" title="${message(code: 'currency.rate_three.label', default: 'Ratethree')}" />
					
						<g:sortableColumn property="rate_two" title="${message(code: 'currency.rate_two.label', default: 'Ratetwo')}" />
					
						<g:sortableColumn property="symbol" title="${message(code: 'currency.symbol.label', default: 'Symbol')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${currencyInstanceList}" status="i" var="currencyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${currencyInstance.id}">${fieldValue(bean: currencyInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: currencyInstance, field: "rate_one")}</td>
					
						<td>${fieldValue(bean: currencyInstance, field: "rate_three")}</td>
					
						<td>${fieldValue(bean: currencyInstance, field: "rate_two")}</td>
					
						<td>${fieldValue(bean: currencyInstance, field: "symbol")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${currencyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
