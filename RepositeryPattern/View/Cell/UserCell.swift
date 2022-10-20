//
//  UserCell.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 20/10/2022.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    public static let cellID = "UserCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(_ user: UserData) {
        userLabel.text = "\(user.userID)"
        titleLabel.text = user.title
        bodyLabel.text = user.body
    }
    
}
