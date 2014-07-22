package currencychecker

import grails.transaction.Transactional
import groovy.json.JsonSlurper

@Transactional
class CurrencyCheckerService {

    def loadCurrencies(){
        String Currencies_URI = 'http://openexchangerates.org/api/currencies.json'
        def apiURI = new URL(Currencies_URI)
        def slurper = new JsonSlurper()
        def symbols = slurper.parse(apiURI)
        symbols.eachWithIndex { obj, i -> new Currency(name:obj.getKey(),rate:0).save()};
    }
}
