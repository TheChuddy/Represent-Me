//
//  (V)TemplateInfoView.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

struct _V_TemplateInfoView: View {
    var template: TemplateInfo
    @ObservedObject var homeLibrary: TemplateLibrary
    @State private var showSheet = false
    @State private var showAlert: Bool = false
    @State var result: Result<MFMailComposeResult, Error>? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                if template.getHasBeenSent() {
                    Text("How to do more:")
                        .font(Font.title)
                        .fontWeight(.heavy)
                        .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.blue)
                            .frame(height: 100)
                            .padding()
                        Button(action: {}) {
                            Text("share this template")
                                .font(Font.title)
                                .foregroundColor(Color.white)
                                .fontWeight(.black)
                                .padding()
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.orange)
                            .frame(height: 100)
                            .padding()
                        Button(action: {}) {
                            Text("like this template")
                                .font(Font.title)
                                .foregroundColor(Color.white)
                                .fontWeight(.black)
                                .padding()
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                            .frame(height: 100)
                            .padding()
                        Button(action: {}) {
                            Text("make a template")
                                .font(Font.title)
                                .foregroundColor(Color.white)
                                .fontWeight(.black)
                                .padding()
                        }
                    }
                }
                    // MARK: -A regular, not yet sent template
                else {
                    Text("Description")
                        .fontWeight(.heavy)
                        .font(Font.title)
                        .padding()
                    Text(template.getDescription())
                        .padding()
                    Spacer(minLength: 30)
                    HStack {
                        Button(action: {self.homeLibrary.upvote(template: self.template)}) {
                            Image(systemName: "arrowtriangle.up.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                            .padding(5)
                            .foregroundColor(Color.green)
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up.on.square")
                                .resizable()
                                .frame(width: 40, height: 50)
                        }
                            .padding()
                        Button(action: {self.homeLibrary.downvote(template: self.template)}) {
                            Image(systemName: "arrowtriangle.down.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                            .padding(5)
                            .foregroundColor(Color.orange)
                    }
                }
            }
            .navigationBarTitle("\(template.getTitle())", displayMode: .inline)
            .sheet(isPresented: $showSheet) {
                MailView(result: self.$result, newSubject: self.template.getTitle(), newMsgBody: self.template.getTemplate(), newRecipients: self.template.getRecipients())
            }
            .navigationBarItems(
                trailing:
                Button(action: {self.sendMail()}) {
                        Image(systemName: "paperplane")
                    }
                    .imageScale(.large)
                    .padding(12)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Couldn't Configure"), message: Text("Make sure to configure email in the IOS mail app"), dismissButton: .default(Text("Ok")))
                    }
            )
        }
    }
    
    func sendMail() {
        if MFMailComposeViewController.canSendMail() {
            self.showSheet = true
        } else {
            self.showAlert.toggle()
        }
    }
}
