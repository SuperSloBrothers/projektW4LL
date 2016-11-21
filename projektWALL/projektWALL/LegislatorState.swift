//
//  LegislatorState.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire

struct LegislatorState: StateType {
    var legislators: Result<[Legislator]>?
}
