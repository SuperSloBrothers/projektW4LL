//
//  UpcomingBillsStateActions.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import ReSwift

struct SetUpcomingBills: Action {
    let newUpcomingBills: Result<[UpcomingBill]>?
}

func getUpcomingBills(url: URL = URL(string: "https://congress.api.sunlightfoundation.com/upcoming_bills")!) -> Store<RootState>.ActionCreator {
    return { state, store in
        
        Alamofire.request(url).responseJSON { response in
            // This block is called asynchronously.
            
            guard let json = response.result.value else {
                let apiError = APIError(status: response.response?.statusCode ?? 400, type: "invalid", message: response.result.error?.localizedDescription ?? "could not load upcoming bills")
                store.dispatch(SetUpcomingBills(newUpcomingBills: Result.failure(apiError)))
                return
            }
            guard response.response?.statusCode == 200 else {
                let apiError = Mapper<APIError>().map(JSONObject: json)!
                store.dispatch(SetUpcomingBills(newUpcomingBills: Result.failure(apiError)))
                return
            }
            
            if let upcomingBills = Mapper<APIUpcomingBillResult>().map(JSONObject: json) {
                store.dispatch(SetUpcomingBills(newUpcomingBills: Result.success(upcomingBills.results)))
            }
        }
        
        return SetUpcomingBills(newUpcomingBills: nil)
    }
}
