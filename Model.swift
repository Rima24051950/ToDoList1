//
//  Model.swift
//  page72
//
//  Created by Sadyk on 18.12.2024.
//

import Foundation

import UIKit
// MARK: - Welcome
struct Welcome: Codable {
    var todos: [Todo]
    var total, skip, limit: Int
   // var reloDate:Date
}

// MARK: - Todo
struct Todo: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case id, todo, completed
        case userID = "userId"
    }
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decode(Int.self, forKey: .id)
            todo = try values.decode(String.self, forKey: .todo)
            completed = try values.decode(Bool.self, forKey: .completed)
             userID = try values.decode(Int.self, forKey: .userID)
        }
    }

