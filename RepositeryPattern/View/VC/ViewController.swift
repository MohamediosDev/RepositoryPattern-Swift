//
//  ViewController.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 20/10/2022.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    
    private let viewModel = HomeViewModel()
    private var anyCancelable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getUsersFromRemote()
    }

    fileprivate func getUsersFromRemote() {
        viewModel.getUserFromRemote()
        viewModel
            .$userData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else {return}
                self.userTableView.reloadData()
            }
            .store(in: &anyCancelable)
    }

}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    private func setupTableView() {
        userTableView.delegate = self
        userTableView.dataSource = self
        userTableView.register(UINib(nibName: UserCell.cellID, bundle: nil), forCellReuseIdentifier: UserCell.cellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.cellID, for: indexPath) as! UserCell
        viewModel
            .$userData
            .receive(on: DispatchQueue.main)
            .sink { users in
                cell.configureCell(users[indexPath.row])
            }
            .store(in: &anyCancelable)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel
            .$userData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                guard let self = self else {return}
                self.showAlert(user[indexPath.row].title)
            }
            .store(in: &anyCancelable)
    }
    
    
}

extension ViewController {
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "USER", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(alertAction)
        present(alert, animated: true)
                                      
    }
}
