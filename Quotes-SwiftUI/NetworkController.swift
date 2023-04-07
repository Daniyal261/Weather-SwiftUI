//
//  NetworkController.swift
//  Quotes-SwiftUI
//
//  Created by Raja Adeel Ahmed on 4/6/23.
//

import Foundation

struct NetworkController {
    enum NetworkError: Error {
        case badUrl, badResponse
    }
    
    private let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Islamabad&")
    
    func fetchWeather() async throws -> WeatherResponse {
        var weatherComponents = URLComponents(url: baseURL!, resolvingAgainstBaseURL: true)
                let characterQueryItem1 = URLQueryItem(name: "q", value: "Islamabad")
                let characterQueryItem2 = URLQueryItem(name: "appid", value: "<YOUR API KEY>")
        weatherComponents?.queryItems = [characterQueryItem1, characterQueryItem2]
        
        guard let getWeatherURL = weatherComponents?.url else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: getWeatherURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return weather
    }
}
