//
//  APIUpcomingBillResult.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ObjectMapper

struct APIUpcomingBillResult: Mappable {
    var results: [UpcomingBill]!
    var count: Int!
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        results <- map["results"]
        count   <- map["count"]
    }
}
