//
//  Legislator.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation


/// For descriptions of its properties go to https://sunlightlabs.github.io/congress/legislators.html
struct Legislator {
    
    // MARK: - Properties
    
    // Names
    var firstName: String
    var nickname: String?
    var lastName: String
    var middleName: String?
    var nameSuffix: String?
    
    var inOffice: Bool
    var party: Party
    var gender: String
    var state: String
    var stateName: String
    var district: Int?
    var title: Title
    var chamber: Chamber
    var senateClass: Int?
    var stateRank: String?
    var birthday: Date
    var termEnd: Date
    var termStart: Date
    
    // Other Info
    var leadershipRole: String?
    
    // Contact Info
    var ocEmail: String?
    var phone: Int
    var website: URL?
    var office: String
    var contactForm: URL
    var fax: Int?
    
//    var fec_ids: [String]
//    var govtrack_id: Int
//    var bioguide_id: String 
//    var crp_id: String
//    var ocd_id: String
//    var thomas_id: String
    
    
    // MARK: - Supporting Functionality
    
    enum Title: String {
        case rep = "Rep"
        case sen = "Sen"
        case del = "Del"
        case com = "Com"
    }
    
    enum Chamber: String {
        case house
        case senate
    }
    
    enum Party: String {
        case democrat = "D"
        case republican = "R"
        case independent = "I"
    }

}
