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
                    HStack {
                        Text("Description:").padding(.trailing)
                        TextField("Why is this important?", text: $descriptionEntry).multilineTextAlignment(.trailing)
                    }
                }
                Section {
                    HStack {
                        Text("Template:").padding(.trailing)
                        TextField("Make your template", text: $templateEntry)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .listStyle(GroupedListStyle()).environment(\.horizontalSizeClass, .regular)
            // Navigation bar settings
            .navigationBarTitle(Text("Create"), displayMode: .inline)
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
        }
    }
    
    func saveTemplate() -> Void {
        var emails: Array<String> = []
        emails.append(recipientsEntry)
        if (titleEntry.count == 0 || recipientsEntry.count == 0 || descriptionEntry.count == 0 || templateEntry.count == 0) {
            self.showAlert.toggle()
        }
        else {
            self.homeLibrary.addTemplate(title: titleEntry, recipients: emails, description: descriptionEntry, template: templateEntry, region: region)
            self.showSheetView.toggle()
        }
    }
}

