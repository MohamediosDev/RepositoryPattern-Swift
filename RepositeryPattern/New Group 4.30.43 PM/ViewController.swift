//
//  ViewController.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 19/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let repositery = Repositery(dataBase: Database())
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDataFromRemote()
        getUserDataFromDataBase()
    }
    
    private func getUserDataFromRemote() {
        repositery.getUsers(.remote) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                print("response Remote",data)
            case .failure(let error):
                print("Error in Get",error.localizedDescription)
            }
        }
    }
    
    private func getUserDataFromDataBase() {
        repositery.getUsers(.local) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                print("response Local",data)
            case .failure(let error):
                print("Error in Get",error.localizedDescription)
            }
        }
    }
}
