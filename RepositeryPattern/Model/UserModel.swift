//
//  flightModle.swift
//  RepositeryPattern
//
//  Created by Mohamed sayed on 19/10/2022.
//

import Foundation

// MARK: - User
struct UserData: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

//https://jsonplaceholder.typicode.com/posts
