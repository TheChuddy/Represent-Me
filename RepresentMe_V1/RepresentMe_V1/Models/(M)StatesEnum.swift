//
//  (M)StatesEnum.swift
//  RepresentMe_V1
//
//  Created by Lucas Nunn on 7/2/20.
//  Copyright © 2020 Lucas Nunn. All rights reserved.
//

import Foundation
import SwiftUI

enum StatesEnum: String, Equatable, CaseIterable {
    
    case National = "National"
    case Alaska = "Alaska"
    case Alabama = "Alabama"
    case Arkansas = "Arkansas"
    case AmericanSamoa = "American Samoa"
    case Arizona = "Arizona"
    case California = "California"
    case Colorado = "Colorado"
    case Connecticut = "Connecticut"
    case DistrictOfColumbia = "District of Columbia"
    case Delaware = "Delaware"
    case Florida = "Florida"
    case Georgia = "Georgia"
    case Guam = "Guam"
    case Hawaii = "Hawaii"
    case Iowa = "Iowa"
    case Idaho = "Idaho"
    case Illinois = "Illinois"
    case Indiana = "Indiana"
    case Kansas = "Kansas"
    case Kentucky = "Kentucky"
    case Louisiana = "Louisiana"
    case Massachusetts = "Massachusetts"
    case Maryland = "Maryland"
    case Maine = "Maine"
    case Michigan = "Michigan"
    case Minnesota = "Minnesota"
    case Missouri = "Missouri"
    case Mississippi = "Mississippi"
    case Montana = "Montana"
    case NorthCarolina = "North Carolina"
    case NorthDakota = "North Dakota"
    case Nebraska = "Nebraska"
    case Nevada = "Nevada"
    case NewHampshire = "New Hampshire"
    case NewJersey = "New Jersey"
    case NewMexico = "NewMexico"
    case NewYork = "NewYork"
    case Ohio = "Ohio"
    case Oklahoma = "Oklahoma"
    case Oregon = "Oregon"
    case Pennsylvania = "Pennsylvania"
    case PuertoRico = "Puerto Rico"
    case RhodeIsland = "Rhode Island"
    case SouthCarolina = "South Carolina"
    case SouthDakota = "South Dakota"
    case Tennessee = "Tennessee"
    case Texas = "Texas"
    case Utah = "Utah"
    case Virginia = "Virginia"
    case VirginIslands = "Virgin Islands"
    case Vermont = "Vermont"
    case Washington = "Washington"
    case Wisconsin = "Wisconsin"
    case WestVirginia = "West Virginia"
    case Wyoming = "Wyoming"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
