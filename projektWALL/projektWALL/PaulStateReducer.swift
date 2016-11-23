//
//  PaulStateReducer.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire

func paulStateReducer(action: Action, state: PaulState?) -> PaulState {
    let state = state ?? initialState()
    
    // switch statement for reducing actions into the state goes here
    // see LegislatorStateReducer.swift
    
    return state
}

func initialState() -> PaulState {
    return PaulState(name: nil, things: [])
}
