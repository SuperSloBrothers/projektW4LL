//
//  AmirStateActions.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire
import ObjectMapper

struct SetName: Action {
    let name: String?
}

struct SetThings: Action {
    let things: [AnyObject]
}

struct SetThingsFromOnline: Action {
    let thingsFromOnline: Result<[AnyObject]>?
}

func getThingsFromOnline() -> Store<RootState>.ActionCreator {
    return { state, store in
        
        let request = Alamofire.request("https://congress.api.sunlightfoundation.com/legislators").responseJSON { response in
            guard let JSON = response.result.value else {
                let apiError = APIError(status: response.response?.statusCode ?? 400, type: "invalid", message: response.result.error?.localizedDescription ?? "could not load legislators")
                store.dispatch(SetLegislators(legislators: Result.failure(apiError)))
                return
            }
            guard response.response?.statusCode == 200 else {
                let apiError = Mapper<APIError>().map(JSONObject: JSON)
                store.dispatch(SetLegislators(legislators: Result.failure(apiError!)))
                return
            }
            if let legislators = Mapper<APILegislatorResult>().map(JSONObject: JSON) {
                store.dispatch(SetLegislators(legislators: Result.success(legislators.results)))
            }
            
        }
        print(debugPrint(request))
        
        return SetLegislators(legislators: nil)
    }
    
}
