//
//  (V)HomeCardView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_HomeCardView: View {
    var template: TemplateInfo
//    var up: () -> Void
//    var down: () -> Void
        
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "arrow.up.circle")
                    .foregroundColor(self.template.getHasBeenSent() ? .gray : Color.init(red: 255/256, green: 155/256, blue: 84/256))
                Text("\(template.getUpvotes())")
                    .font(Font.system(size: 10))
                    .foregroundColor(self.template.getHasBeenSent() ? .gray : Color.init(red: 255/256, green: 155/256, blue: 84/256))
            }
                .padding()
            VStack(alignment: .leading) {
                Text(self.template.getTitle())
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .padding(.top, 3)
                HStack {
                    Text(self.template.getDescription())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .padding(.vertical, 3)
                    Spacer()
                    Text(template.getState().rawValue)
                        .fontWeight(.heavy)
                        .font(Font.system(size: 9))
                        .foregroundColor(self.template.getHasBeenSent() ? .gray : .green)
                    Text("6/20/20") // TODO: don't hardcode this
                        .fontWeight(.heavy)
                        .font(Font.system(size: 9))
                        .foregroundColor(.secondary)
                }.padding(.vertical, 3)
            }
        }
        .opacity(self.template.getHasBeenSent() ? 0.5 : 1)
    }
}
