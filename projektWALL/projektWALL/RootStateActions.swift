//
//  RootStateActions.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire
import ObjectMapper

struct SetLegislators: Action {
    let legislators: Result<[Legislator]>?
}
