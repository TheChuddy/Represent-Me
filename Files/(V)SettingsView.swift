//
//  (V)SettingsView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_SettingsView: View {
    @ObservedObject var homeLibrary: TemplateLibrary
    @State var showUserInfoSheet: Bool = false
    @State var showSupportSheet: Bool = false
    @State private var autoFillIsOn = true
    @Environment(\.colorScheme) var colorScheme
    
    @State var nameEntry: String
    @State var streetAddressEntry: String
    @State var cityEntry: String
    @State var zipCodeEntry: String
    @State var region: StatesEnum
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: {self.showUserInfoSheet.toggle()}) {
                        _V_SettingsCell(title: "User Info", imageName: "person.circle", color: Color.init(red: 255/256, green: 155/256, blue: 84/256))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showUserInfoSheet) {
                        _V_UserInfoSheetView(homeLibrary: self.homeLibrary, showSheetView: self.$showUserInfoSheet, nameEntry: self.$nameEntry, streetAddressEntry: self.$streetAddressEntry, cityEntry: self.$cityEntry, zipCodeEntry: self.$zipCodeEntry, region: self.$region)
                    }
                    HStack {
                        Image(systemName: "wand.and.rays")
                            .font(.headline)
                            .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        Text("AutoFill")
                            .font(.headline)
                            .padding(.leading, 20)
                        Spacer()
                        Toggle("", isOn: $autoFillIsOn)
                    }
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
                Section {
                    Button(action: {self.showSupportSheet.toggle()}) {
                        _V_SettingsCell(title: "Support Us", imageName: "dollarsign.circle", color: Color.init(red: 255/256, green: 155/256, blue: 84/256))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }
                    .sheet(isPresented: $showSupportSheet) {
                            _V_SupportUsView(showSheetView: self.$showSupportSheet)
                    }
                }
            }
                .listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
                //.navigationBarTitle("Settings")
            .navigationBarItems(
                leading:
                Text("Account")
                .font(.system(size: 20))
                )
        }
    }
}
