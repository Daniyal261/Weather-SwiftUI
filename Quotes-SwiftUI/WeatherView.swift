//
//  WeatherView.swift
//  Quotes-SwiftUI
//
//  Created by Raja Adeel Ahmed on 4/6/23.
//

import SwiftUI

struct WeatherView: View {
    @StateObject private var vm = ViewModel(controller: NetworkController())
    var body: some View {
        ZStack {
            //bg image
            Image("breakingbad")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 2.7, height: UIScreen.main.bounds.height * 1.1)
                
            
            VStack {
                // character image
                Button("Get Weather") {
                    Task {
                        await vm.getData()
                    }
                }
                .background(.brown)
                //                .frame(width: 100, height: 100)
                .font(.title)
                .foregroundColor(.white)
                .padding()
                
                switch vm.status {
                case .success(let data):
                    Text("Temprature is \(data.temperature.temp)")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                    //button
                case .fetching:
                    ProgressView()
                        .padding([.top, .bottom], 270)
                default:
                    Text("Temprature is not fetched")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.title)
                }
            }
        }
    }
    
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
