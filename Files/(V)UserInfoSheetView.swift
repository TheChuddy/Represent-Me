//
//  (V)UserInfoSheetView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/30/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_UserInfoSheetView: View {
    @ObservedObject var homeLibrary: TemplateLibrary
    @Binding var showSheetView: Bool
    @Binding var nameEntry: String
    @Binding var streetAddressEntry: String
    @Binding var cityEntry: String
    @Binding var zipCodeEntry: String
    @Binding var region: StatesEnum

    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("Name:").padding(.trailing)
                        TextField("Enter your name", text: $nameEntry).multilineTextAlignment(.trailing)
                    }
                }
                Section {
                    HStack {
                        Text("Street address:").padding(.trailing)
                        TextField("Enter your address", text: $streetAddressEntry).multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("City/Town:").padding(.trailing)
                        TextField("Enter your city", text: $cityEntry).multilineTextAlignment(.trailing)
                    }
                    Picker(selection: $region, label: Text("State")) {
                        ForEach(StatesEnum.allCases, id:  \.self) { value in
                            Text(value.localizedName).tag(value)
                        }
                    }
                    HStack {
                        Text("Zip code:").padding(.trailing)
                        TextField("Enter your zip code", text: $zipCodeEntry).multilineTextAlignment(.trailing)
                    }
                }
            }
            .listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
            // Navigation bar settings
            .navigationBarTitle(Text("User Info"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {self.saveButton()}) {
                    Text("Save")
                    .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        .fontWeight(.black)
                })
        }
    }
    
    func saveButton() {
        self.homeLibrary.updateUserInfo(name: self.nameEntry, address: self.streetAddressEntry, city: self.cityEntry, state: self.region, zip: self.zipCodeEntry)
        self.showSheetView = false
    }
}

