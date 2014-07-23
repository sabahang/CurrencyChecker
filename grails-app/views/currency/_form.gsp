<%@ page import="currencychecker.Currency" %>



<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="currency.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${currencyInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'rate_one', 'error')} required">
	<label for="rate_one">
		<g:message code="currency.rate_one.label" default="Rateone" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate_one" value="${fieldValue(bean: currencyInstance, field: 'rate_one')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'rate_three', 'error')} required">
	<label for="rate_three">
		<g:message code="currency.rate_three.label" default="Ratethree" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate_three" value="${fieldValue(bean: currencyInstance, field: 'rate_three')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'rate_two', 'error')} required">
	<label for="rate_two">
		<g:message code="currency.rate_two.label" default="Ratetwo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rate_two" value="${fieldValue(bean: currencyInstance, field: 'rate_two')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: currencyInstance, field: 'symbol', 'error')} required">
	<label for="symbol">
		<g:message code="currency.symbol.label" default="Symbol" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="symbol" required="" value="${currencyInstance?.symbol}"/>

</div>

