//
//  (M)TemplateLibrary.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 6/29/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import Foundation

struct TemplateLibraryStruct {

    // MARK: - Fields
    private(set) var library: Array<TemplateInfo> = [TemplateInfo(template: """
    Dear (insert MP’s name),

    I hope this email finds you well in our troubled times.

    I, like many others have watched in abject horror the violence being used against peaceful protesters in the USA. I have watched as peaceful protesters exclaiming Black Lives Matter (BLM) have been met with undue force, tear gas and batons from the very people who pledged to protect and serve. I am also concerned about the possibility of protests in the UK being met with undue force by police.

    If it were not enough that black and brown people have to contend with the health inequalities and disparities that have surfaced due to Covid-19, we are seeing the specific continuation of excessive force by police against black people. In the wake of the murders of Ahmaud Abery, George Floyd and Breonna Taylor, all at the hands of former or current law enforcement officers, people have taken to the streets (in the midst of the pandemic) to express their rage.

    I was disconcerted to see the Secretary of State for the Foreign and Commonwealth Affairs, Dominic Raab MP, refuse to hold Donald Trump to account for his incitement to violence against protesters. As Foreign Secretary, it is his role to call out threats to democratic participation as they occur across the globe. If Trump's rhetoric had come from a leader in the continent of Africa or Asia, Raab would be the first in line to issue his denouncement. If Dominic Raab cannot speak out for peaceful protestors in the US, we cannot trust that he would speak up for us. I am also flabbergasted at reports that the UK could be sending tear gas, riot shield and rubber bullets.

    In the UK, we are facing our own problems. BAME organisations and those working in the criminal justice sector, warned that new police powers provided under coronavirus legislation would detrimentally impact BAME communities. Before Covid-19, black people in England and Wales were 40 times more likely to be stopped and searched. It was no surprise then when a Guardian report recently revealed that BAME people in England were 54% more likely to be fined under the new coronavirus rules than white people. In England, BAME people account for 15.5% of the population and yet they received 22% of the coronavirus lockdown fines.

    It has long been known that black people in the UK also experience death disproportionately during or following police contact, especially within police custody and detention. Black people are also disproportionately subjected to taser use.

    In the coming days, protesters will take to the streets in the UK to stand in solidarity for the BLM protests in the USA, and to support the BLM movements and issues in the UK. As my MP, I call on you to stand with  the protestors in the US, the UK, and globally and work to eradicate the same structural racial injustices that plague the United Kingdom today.

    I have four specific asks:

    Please write to Dominic Raab MP and ask him to condemn the words and actions of the President of the USA, and call for him to suspend the attack on protesters;
    Please write to the Prime Minister and ask him to denounce Trump's militarisation of the protests in the USA;
    Please write to the Home Secretary Priti Patel and ask her to make assurances that UK protesters will not be met with excessive use of force;
    Call on the government to immediately suspend licences for tear gas, riot shields and rubber bullets to the USA.
    Additionally, please personally commit to proactively increasing your understanding of these issues and to take a stand against structural racism in your position as Member of Parliament whenever you encounter it.

    [If your MP is Black or other POC - and particularly a woman - you can add the below paragraph or something similar:

    I know that standing up as a Black/POC man/woman in a white, male dominated parliament is not an easy task, and that you may be subject to backlash in the media, online and maybe even in your workplace as a result. I want to acknowledge and honour your courage. I stand by you as do many others.]

    I look forward to hearing from you.

    Best wishes,

    (Insert name, Post code)
    """, title: "BLM", description: """
    Words of solidarity can be powerful, but real, meaningful change in the fight against racism and white supremacy will only come through action. Please write to your MP calling on them to take racial justice seriously.
    """, upvotes: 90, id: 0),
        TemplateInfo(template: "If you see this it worked", title: "Test email", description: "I want that supa dank weed", recipients: ["Jbwilsonhockey9@gmail.com","alec.o.miller.21@dartmouth.edu","miles.f.w.7@gmail.com"], upvotes: 53, id: 1),
        TemplateInfo(template: "template 3", title: "Double line title double line title double line title double line title double line title double line title double line title double line title", description: "yolo", recipients: ["harasnunn@gmail.com"], upvotes: 17, id: 2),
        TemplateInfo(template: "template 4", title: "Sent template", description: "Already been sent", hasBeenSent: true, upvotes: 70, id: 3),
        TemplateInfo(template: "template 5", title: "blank 1", description: "blank", upvotes: 10, state: StatesEnum.Alaska, id: 4),
        TemplateInfo(template: "template 6", title: "blank 2 ", description: "blank", upvotes: 50, state: StatesEnum.Alaska, id: 5),
        TemplateInfo(template: "template 7", title: "blank 3", description: "blank", upvotes: 8, state: StatesEnum.NewJersey, id: 6),
        TemplateInfo(template: "template 8", title: "blank 4 ", description: "blank", upvotes: 12, state: StatesEnum.Wyoming, id: 7),
        TemplateInfo(template: "template 9", title: "blank 5", description: "blank", upvotes: 6, state: StatesEnum.NewJersey, id: 8),
        TemplateInfo(template: "template 10", title: "blank 6", description: "blank", upvotes: 5, state: StatesEnum.California, id: 9)]
    
    
    // MARK: - Methods
    mutating func makeTemplateBeSent(template: TemplateInfo) -> Void {
        let chosenIndex: Int = self.index(of: template)
        self.library[chosenIndex].send()
    }
    
    mutating func addTemplate(title: String, recipients: Array<String>, description: String, template: String, region: StatesEnum) -> Void {
        self.library.append(TemplateInfo(template: template, title: title, description: description, recipients: recipients, hasBeenSent: false, upvotes: 0, state: region, id: self.library.count))
    }
    
    mutating func upvote(template: TemplateInfo) -> Void {
        let tempIndex = self.index(of: template)
        self.library[tempIndex].upvote()
    }
    
    mutating func downvote(template: TemplateInfo) -> Void {
        let tempIndex = self.index(of: template)
        self.library[tempIndex].downvote()
    }
    
    private func index(of template: TemplateInfo) -> Int {
        for index in 0..<self.library.count {
            if self.library[index].id == template.id {
                return index
            }
        }
        return 0 // TODO: bogus!
    }
}
