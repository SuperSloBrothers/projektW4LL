//
//  AmirStateActions.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire

struct SetName: Action {
    let name: String?
}

struct SetThings: Action {
    let things: [AnyObject]
}

struct SetThingsFromOnline: Action {
    let thingsFromOnline: Result<[AnyObject]>?
}
