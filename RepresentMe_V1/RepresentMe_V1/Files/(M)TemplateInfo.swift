//
//  (M)TemplateInfo.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import Foundation

struct TemplateInfo: Identifiable {
    // MARK: - Fields
    private(set) var template: String
    private(set) var title: String
    private(set) var description: String = ""
    private(set) var recipients: Array<String> = [""]
    private(set) var hasBeenSent: Bool = false
    private(set) var upvotes: Int = 0
    private(set) var state: StatesEnum = StatesEnum.National
    var id: Int
    
    // MARK: - Methods
    mutating func send() -> Void {
        self.hasBeenSent = true
    }
    
    mutating func upvote() -> Void {
        self.upvotes += 1
    }
    
    mutating func downvote() -> Void {
        self.upvotes -= 1
    }
    
    func getTemplate() -> String {
        self.template
    }
    
    mutating func setTemplate(to: String) -> Void {
        self.template = to
    }
    
    func getTitle() -> String {
        self.title
    }
    
    mutating func setTitle(to: String) -> Void {
        self.title = to
    }
    
    func getDescription() -> String {
        self.description
    }
    
    mutating func setDescription(to: String) -> Void {
        self.description = to
    }
    
    func getRecipients() -> Array<String> {
        self.recipients
    }
    
    mutating func setTitle(to: Array<String>) -> Void {
        self.recipients = to
    }
    
    func getHasBeenSent() -> Bool {
        self.hasBeenSent
    }
    
    mutating func setHasBeenSent(to: Bool) -> Void {
        self.hasBeenSent = to
    }
    
    func getUpvotes() -> Int {
        self.upvotes
    }
    
    func getState() -> StatesEnum {
        self.state
    }
    
    mutating func setState(to: StatesEnum) -> Void {
        self.state = to
    }
}
