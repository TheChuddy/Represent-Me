//
//  (VM)TemplateLibrary.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import Foundation

class TemplateLibrary: ObservableObject {
    
    // MARK: - Fields
    @Published private var library = TemplateLibraryStruct()
    @Published private var user = UserInformation(userName: "", userStreetAddress: "", userCity: "", userState: StatesEnum.Alaska, userZipCode: "", sortingByPopular: true, sortingByNew: false, sortingByRegion: false, sortRegion: StatesEnum.National)
    
    // MARK: - Methods
    func makeTemplateBeSent(template: TemplateInfo) -> Void {
        self.library.makeTemplateBeSent(template: template)
    }
    
    func addTemplate(title: String, recipients: Array<String>, description: String, template: String, region: StatesEnum) -> Void {
        self.library.addTemplate(title: title, recipients: recipients, description: description, template: template, region: region)
    }
    
    func upvote(template: TemplateInfo) -> Void {
        self.library.upvote(template: template)
    }
    
    func downvote(template: TemplateInfo) -> Void {
        self.library.downvote(template: template)
    }
    
    func getEntries() -> Array<TemplateInfo> {
        self.library.library
    }
    
    // Functions for user information purposes
    func getUserName() -> String {
        self.user.getUserName()
    }
    
    func getUserAddress() -> String {
        self.user.getUserStreetAddress()
    }
    
    func getUserCity() -> String {
        self.user.getUserCity()
    }
    
    func getUserState() -> StatesEnum {
        self.user.getUserState()
    }
    
    func getUserZipCode() -> String {
        self.user.getUserZip()
    }
    
    func updateUserInfo(name: String, address: String, city: String, state: StatesEnum, zip: String) {
        self.user.updateUserInfo(name: name, address: address, city: city, state: state, zip: zip)
    }
    
    // Functions for filtering purposes
    func getSortingByPopular() -> Bool {
        self.user.getSortingByPopular()
    }
    
    func getSortingByNew() -> Bool {
        self.user.getSortingByNew()
    }
    
    func getSortingByRegion() -> Bool {
        self.user.getSortingByRegion()
    }
    
    func getSortRegion() -> StatesEnum {
        self.user.getSortRegion()
    }
    
    func updateFilteringInfo(sortPop: Bool, sortNew: Bool, sortReg: Bool, region: StatesEnum) {
        self.user.updateFilteringInfo(sortPop: sortPop, sortNew: sortNew, sortReg: sortReg, region: region)
    }
    
    func printUser() -> Void {
        print(self.user)
    }
    
}
