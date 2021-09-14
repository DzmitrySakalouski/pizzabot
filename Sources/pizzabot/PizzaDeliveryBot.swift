//
//  File.swift
//  
//
//  Created by Dzmitry on 13.09.21.
//

import Foundation

public class PizzaDeliveryBot {
    var mapSize: Location!
    var orders: [Location]!
    var currentLocation: Location = Location(x: 0, y: 0)
    
    public init() {}
        
    func dropPitzza() {
        print("dropPitzza")
        orders.removeFirst()
        getDeliveryProgress()
    }
    
    func moveNorth() {
        print("moveNorth")
        self.currentLocation.y += 1
    }
    
    func moveSouth() {
        print("moveSouth")
        self.currentLocation.y -= 1
    }
    
    func moveEast() {
        print("moveEast")
        self.currentLocation.x += 1
    }
    
    func moveWest() {
        print("moveWest")
        self.currentLocation.x -= 1
    }
    
    func startDelivery() {
        print("startDelivery")
        getDeliveryProgress()
        guard let orderList = orders, let map = mapSize else {
            print("There is no pizza for delivery =(")
            return
        }
        
        orderList.forEach { order in
            if map.x < order.x || map.y < order.y {
                print("Unfortunately it's to far for delivery. Moving to the next order")
                return
            }

            let yRoute = order.y - currentLocation.y
            let xRoute = order.x - currentLocation.x
                        
            if yRoute < 0 {
                for _ in 0..<abs(yRoute) {
                    self.moveSouth()
                }
            } else {
                for _ in 0..<yRoute {
                    self.moveNorth()
                }
            }

            if xRoute < 0 {
                for _ in 0..<abs(xRoute) {
                    self.moveWest()
                }
            } else {
                for _ in 0..<xRoute {
                    self.moveEast()
                }
            }
            
            dropPitzza()
        }
        
        returnToBase()
    }
    
    private func returnToBase() {
        print("That's it, going back to the base")
        if orders.count > 0 {
            print("Excuse but there is not delivered pizza. Seems that location was too far.")
        }
        self.currentLocation = Location(x: 0, y: 0)
    }
    
    private func getDeliveryProgress() {
        print("Orders left: \(orders.count)")
    }
}
