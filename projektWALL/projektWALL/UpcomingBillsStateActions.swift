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
    let newUpcomingBills: Result<[UpcomingBill]>!
}

func getUpcomingBills(url: URL = URL(string: "https://congress.api.sunlightfoundation.com/upcoming_bills")!) -> Store<RootState>.ActionCreator {
    return { state, store in
        
        let request = Alamofire.request(url).responseJSON(completionHandler: { (response) in
            <#code#>
        })
        
    }
}
