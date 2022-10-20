//
//  Repository.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 19/10/2022.
//

import UIKit

enum RepositoryType {
    case local, remote
}


class Repositery {
    
    private let dataBase: Database?
    
    init(dataBase: Database) {
        self.dataBase = dataBase
    }
    
    
    func getFlights(_ type: RepositoryType ,_ complation: @escaping ((Result<[FlightData], Error>) -> Void)) {
        
        guard let dataBase = dataBase else {return}
        switch type {
        case .local:
            complation(.success(dataBase.getFlights()))
        case .remote:
            
        }
    }
}





