//
//  AmirStateReducer.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire


func amirStateReducer(action: Action, state: AmirState?) -> AmirState {
    var state = state ?? initialState()
    
    switch action {
    case let action as SetName:
        state.name = action.name
    case let action as SetThings:
        state.things = action.things
    case let action as SetThingsFromOnline:
        state.thingsFromOnline = action.thingsFromOnline
    default:
        break
    }
    
    return state
}

func initialState() -> AmirState {
    return AmirState(
        name: nil,
        things: [],
        thingsFromOnline: nil
    )
}

