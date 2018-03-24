//
//  PlayerTypeObject.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/12/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit
import Gloss

class PlayerTypeObjec: Glossy {
    
    var id: Int?
    var singular_name: String?
    var singular_name_short: String?
    var plural_name: String?
    var plural_name_short: String?
    
    required init?(json: JSON) {
        self.id = "id" <~~ json
        self.singular_name = "singular_name" <~~ json
        self.singular_name_short = "singular_name_short" <~~ json
        self.plural_name = "plural_name" <~~ json
        self.plural_name_short = "plural_name_short" <~~ json
    }
    func toJSON() -> JSON? {
        return [:]
    }
}
