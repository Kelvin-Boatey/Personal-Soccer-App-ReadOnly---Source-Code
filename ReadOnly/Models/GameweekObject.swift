//
//  GameweekObject.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/12/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit
import Gloss

class GameweekObject: Glossy {
    
    var id: Int?
    var name: String?
    var deadline_time: NSDate?
    var average_entry_score: Int?
    var finished: Bool?
    var data_checked: Bool?
    var highest_scoring_entry: Int?
    var deadline_time_epoch: Int?
    var deadline_time_game_offset: Int?
    var deadline_time_formatted: NSDate?
    var highest_score: Int?
    var is_previous: Bool?
    var is_current: Bool?
    var is_next: Bool?
    
    required init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.deadline_time = "deadline_time" <~~ json
        self.average_entry_score = "average_entry_score" <~~ json
        self.finished = "finished" <~~ json
        self.data_checked = "data_checked" <~~ json
        self.highest_scoring_entry = "highest_scoring_entry" <~~ json
        self.deadline_time_epoch = "deadline_time_epoch" <~~ json
        self.deadline_time_game_offset = "deadline_time_game_offset" <~~ json
        self.deadline_time_formatted = "deadline_time_formatted" <~~ json
        self.highest_score = "highest_score" <~~ json
        self.is_previous = "is_previous" <~~ json
        self.is_current = "is_current" <~~ json
        self.is_next = "is_next" <~~ json 
    }
    func toJSON() -> JSON? {
        return [:]
    }
}
