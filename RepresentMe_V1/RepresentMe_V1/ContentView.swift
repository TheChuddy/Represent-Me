//
//  ContentView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct (V)Main: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            PublishView()
            .tabItem {
                VStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Publish")
                }
            }
            .tag(0)
            _V_HomeScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                }
                .tag(1)
            _V_SettingsView()
                .tabItem{
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Settings")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        (V)Main()
    }
}
