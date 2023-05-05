//
//  Resources.swift
//  News
//
//  Created by Никита Куприянов on 05.05.2023.
//

import Foundation
 
enum Resources: String {
    case apiKey = "https://api.spaceflightnewsapi.net/v3/articles"
}

struct SpaceData: Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}
