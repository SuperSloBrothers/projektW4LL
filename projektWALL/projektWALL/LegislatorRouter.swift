//
//  LegislatorRouter.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//


import Foundation
import Alamofire

// USAGE:
// a Router is passed in the Alamofire.request method
// a Router will specify whether this request will be 
// an HTTP - GET, POST, PATCH, or DELETE - request


// When using .Read or .Update (corresponds to GET, PATCH respectively)
// usually you must specify a specific object of that endpoint by an ID
// example:
// Barbara Boxer has an ID: 12345
// We want to ONLY see Boxer's info when we call /legislators
// so our URL will be "https://congress.api.sunlightfoundation.com/legislators/12345"
// -
// you can use the Router to get that request by passing LegislatorRouter.Read("12345", nil)
// if we wanna get all legislators (i.e. "https://congress.api.sunlightfoundation.com/legislators")
// then our router will be LegislatorRouter.Read(nil, nil)

// Now an example showing how to pass a Dictionary as parameters
// lets say we want to search all Legislators and query by age (search for > 60 years old)
// and we want to sort them by last name
// our URL would like this (completely making this up for this endpoint but this is usually how it'll look)
// URL -> " https://congress.api.sunlightfoundation.com/legislators?query={"age":">60"}&sort="lastName" "
// -- Router way to do it --
// we can make a parameters dictionary
// var parameters: [String: AnyObject]
// parameters = [
//    "query": "{"age":">60"}
//    "sort": "lastName"
//  ]
// you would then pass LegislatorRouter.Read(nil, parameters) as the request!

// SO, using a Router allows us to organize/save code when we are dealing with requests with
// an endpoint that may be used often.

// You can write an Action that deals with just a specific endpoint, and with simply 3 parameters
// -> RequestType (whether its a GET, POST, or etc, this would specify if the Router uses .Read, .Create, etc)
// -> Id? (this is the String parameter of the Router which is optional and nil if you just want all items at the endpoint! The Id is to just retrieve/deal with a specific object)
// -> Parameters? (an optional dictionary where you can put the parameters you want to include in the request

// This is Amir Saifi's Router crash course. Thank you for reading 8==D

// see getLegislators() in LegislatorStateActions.swift
// for usage example...



enum LegislatorRouter: URLRequestConvertible {
    
    static let baseURLString = "https://congress.api.sunlightfoundation.com/"
    static let endpointString = "legislators"
    static var OAuthToken: String?
    
    // The String parameter usually specifies an ID to go immediately after the endpoint 
    // The Dictionary corresponds to parameters we want to include in the request
    case Create([String: AnyObject])
    case Read(String?, [String: AnyObject]?)
    case Update(String, [String: AnyObject])
    case Delete(String)
    
    var method: HTTPMethod {
        switch self {
        case .Create:
            return .post
        case .Read:
            return .get
        case .Update:
            return .patch
        case .Delete:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .Create:
            return LegislatorRouter.endpointString
        case .Read(let _id, _):
            if let _id = _id {
                return  "\(LegislatorRouter.endpointString)/\(_id)"
            } else {
                return LegislatorRouter.endpointString
            }
        case .Update(let _id, _):
            return "\(LegislatorRouter.endpointString)/\(_id)"
        case .Delete(let _id):
            return "\(LegislatorRouter.endpointString)/\(_id)"
        }
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        let url = URL(string: LegislatorRouter.baseURLString)!
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        if let token = LegislatorRouter.OAuthToken {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .Create(let parameters):
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        case .Update(_, let parameters):
            return try Alamofire.JSONEncoding.default.encode(urlRequest, with: parameters)
        case .Read(_, let parameters):
            if let parameters = parameters {
                return try Alamofire.URLEncoding.default.encode(urlRequest, with: parameters)
            }
            return urlRequest
        case .Delete:
            return urlRequest
        }
    }
    
}


