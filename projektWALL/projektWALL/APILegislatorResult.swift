//
//  APILegislatorResult.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ObjectMapper

struct APILegislatorResult: Mappable {
    var results: [Legislator]!
    var count: Int!
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        results <- map["results"]
        count <- map["count"]
    }
}
