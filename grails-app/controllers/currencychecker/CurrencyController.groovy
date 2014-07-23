package currencychecker


//import grails.plugin.openexchangerates.* 

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.awt.TexturePaintContext.Int

import grails.converters.JSON

import groovy.json.JsonSlurper
import java.net.URL

@Transactional(readOnly = true)
class CurrencyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def grailsApplication

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Currency.list(params), model:[currencyInstanceCount: Currency.count()]
    }
    
    def select(){
        List<Currency> selected = Currency.getAll(params.currencies)
        
        selected.each { obj -> obj.rate_one = rateFromOpenExchange(obj.symbol)};
        
        selected.each { obj -> Currency updateCurrencyRate = Currency.findBySymbol(obj.symbol)
            updateCurrencyRate.rate_one = obj.rate_one
            updateCurrencyRate.save(flush: true)};
        
        [selectedCurrencies:selected]
    }

    def rateFromOpenExchange(String sym){
    
        String Rates_URI = 'https://openexchangerates.org/api/latest.json?app_id=ac9c7766220144aab4944d14ad0931dc'
        def apiURI = new URL(Rates_URI)

        def slurper = new JsonSlurper()
        def currency = slurper.parse(apiURI)
        currency.rates."$sym"
    }
    private def getConfig() {
        grailsApplication.config.grails.plugin.openexchangerates
    }
    def show(Currency currencyInstance) {
        respond currencyInstance
    }

    def create() {
        respond new Currency(params)
    }

    @Transactional
    def save(Currency currencyInstance) {
        if (currencyInstance == null) {
            notFound()
            return
        }

        if (currencyInstance.hasErrors()) {
            respond currencyInstance.errors, view:'create'
            return
        }

        currencyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'currency.label', default: 'Currency'), currencyInstance.id])
                redirect currencyInstance
            }
            '*' { respond currencyInstance, [status: CREATED] }
        }
    }

    def edit(Currency currencyInstance) {
        respond currencyInstance
    }

    @Transactional
    def update(Currency currencyInstance) {
        if (currencyInstance == null) {
            notFound()
            return
        }

        if (currencyInstance.hasErrors()) {
            respond currencyInstance.errors, view:'edit'
            return
        }

        currencyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Currency.label', default: 'Currency'), currencyInstance.id])
                redirect currencyInstance
            }
            '*'{ respond currencyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Currency currencyInstance) {

        if (currencyInstance == null) {
            notFound()
            return
        }

        currencyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Currency.label', default: 'Currency'), currencyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'currency.label', default: 'Currency'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
