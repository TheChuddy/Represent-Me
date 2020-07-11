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
    @Environment(\.colorScheme) var colorScheme
        
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.template.getTitle())
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .lineLimit(1)
                Text(self.template.getDescription())
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .lineLimit(4)
                    .padding(.vertical, 5)
                HStack {
                    Text(template.getState().rawValue)
                        .font(Font.system(size: 9, weight: .heavy))
                        .foregroundColor(self.template.getHasBeenSent() ? (colorScheme == .dark ? .white : .black) : Color.init(red: 81/256, green: 162/256, blue: 22/256))
                    Text("6/20/20") // TODO: don't hardcode this
                        .font(Font.system(size: 9, weight: .heavy))
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            VStack {
                Image(systemName: "chevron.up")
                    .foregroundColor(self.template.getHasBeenSent() ? (colorScheme == .dark ? .white : .black) : Color.init(red: 255/256, green: 155/256, blue: 84/256))
                Text("\(template.getUpvotes())")
                    .font(Font.system(size: 10))
                    .foregroundColor(self.template.getHasBeenSent() ? (colorScheme == .dark ? .white : .black) : Color.init(red: 255/256, green: 155/256, blue: 84/256))
            }
        }
        .opacity(self.template.getHasBeenSent() ? 0.5 : 1)
    }
}












//
//
//struct _V_HomeCardView: View {
//    var template: TemplateInfo
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        HStack {
//            VStack {
//                Image(systemName: "arrow.up.circle")
//                    .foregroundColor(self.template.getHasBeenSent() ? .gray : Color.init(red: 255/256, green: 155/256, blue: 84/256))
//                Text("\(template.getUpvotes())")
//                    .font(Font.system(size: 10))
//                    .foregroundColor(self.template.getHasBeenSent() ? .gray : Color.init(red: 255/256, green: 155/256, blue: 84/256))
//            }
//            .padding(.trailing)
//            VStack(alignment: .leading) {
//                Text(self.template.getTitle())
//                    .foregroundColor(colorScheme == .dark ? .white : .black)
//                    .font(.headline)
//                    .fontWeight(.bold)
//                    .lineLimit(2)
//                    .padding(.top, 3)
//                HStack {
//                    Text(self.template.getDescription())
//                        .font(.subheadline)
//                        .foregroundColor(.secondary)
//                        .lineLimit(1)
//                        .padding(.vertical, 3)
//                    Spacer()
//                    Text(template.getState().rawValue)
//                        .font(Font.system(size: 9, weight: .heavy))
//                        .foregroundColor(self.template.getHasBeenSent() ? .gray : Color.init(red: 81/256, green: 162/256, blue: 22/256))
//                    Text("6/20/20") // TODO: don't hardcode this
//                        .font(Font.system(size: 9, weight: .heavy))
//                        .foregroundColor(.secondary)
//                }.padding(.vertical, 3)
//            }
//        }
//        .opacity(self.template.getHasBeenSent() ? 0.5 : 1)
//    }
//}
