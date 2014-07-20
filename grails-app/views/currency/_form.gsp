<%@ page import="currencychecker.Currency" %>



<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="currency.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${currencyInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'rate', 'error')} required">
	<label for="rate">
		<g:message code="currency.rate.label" default="Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate" value="${fieldValue(bean: currencyInstance, field: 'rate')}" required=""/>

</div>

