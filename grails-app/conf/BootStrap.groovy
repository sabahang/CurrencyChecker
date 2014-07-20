import currencychecker.Currency

class BootStrap {

    def init = { servletContext ->
        //test data
        if (Currency.count()){
            new Currency(name:"GBP",rate:0.79162).save(failOnError: true)
            new Currency(name:"CAD",rate:0.45190).save(failOnError: true)
        }
    }
    def destroy = {
    }
}
