//
//  APIError.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import ObjectMapper

struct APIError: Mappable, Error {
    var status: Int!
    var type: String!
    var message: String!
    
    
    init?(map: Map) {}
    
    init(status: Int!, type: String!, message: String!) {
        self.status = status
        self.type = type
        self.message = message
    }
    
    mutating func mapping(map: Map) {
        status        <- map["status"]
        type          <- map["type"]
        message       <- map["message"]
    }
}
