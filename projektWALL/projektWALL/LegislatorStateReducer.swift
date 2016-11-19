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

struct LegislatorStateReducer: Reducer {
    
    func handleAction(action: Action, state: LegislatorState?) -> LegislatorState {
        var state = state ?? LegislatorState()
        
        switch action {
        case let action as SetLegislators:
            state.legislators = action.legislators
        default:
            break
        }
        
        return state
    }
}
