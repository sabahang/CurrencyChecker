import currencychecker.Currency

class BootStrap {

    def init = { servletContext ->
        //test data
        if (!Currency.count()){
            Currency cur1 = new Currency(name:"GBP",rate:0.79162)
            Currency cur2 = new Currency(name:"UYU",rate:0.742)
            Currency cur3 = new Currency(name:"TWE",rate:0.1864)
            Currency cur4 = new Currency(name:"PLY",rate:0.4572)
            Currency cur5 = new Currency(name:"QSS",rate:0.12589)
            //new Currency(name:"CAD",rate:0.45190).save(failOnError: true)
           cur1.save()
           cur2.save()
           cur3.save()
           cur4.save()
           cur5.save()
           
//             if (!cur1.save() | ){
//                log.error("couldn't save")
//            }
        }
    }
    def destroy = {
    }
}
