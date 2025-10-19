//
//  PostModel.swift
//  battleBucks
//
//  Created by Arpit Verma on 10/18/25.
//

import Foundation

// JSONPlaceholder API response structure
/*
 URL: https://jsonplaceholder.typicode.com/posts
 
 JSON Response:
 {
   "userId": 1,
   "id": 1,
   "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
   "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cu"
 }
 */

struct PostModel: Identifiable, Codable, Equatable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    var isFavorite: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }
    
    init(userId: Int, id: Int, title: String, body: String, isFavorite: Bool = false) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        self.isFavorite = isFavorite
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decode(Int.self, forKey: .userId)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        isFavorite = false // Default value, not from API
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(userId, forKey: .userId)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
    }
    
    func toggleFavorite() -> PostModel {
        return PostModel(
            userId: userId,
            id: id,
            title: title,
            body: body,
            isFavorite: !isFavorite
        )
    }
    
    func setFavorite(_ favorite: Bool) -> PostModel {
        return PostModel(
            userId: userId,
            id: id,
            title: title,
            body: body,
            isFavorite: favorite
        )
    }
}
