//
//  DataBase.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 19/10/2022.
//

import Foundation
import RealmSwift

class Flight: Object {
    @objc dynamic var airline: String = ""
    @objc dynamic var flight: String = ""
    @objc dynamic var actualTime: String = ""
    
    override class func primaryKey() -> String? {
        return "flight"
    }
}

final class Database {
    
    func save(_ flights: [FlightData]) {
        let realm = try! Realm()
        do {
            try realm.write {
                
                flights.forEach { flight in
                    
                    let object = Flight()
                    object.airline = flight.airLine
                    object.flight = flight.flight
                    object.actualTime = flight.actualTime
                    realm.add(object , update: .all)
                }
            }
            
        } catch {
            print("Save Error",error.localizedDescription)
        }
    }
    
    func getFlights() -> [FlightData] {
        
        let realm = try! Realm()
        
        return realm.objects(Flight.self).map { object in
            return FlightData(airLine: object.airline, flight: object.flight, actualTime: object.actualTime)
        }
    }
    
}
