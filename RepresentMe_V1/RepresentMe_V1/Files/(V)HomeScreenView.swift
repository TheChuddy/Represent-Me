//
//  (V)HomeScreenView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_HomeScreenView: View {
    @ObservedObject var homeLibrary: TemplateLibrary
    @State var showFilterSheet: Bool = false
    @State var sortByUpvotes: Bool
    @State var sortByNew: Bool
    @State var sortByState: Bool
    @State var region: StatesEnum = StatesEnum.National
    
    var body: some View {
        NavigationView {
            List(sortByUpvotes ? homeLibrary.getEntries().sorted(by: sortByUpvotes(first:second:)) : homeLibrary.getEntries()) { template in
                NavigationLink(destination: _V_TemplateInfoView(template: template, homeLibrary: self.homeLibrary)) {
                    _V_HomeCardView(template: template)
                }
                    .disabled(self.sortByState ? !(template.getState() == self.region || self.region == StatesEnum.National) : false)
            }
            .listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
            //.navigationBarTitle("Home")
            .navigationBarItems(
                leading:
                    Text("Represent Me")
                        .font(.system(size: 25, weight: .heavy, design: .rounded)),
                trailing:
                    HStack {
                        Button(action: {self.showFilterSheet.toggle()}) {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                        }
                            .font(.system(size: 30 ))
                            .foregroundColor(.secondary)
                            .sheet(isPresented: $showFilterSheet) {
                                _V_FilterSheetView(homeLibrary: self.homeLibrary, showSheetView: self.$showFilterSheet, sortByPopular: self.$sortByUpvotes, sortByNew: self.$sortByNew, sortByState: self.$sortByState, region: self.$region)
                            }
                        Button(action: {self.update()}) {
                            Image(systemName: "magnifyingglass.circle")
                        }
                            .font(.system(size: 30))
                            .foregroundColor(.secondary)
                    }
            )
            
        }
    }
    func update() {
        self.homeLibrary.printUser()
        print("upvotes: \(sortByUpvotes)   new: \(sortByNew)  state?: \(sortByState) region: \(region.rawValue)")
    }
    
    func sortByUpvotes(first: TemplateInfo, second: TemplateInfo) -> Bool {
        return first.getUpvotes() >= second.getUpvotes()
    }
}



