//
//  RootState.swift
//  projektWALL
//
//  Created by Gabriele Pregadio on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire

struct RootState: StateType {
    var legislatorState: LegislatorState
    var paulState: PaulState
    var upcomingBillsState: UpcomingBillsState
}
