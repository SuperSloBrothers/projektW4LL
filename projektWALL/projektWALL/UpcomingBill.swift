//
//  UpcomingBill.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ObjectMapper

/// https://sunlightlabs.github.io/congress/upcoming_bills.html
struct UpcomingBill: Mappable {
    
    /// The legislative day the bill is scheduled for. Combine with `range` to understand precision.
    var legislativeDay: String?
    
    /// How precise `legislativeDay` is. If `range` is "day": `legislativeDay` is accurate. If `range` is "week": bill is scheduled for the week of `legislativeDay`. If `range` is nil: bill is scheduled at an indefinite time in the future.
    var range: String!
    
    /// The number of the congress which has scheduled this bill.
    var congress: Int!
    
    /// The chamber which has scheduled this bill.
    var chamber: String!
    
//    var sourceType: String!
//    var scheduledAt: String!
    
    /// Senate only - some context of what kind of activity will be occurring to the bill.
    var context: String?
    
    /// For the House, this may be a PDF.
    var url: String!
    
    /// This could be used to make a Request to this specific bill (maybe).
    var billID: String!
    
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        legislativeDay  <- map["legislative_day"]
        range           <- map["range"]
        congress        <- map["congress"]
        chamber         <- map["chamber"]
        context         <- map["context"]
        url             <- map["url"]
        billID          <- map["bill_id"]
    }
}
