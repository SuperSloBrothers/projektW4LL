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

func getLegislators() -> Store<LegislatorState>.ActionCreator {
    return { state, store in
        
        let amir = Legislator(firstName: "Amir", gender: "M")
        let gabe = Legislator(firstName: "Gabe", gender: "Other")
        let paul = Legislator(firstName: "Paulinos", gender: "yes")
        
        let arrayData = [amir, gabe, paul]
        
        let resultie = Result.success(arrayData)
        //
        //  AlamoFire Request w/ Completion Block
        // begin completion block
        //      store.dispatch(SetLegislators(Result(.success(value))
        //      store.dispatch(SetLegislators(Result(.failure(errorValue))
        // end completion block
        return SetLegislators(legislators: resultie)
    }
    
}
