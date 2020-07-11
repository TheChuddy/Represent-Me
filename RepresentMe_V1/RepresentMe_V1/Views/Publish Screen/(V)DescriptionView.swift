//
//  (V)DescriptionView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 7/10/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_DescriptionView: View {
    @State var descriptionEntry: String = ""
    @Binding var description: String
    @State private var textStyle = UIFont.TextStyle.body
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            TextView(text: $descriptionEntry, textStyle: $textStyle)
                .padding()
                .padding(.top, 35)
            HStack {
                Button(action: {
                    self.textStyle = (self.textStyle == .body) ? .title1 : .body
                }) {
                    Image(systemName: "textformat")
                        .padding(8)
                        .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
        .onAppear(perform: setDescription)
        .onDisappear(perform: saveDescription)
        .navigationBarTitle("Write A Description", displayMode: .inline)
    }
    
    func setDescription() -> Void {
        self.descriptionEntry = self.description
    }
    
    func saveDescription() -> Void {
        self.description = self.descriptionEntry
    }
}
