//
//  (V)FilterSheetView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/30/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_FilterSheetView: View {
    @ObservedObject var homeLibrary: TemplateLibrary
    @Binding var showSheetView: Bool
    @Binding var sortByPopular: Bool
    @Binding var sortByNew: Bool
    @Binding var sortByState: Bool
    @Binding var region: StatesEnum

    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image(systemName: "flame")
                            .font(.headline)
                            .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        Text("Sort by popular")
                            .font(.headline)
                            .padding(.leading)
                        Toggle("", isOn: $sortByPopular)
                    }
                    HStack {
                        Image(systemName: "star")
                            .font(.headline)
                            .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        Text("Sort by new")
                            .font(.headline)
                            .padding(.leading)
                        // TODO: make this its own button
                        Toggle("", isOn: $sortByNew)
                    }
                }
                Section {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.headline)
                            .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        Text("Sort by region")
                            .font(.headline)
                            .padding(.leading)
                        // TODO: make this its own button
                        Toggle("", isOn: $sortByState)
                    }
                    Picker(selection: $region, label: Text("State")) {
                        ForEach(StatesEnum.allCases, id:  \.self) { value in
                            Text(value.localizedName).tag(value)
                        }
                    }.disabled(!sortByState)
                }
            }
            .listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
            // Navigation bar settings
            .navigationBarTitle(Text("Filter"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {self.saveButton()}) {
                    Text("Save")
                    .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        .fontWeight(.black)
                    .padding()
                })
        }
    }
    
    func saveButton() {
        self.homeLibrary.updateFilteringInfo(sortPop: sortByPopular, sortNew: sortByNew, sortReg: sortByState, region: region)
        self.showSheetView.toggle()
    }
}

