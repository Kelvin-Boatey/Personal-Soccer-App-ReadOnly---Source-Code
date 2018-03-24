//
//  DataResponse.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/13/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit
import Gloss

class DataResponse: Glossy {
    var TeamObject: Array<TeamObject>?
    var PlayerObject: Array<PlayerObject>?
    var GameweekObject: Array<Any>?
    var PlayerType: Array<PlayerTypeObjec>?
    
    required init?(json: JSON) {
        self.TeamObject = "teams" <~~ json
        self.PlayerObject = "elements" <~~ json
        self.GameweekObject = "GameweekObject" <~~ json
        self.PlayerType = "element_types" <~~ json
    }
    func toJSON() -> JSON? {
        return [:]
    }
}
