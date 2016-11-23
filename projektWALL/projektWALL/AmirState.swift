//
//  AmirState.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/22/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire

struct AmirState {
    var name: String?
    var things: [AnyObject]!
    var thingsFromOnline: Result<[AnyObject]>?
}
