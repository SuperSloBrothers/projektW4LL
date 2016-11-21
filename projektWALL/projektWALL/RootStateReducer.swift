//
//  RootStateReducer.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire


struct RootStateReducer: Reducer {
    
    func handleAction(action: Action, state: RootState?) -> RootState {
        return RootState(
            legislatorState: legislatorStateReducer(action: action, state: state?.legislatorState),
            paulState: paulStateReducer(action: action, state: state?.paulState)
        )
    }
}
