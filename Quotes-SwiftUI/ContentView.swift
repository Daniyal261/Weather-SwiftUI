//
//  ContentView.swift
//  Quotes-SwiftUI
//
//  Created by Raja Adeel Ahmed on 4/6/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            WeatherView()
                .tabItem {
                    Label("Breaking Bad", systemImage: "tortoise")
                }
            
            Text("Betterall Saul View")
                .tabItem {
                    Label("Better Call Saul" , systemImage: "briefcase")
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
