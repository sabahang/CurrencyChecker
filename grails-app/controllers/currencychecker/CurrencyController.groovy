package currencychecker



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import java.awt.TexturePaintContext.Int

@Transactional(readOnly = true)
class CurrencyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Currency.list(params), model:[currencyInstanceCount: Currency.count()]
    }
    
    def select(){
        List<Currency> selectedCurrencies = Currency.getAll(params.currencies)
        [selectedCurrencies:selectedCurrencies]
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
