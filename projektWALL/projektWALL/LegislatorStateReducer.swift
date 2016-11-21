//
//  LegislatorStateReducer.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire


func legislatorStateReducer(action: Action, state: LegislatorState?) -> LegislatorState {
    var state = state ?? initialState()
    
    switch action {
    case let action as SetLegislators:
        state.legislators = action.legislators
    default:
        break
    }
    
    return state
}

func initialState() -> LegislatorState {
    return LegislatorState(legislators: nil)
}
