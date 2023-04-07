//
//  ViewModel.swift
//  Quotes-SwiftUI
//
//  Created by Raja Adeel Ahmed on 4/6/23.
//

import Foundation

@MainActor
class ViewModel :ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: WeatherResponse)
        case failed(error:Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    
    private let controller : NetworkController
    
    init(controller:NetworkController) {
        self.controller = controller
    }
    
    func getData() async {
        status = .fetching
        
        do {
            var weather = try await controller.fetchWeather()
            status = .success(data: weather)
        } catch {
            status = .failed(error: error)
        }
    }
}
