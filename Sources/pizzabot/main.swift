import ArgumentParser
import Foundation



struct PizzaBot: ParsableCommand {
    @Argument()
    var orderLocations: String
    
    func run() throws {
        let pizzaDeliveryBot = PizzaDeliveryBot()
        let orderLocations = OrderService.getOrderLocations(orderLocations)
        guard let orderLocationList = orderLocations else {
            print("No orders")
            return
        }
        pizzaDeliveryBot.orders = orderLocationList
        pizzaDeliveryBot.startDelivery()
    }
}

PizzaBot.main()
