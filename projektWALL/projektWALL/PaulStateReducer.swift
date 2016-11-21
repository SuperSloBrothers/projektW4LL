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
    var state = state ?? initialState()
    
    return state
}

func initialState() -> PaulState {
    return PaulState(name: nil, things: [])
}
