//
//  (V)PublishView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct PublishView: View {
    @ObservedObject var homeLibrary: TemplateLibrary
    @State var showNewTemplateView = false
    
    var body: some View {
        NavigationView {
            FolderShape(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(20), clockwise:true)
            .padding()
            .foregroundColor(.red)
            //.navigationBarTitle("Publish")
            .navigationBarItems(
                leading:
                    Text("Your Library")
                    .font(.system(size: 20)),
                trailing:
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "folder.badge.plus")
                        }
                            .font(.system(size: 30))
                        Button(action: {self.showNewTemplateView.toggle()}) {
                            Image(systemName: "plus.circle")
                        }
                            .font(.system(size: 30))
                        .sheet(isPresented: $showNewTemplateView) {
                            _V_MakeNewTemplateSheet(homeLibrary: self.homeLibrary, showSheetView: self.$showNewTemplateView)
                        }
                    }
            )
        }
    }
}


