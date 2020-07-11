//
//  (V)TemplateView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 7/10/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_TemplateView: View {
    @State var templateEntry: String = ""
    @Binding var template: String
    @State private var textStyle = UIFont.TextStyle.body
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .top) {
            TextView(text: $templateEntry, textStyle: $textStyle)
                .padding()
                .padding(.top, 50)
            HStack {
                Button(action: {
                    self.templateEntry.append(" //Insert Name// ")
                }) {
                    Text("Name").lineLimit(1)
                        .padding(8)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                }.padding(10)
                Button(action: {
                    self.templateEntry.append(" //Insert Phone Number// ")
                }) {
                    Text("Phone").lineLimit(1)
                        .padding(8)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                    
                }.padding(10)
                Button(action: {
                    self.templateEntry.append(" //Insert Address// ")
                }) {
                    Text("Address").lineLimit(1)
                        .padding(8)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                    
                }.padding(10)
                Button(action: {
                    self.textStyle = (self.textStyle == .body) ? .title1 : .body
                }) {
                    Image(systemName: "textformat")
                        .padding(8)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .cornerRadius(30)
                        .foregroundColor(.gray)
                }.padding(10)
            }.padding(.vertical)
        }
            .onAppear(perform: setTemplate)
            .onDisappear(perform: saveTemplate)
            .navigationBarTitle("Make A Template", displayMode: .inline)
        }
        
    func setTemplate() -> Void {
        self.templateEntry = self.template
    }
    
    func saveTemplate() -> Void {
        self.template = self.templateEntry
    }
}
