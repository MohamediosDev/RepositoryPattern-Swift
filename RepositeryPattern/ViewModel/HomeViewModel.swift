//
//  HomeViewModel.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 20/10/2022.
//

import Foundation

class HomeViewModel {
    
    @Published var userData = [UserData]()
    private let repositery = Repositery(dataBase: Database())
    init() {}
    
    func getUserFromRemote() {
        repositery.getUsers(.remote) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let remoteUserData):
                self.userData = remoteUserData
            case .failure(let error):
                print("Error in Remote:",error.localizedDescription)
            }
        }
    }
    
    func getUserFromLocal() {
        repositery.getUsers(.local) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let localUserData):
                self.userData = localUserData
            case .failure(let error):
                print("Error in Remote:",error.localizedDescription)
            }
        }
    }
    
}
