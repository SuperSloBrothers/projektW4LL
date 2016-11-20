//
//  LegislatorRouter.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//


import Foundation
import Alamofire
/*
enum LegislatorRouter: URLRequestConvertible {
    static let baseURLString = "http://api.clubspeedsport.com/api/v1"
    static let endpointString = "emailTemplates"
    static var OAuthToken: String?
    static var VenueId: String?
    
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
            return "/\(LegislatorRouter.endpointString)"
        case .Read(let _id, _):
            if let _id = _id {
                return  "/\(LegislatorRouter.endpointString)/\(_id)"
            } else {
                return "/\(LegislatorRouter.endpointString)"
            }
        case .Update(let _id, _):
            return "/\(LegislatorRouter.endpointString)/\(_id)"
        case .Delete(let _id):
            return "/\(LegislatorRouter.endpointString)/\(_id)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        
        var mutableURLRequest = NSMutableURLRequest()
        let URLEscapedAddressString = "\(LegislatorRouter.baseURLString)\(path)".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        if let URLEscapedAddress = NSURL(string: URLEscapedAddressString) {
            mutableURLRequest = NSMutableURLRequest(URL: URLEscapedAddress)
        }
        
        mutableURLRequest.httpMethod = method.rawValue
        
        if let token = LegislatorRouter.OAuthToken {
            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let venueId = LegislatorRouter.VenueId {
            mutableURLRequest.setValue(venueId, forHTTPHeaderField: "CS-Venue-Id")
        }
        
        switch self {
        case .Create(let parameters):
            return Alamofire.JSONEncoding.encode()
        case .Update(_, let parameters):
            return Alamofire.JSONEncoding.en
        case .Read(_, let parameters):
            if let parameters = parameters {
                return Alamofire.ParameterEncoding.URLEncodedInURL.encode(mutableURLRequest, parameters: parameters).0
            }
            return mutableURLRequest
        default:
            return mutableURLRequest
        }
    }
}*/
