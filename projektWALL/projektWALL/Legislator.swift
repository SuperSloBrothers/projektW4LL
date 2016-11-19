//
//  Legislator.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation


struct Legislator {
    
    // MARK: - Properties
    
    // Basic Info
    var title: Title
    var firstName: String
    var middleName: String?
    var lastName: String
    var nameSuffix: String?
    var nickname: String?
    var gender: String
    var birthday: Date
    
    // Other Info
    var leadershipRole: String?
    var state: String
    var stateName: String
    var district: Int
    var chamber: Chamber
    var party: Party
    var office: String
    var inOffice: Bool
    var termEnd: Date
    var termStart: Date
    
    // Contact Info
    var contactForm: URL
    var fax: Int?
    var ocEmail: String?
    var phone: Int
    var website: URL?
    
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
    }
    
    enum Chamber: String {
        case house
        case senate
    }
    
    enum Party: String {
        case democrat
        case republican
    }

}
