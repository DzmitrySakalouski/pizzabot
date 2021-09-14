//
//  File.swift
//  
//
//  Created by Dzmitry on 14.09.21.
//

import Foundation

public class OrderService {
    static func getOrderLocations(_ ordersListString: String) -> [Location]? {
        do {
            let regex = try NSRegularExpression(pattern: REGEX)
            let matches = regex.matches(in: ordersListString, options: [], range: NSRange(location: 0, length: ordersListString.utf16.count))
            if matches.count > 0 {
                let orderLocationList = matches.map { match -> Location in
                    let locationString = String(ordersListString[Range(match.range, in: ordersListString)!])
                    let coordinatesArray = locationString.split(separator: ",")
                    let orderLocation = Location(x: Int(coordinatesArray[0])!, y: Int(coordinatesArray[1])!)
                    return orderLocation
                }
                return orderLocationList
            } else {
                return nil
            }
        } catch {
            print("Ooops, something went wrong")
            return nil
        }
    }
}
