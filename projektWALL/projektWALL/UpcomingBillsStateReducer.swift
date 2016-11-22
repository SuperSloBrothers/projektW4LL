//
//  UpcomingBillsStateReducer.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import ObjectMapper

func upcomingBillsStateReducer(action: Action, state: UpcomingBillsState?) -> UpcomingBillsState {
    // Default state for initialization purposes
    var state = state ?? UpcomingBillsState(upcomingBills: nil)
    
    // remove this switch statement if there's only one action
    switch action {
    case let action as SetUpcomingBills: state.upcomingBills = action.newUpcomingBills
    default: break
    }
    
    return state
}
