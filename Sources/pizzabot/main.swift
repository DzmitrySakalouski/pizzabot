import ArgumentParser
import Foundation



struct PizzaBot: ParsableCommand {
    @Argument()
    var orderLocationsArgument: String
    
    func run() throws {
        let pizzaDeliveryBot = PizzaDeliveryBot()
        let orderLocations = OrderService.getOrderLocations(orderLocationsArgument)
        let mapSize = OrderService.getMapSize(orderLocationsArgument)

        guard let orderLocationList = orderLocations, let map = mapSize else {
            print("No orders")
            return
        }
        pizzaDeliveryBot.orders = orderLocationList
        pizzaDeliveryBot.mapSize = map
        pizzaDeliveryBot.startDelivery()
    }
}

PizzaBot.main()
