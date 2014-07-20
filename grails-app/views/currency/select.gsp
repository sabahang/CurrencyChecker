<%@ page import="currencychecker.Currency" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Currencies to see rates</title>
    </head>
    <body>
        <div>
            <g:form name="selectCurrencyForm" url="[action:'select',controller:'currency']">
                <g:select name="currencies" from="${Currency.list()}" optionValue="name" optionKey="id" multiple="true" />
                <g:submitButton name="submit" value="Show Rates" />
            </g:form>

        </div>
    </body>
</html>
