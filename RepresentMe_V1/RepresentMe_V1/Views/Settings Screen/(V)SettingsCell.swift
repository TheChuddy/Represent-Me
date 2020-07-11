//
//  (V)SettingsCell.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/30/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_SettingsCell: View {
    
    var title: String
    var imageName: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .font(.headline)
                .foregroundColor(color)
            Text(title)
                .font(.headline)
                .padding(.leading, 20)
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(Color.gray)
        }
    }
}

struct _V_SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        _V_SettingsCell(title: "", imageName: "", color: Color.red)
    }
}
