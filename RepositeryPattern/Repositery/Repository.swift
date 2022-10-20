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
    
    
    func getUsers(_ type: RepositoryType ,_ complation: @escaping ((Result<[UserData], Error>) -> Void)) {
        
        guard let dataBase = dataBase else {return}
        switch type {
        case .local:
            complation(.success(dataBase.getUsers()))
        case .remote:
           print("REmote")
            let resource = URL(string: "https://jsonplaceholder.typicode.com/posts")!
            URLSession.shared.dataTask(with: resource) { data, respone, error in
                do {
                    guard let data = data else {return}
                    let userData = try JSONDecoder().decode([UserData].self, from: data)
                    self.dataBase?.save(userData)
                    complation(.success(userData))
                } catch {
                    complation(.failure(error))
                }
                
            }.resume()
        }
    }
}





