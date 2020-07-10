//
//  (V)SupportUsView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/30/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_SupportUsView: View {
    @Binding var showSheetView: Bool

    var body: some View {
        NavigationView {
            
            Text("List of notifications")
                
            // Navigation bar settings
            .navigationBarTitle(Text("New Template"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                    self.showSheetView = false
                }) {
                    Text("Done").bold()
                })
        }
    }
}

