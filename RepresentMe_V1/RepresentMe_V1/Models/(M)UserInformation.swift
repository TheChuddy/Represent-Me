//
//  (M)UserInformation.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 7/1/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import Foundation

struct UserInformation {
    
    // MARK: - Fields
    // Information for autofill
    private(set) var userName: String
    private(set) var userStreetAddress: String
    private(set) var userCity: String
    private(set) var userState: StatesEnum
    private(set) var userZipCode: String
    private(set) var userPhoneNum: String
    
    // Information for filter
    private(set) var sortingByPopular: Bool
    private(set) var sortingByNew: Bool
    private(set) var sortingByRegion: Bool
    private(set) var sortRegion: StatesEnum

    // MARK: - Methods
    
    mutating func updateUserInfo(name: String, address: String, city: String, state: StatesEnum, zip: String, num: String) -> Void {
        self.userName = name
        self.userStreetAddress = address
        self.userCity = city
        self.userState = state
        self.userZipCode = zip
        self.userPhoneNum = num
        print(self)
    }
    
    mutating func updateFilteringInfo(sortPop: Bool, sortNew: Bool, sortReg: Bool, region: StatesEnum) {
        self.sortingByPopular = sortPop
        self.sortingByNew = sortNew
        self.sortingByRegion = sortReg
        self.sortRegion = region
        print(self)
    }
    
    func getUserName() -> String {
        self.userName
    }
    
    mutating func setUserName(to: String) {
        self.userName = to
    }
    
    func getUserStreetAddress() -> String {
        self.userStreetAddress
    }
    
    mutating func setUserStreetAddress(to: String) {
        self.userStreetAddress = to
    }
    
    func getUserCity() -> String {
        self.userCity
    }
    
    mutating func setUserCity(to: String) {
        self.userCity = to
    }
    
    func getUserState() -> StatesEnum {
        self.userState
    }
    
    mutating func setUserState(to: StatesEnum) {
        self.userState = to
    }
    
    func getUserZip() -> String {
        self.userZipCode
    }
    
    mutating func setUserZip(to: String) {
        self.userZipCode = to
    }
    
    func getUserPhone() -> String {
        self.userPhoneNum
    }
    
    mutating func setUserPhone(to: String) {
        self.userPhoneNum = to
    }
    
    func getSortingByPopular() -> Bool {
        self.sortingByPopular
    }
    
    mutating func setSortingByPopular(to: Bool) {
        self.sortingByPopular = to
    }
    
    func getSortingByNew() -> Bool {
        self.sortingByNew
    }
    
    mutating func setSortingByNew(to: Bool) {
        self.sortingByNew = to
    }
    
    func getSortingByRegion() -> Bool {
        self.sortingByRegion
    }
    
    mutating func setSortingByRegion(to: Bool) {
        self.sortingByRegion = to
    }
    
    func getSortRegion() -> StatesEnum {
        self.sortRegion
    }
    
    mutating func setSortRegion(to: StatesEnum) {
        self.sortRegion = to
    }
}
