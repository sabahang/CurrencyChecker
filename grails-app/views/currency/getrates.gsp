<%@ page import="currencychecker.Currency" %>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Currencies to see rates</title>
    </head>
    <body>
        <div>
            <style type="text/css">
                .tftable {font-size:12px;color:#333333;width:100%;border-width: 1px;border-color: #9dcc7a;border-collapse: collapse;}
                .tftable th {font-size:12px;background-color:#abd28e;border-width: 1px;padding: 8px;border-style: solid;border-color: #9dcc7a;text-align:left;}
                .tftable tr {background-color:#ffffff;}
                .tftable td {font-size:12px;border-width: 1px;padding: 8px;border-style: solid;border-color: #9dcc7a;}
                .tftable tr:hover {background-color:#ffff99;}
            </style>

            <table class="tftable" border="1">
                <tr><th>Currency Name</th><th>Open Exchange</th><th>Currency API</th><th>Header 4</th></tr>

                <g:each var="child" in="${selectedCurrencies}">
                    <tr>
                        <td>Currency: ${child.name}</td>
                        <td>Rate: ${child.rate_one}</td>
                        <td>Rate: ${child.rate_two}</td>
                        <td>Rate: ${child.rate_three}</td>
                    </tr>
                </g:each>
            </table>

        </div>
        <div>
            <g:form name="selectCurrencyForm" url="[action:'getrates',controller:'currency']">
                <g:select name="currencies" from="${Currency.list()}" optionValue="name" optionKey="id" multiple="true" />
                <g:submitButton name="submit" value="Show Rates" />
            </g:form>

        </div>
    </body>
</html>
