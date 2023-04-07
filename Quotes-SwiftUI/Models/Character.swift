//
//  Character.swift
//  Quotes-SwiftUI
//
//  Created by Raja Adeel Ahmed on 4/6/23.
//

import Foundation

struct Character:Codable {
    let name: String
    let birthday: String
    let occupation: [String]
    let image: URL
    let nickname: String
    let portrayedBy: String
    
    enum QuoteKeys: String, CodingKey {
        case name
        case birthday
        case occupation
        case image = "img"
        case nickname
        case portrayedBy = "portrayed"
    }
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let qouteContainer = try container.nestedContainer(keyedBy: QuoteKeys.self)
        name = try qouteContainer.decode(String.self, forKey: .name)
        birthday = try qouteContainer.decode(String.self, forKey: .birthday)
        occupation = try qouteContainer.decode([String].self, forKey: .occupation)
        image = try qouteContainer.decode(URL.self, forKey: .image)
        nickname = try qouteContainer.decode(String.self, forKey: .nickname)
        portrayedBy = try qouteContainer.decode(String.self, forKey: .portrayedBy)
    }
}
