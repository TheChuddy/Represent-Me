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
    @State private var searchTerm : String = ""
    @State private var isSearching: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                if isSearching {
                    SearchBar(text: $searchTerm)
                        .padding(.top)
                        .transition(.move(edge: .top))
                        .animation(.default)
                }
                ScrollView {
                    ForEach(homeLibrary.getEntries()) {template in
                        NavigationLink(destination: _V_TemplateInfoView(template: template, homeLibrary: self.homeLibrary)) {
                            _V_HomeCardView(template: template)
                                .padding(.horizontal)
                                .padding(.bottom)
                        }
                    }
                }.padding(.top, 10)
                .transition(.move(edge: .top))
                .animation(.default)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading:
                    Text("Represent Me")
                        .font(.system(size: 30, weight: .heavy, design: .rounded)),
                trailing:
                HStack {
                    Button(action: {self.showFilterSheet.toggle()}) {
                        Image(systemName: "line.horizontal.3.decrease.circle")
                    }
                        .font(.system(size: 25))
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 3)
                        .sheet(isPresented: $showFilterSheet) {
                            _V_FilterSheetView(homeLibrary: self.homeLibrary, showSheetView: self.$showFilterSheet, sortByPopular: self.$sortByUpvotes, sortByNew: self.$sortByNew, sortByState: self.$sortByState, region: self.$region)
                    }
                    Button(action: {self.isSearching.toggle()}) {
                        Image(systemName: isSearching ? "minus.magnifyingglass" : "plus.magnifyingglass")
                    }
                        .font(.system(size: 25))
                    .foregroundColor(isSearching ? .orange : .secondary)
                }
            )
            
        }.accentColor(.orange)
    }
    func update() {
        self.homeLibrary.printUser()
        print("upvotes: \(sortByUpvotes)   new: \(sortByNew)  state?: \(sortByState) region: \(region.rawValue)")
    }
    
    func sortByUpvotes(first: TemplateInfo, second: TemplateInfo) -> Bool {
        return first.getUpvotes() >= second.getUpvotes()
    }
}



//            List(sortByUpvotes ? homeLibrary.getEntries().sorted(by: sortByUpvotes(first:second:)) : homeLibrary.getEntries()) { template in
//                NavigationLink(destination: _V_TemplateInfoView(template: template, homeLibrary: self.homeLibrary)) {
//                    _V_HomeCardView(template: template)
//                }
//                    .disabled(self.sortByState ? !(template.getState() == self.region || self.region == StatesEnum.National) : false)
//            }
            //SORTING SHOULD BE DONE THROUGH THE API/DATABASE. When we pull data, we can specify exactly how to sort it/ any parameters
            //This should just have a list of templates and display them
//            List(homeLibrary.getEntries()) { template in
//                NavigationLink(destination: _V_TemplateInfoView(template: template, homeLibrary: self.homeLibrary)) {
//                    _V_HomeCardView(template: template)
//                }
//            }
