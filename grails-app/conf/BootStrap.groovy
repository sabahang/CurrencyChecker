import currencychecker.Currency

class BootStrap {

    def init = { servletContext ->
        //test data
        if (!Currency.count()){
            Currency cur1 = new Currency(name:"GBP",rate:0.79162)
            //new Currency(name:"CAD",rate:0.45190).save(failOnError: true)
            if (!cur1.save()){
                log.error("couldn't save")
            }
        }
    }
    def destroy = {
    }
}
