//
//  (V)MakeNewTemplateSheet.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 7/1/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import SwiftUI

struct _V_MakeNewTemplateSheet: View {
    @ObservedObject var homeLibrary: TemplateLibrary
    @Binding var showSheetView: Bool
    @State private var showAlert: Bool = false
    @State var titleEntry: String = ""
    @State var recipientsEntry: String = ""
    @State var descriptionEntry: String = ""
    @State var templateEntry: String = ""
    @State var region: StatesEnum = StatesEnum.National
    @State var description: String = ""
    @State var template: String = ""

    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Text("Title:").padding(.trailing)
                        TextField("Give it a title", text: $titleEntry).multilineTextAlignment(.trailing)
                    }
                    HStack {
                        Text("Email(s):").padding(.trailing)
                        TextField("Enter as comma separated list", text: $recipientsEntry).multilineTextAlignment(.trailing)
                    }
                    Picker(selection: $region, label: Text("Pick a region:")) {
                        ForEach(StatesEnum.allCases, id:  \.self) { value in
                            Text(value.localizedName).tag(value)
                            }
                        }
                }
                Section {
                    NavigationLink(destination: _V_DescriptionView(descriptionEntry: descriptionEntry, description: self.$description)) {
                        HStack {
                            Text("Description: ")
                            Text(description).lineLimit(1)
                        }
                    }
                    NavigationLink(destination: _V_TemplateView(templateEntry: templateEntry, template: self.$template)) {
                        HStack {
                            Text("Template: ")
                            Text(template).lineLimit(1)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
            // Navigation bar settings
            .navigationBarItems(
                leading:
                Button(action: {self.showSheetView.toggle()}) {
                    Text("Cancel").bold()
                    .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        .fontWeight(.black)
                    .padding()
                },
                trailing:
                Button(action: {self.saveTemplate()}) {
                    Text("Create").bold()
                    .foregroundColor(Color.init(red: 255/256, green: 155/256, blue: 84/256))
                        .fontWeight(.black)
                    .padding()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Couldn't Create"), message: Text("Make sure to fill out all the sections properly"), dismissButton: .default(Text("Ok")))
                }
            )
        }.accentColor(.orange)
    }
    
    func saveTemplate() -> Void {
        var emails: Array<String> = []
        emails.append(recipientsEntry)
        if (titleEntry.count == 0 || recipientsEntry.count == 0 || description.count == 0 || template.count == 0) {
            self.showAlert.toggle()
        }
        else {
            self.homeLibrary.addTemplate(title: titleEntry, recipients: emails, description: description, template: template, region: region)
            self.showSheetView.toggle()
        }
    }
}

