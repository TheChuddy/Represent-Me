//
//  ContentView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var homeLibrary: TemplateLibrary = TemplateLibrary()
    @State private var selection = 0
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TabView(selection: $selection) {
            PublishView(homeLibrary: homeLibrary)
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 25, weight: .bold))
                }
                .tag(1)
            _V_HomeScreenView(homeLibrary: homeLibrary, sortByUpvotes: homeLibrary.getSortingByPopular(), sortByNew: homeLibrary.getSortingByNew(), sortByState: homeLibrary.getSortingByRegion(), region: homeLibrary.getSortRegion())
                .tabItem {
                    Image(systemName: "tray.fill")
                        .font(.system(size: 25, weight: .bold))
                }
                .tag(0)
            _V_SettingsView(homeLibrary: homeLibrary, nameEntry: homeLibrary.getUserName(), streetAddressEntry: homeLibrary.getUserAddress(), cityEntry: homeLibrary.getUserCity(), zipCodeEntry: homeLibrary.getUserCity(), region: homeLibrary.getUserState())
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 25, weight: .bold))
                }
                .tag(2)
        }.accentColor(colorScheme == .dark ? .white : .black)
    }
}
