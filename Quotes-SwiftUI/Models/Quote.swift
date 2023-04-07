//
//  Quote.swift
//  Quotes-SwiftUI
//
//  Created by Raja Adeel Ahmed on 4/6/23.
//

import Foundation

struct Quote:Codable {
    let quote: String
    let author: String
    let series: String
    
    enum QuoteKeys: String, CodingKey {
        case quote
        case author
        case series
    }
    
    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let qouteContainer = try container.nestedContainer(keyedBy: QuoteKeys.self)
        quote = try qouteContainer.decode(String.self, forKey: .quote)
        author = try qouteContainer.decode(String.self, forKey: .author)
        series = try qouteContainer.decode(String.self, forKey: .series)
    }
}

