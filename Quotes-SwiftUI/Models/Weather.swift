//
//  Weather.swift
//  Quotes-SwiftUI
//
//  Created by Raja Adeel Ahmed on 4/6/23.
//

import Foundation

struct WeatherResponse:Codable {
    let weather: [Weather]
    let temperature: Temperature
    
    enum WeatherResponseKeys: String, CodingKey {
        case weather
        case temperature = "main"
    }
    
    init(from decoder: Decoder) throws {
        let qouteContainer = try decoder.container(keyedBy: WeatherResponseKeys.self)
        weather = try qouteContainer.decode([Weather].self, forKey: .weather)
        temperature = try qouteContainer.decode(Temperature.self, forKey: .temperature)
    }
}

struct Weather:Codable {
    let main: String
    let description: String
    
    enum WeatherKeys: String, CodingKey {
        case main
        case description
    }
    
    init(from decoder: Decoder) throws {
        let qouteContainer = try decoder.container(keyedBy: WeatherKeys.self)
        main = try qouteContainer.decode(String.self, forKey: .main)
        description = try qouteContainer.decode(String.self, forKey: .description)
    }
}


struct Temperature:Codable {
    let temp: Double
    let humidity: Double
    
    enum TemperatureKeys: String, CodingKey {
        case temp
        case humidity
    }
    
    init(from decoder: Decoder) throws {
        let qouteContainer = try decoder.container(keyedBy: TemperatureKeys.self)
        temp = try qouteContainer.decode(Double.self, forKey: .temp)
        humidity = try qouteContainer.decode(Double.self, forKey: .humidity)
    }
}

