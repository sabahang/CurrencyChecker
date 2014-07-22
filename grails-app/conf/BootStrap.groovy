import currencychecker.Currency

class BootStrap {
    
    def CurrencyCheckerService
    
    def init = { servletContext ->
        if (!Currency.count()){
            CurrencyCheckerService.loadCurrencies()
        }
    }
    
    def destroy = {
        Currency.executeUpdate('delete from Currency')
    }
}
