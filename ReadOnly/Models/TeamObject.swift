//
//  TeamObject.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/10/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit
import Gloss

class TeamObject: Glossy {
    
    var name: String?
    var code: Int?
    var short_name: String?
    var unavailable: Int?
    var strength: Int?
    var position: Int?
    var played: Int?
    var win: Int?
    var loss: Int?
    var draw: Int?
    var points: Int?
    var form: Int?
    var link_url: String?
    var strength_overall_home: Int?
    var strength_overall_away: Int?
    var strength_attack_home: Int?
    var strength_attack_away: Int?
    var strength_defence_home: Int?
    var strength_defence_away: Int?
    var team_division: Int?
    
    required init?(json: JSON) {
        self.name = "name" <~~ json
        self.code = "code" <~~ json
        self.short_name = "short_name" <~~ json
        self.unavailable = "unavailable" <~~ json
        self.strength = "strength" <~~ json
        self.position = "position" <~~ json
        self.played = "played" <~~ json
        self.win = "win" <~~ json
        self.loss = "loss" <~~ json
        self.draw = "draw" <~~ json
        self.points = "points" <~~ json
        self.form = "form" <~~ json
        self.link_url = "link_url" <~~ json
        self.strength_overall_home = "strength_overall_home" <~~ json
        self.strength_overall_away = "strength_overall_away" <~~ json
        self.strength_attack_home = "strength_attack_home" <~~ json
        self.strength_attack_away = "strength_attack_away" <~~ json
        self.strength_defence_home = "strength_defence_home" <~~ json
        self.strength_defence_away = "strength_defence_away" <~~ json
        self.team_division = "team_division" <~~ json
    }
    
    func toJSON() -> JSON? {
        
        return [:]
        
    }
    
    
    func displayDict() -> [String : Any?] {
        return [
                "Team Name" : self.name,
                "Team Code" : String(self.code ?? 000),
                 "Short Name" : self.short_name,
                 "Strength" : String(self.strength ?? 000),
                 "League Position" : String(self.position ?? 000),
                 "Games Played" : String(self.played ?? 000),
                 "Games Won" : String(self.win ?? 000),
                 "Games Lost" : String(self.loss ?? 000),
                 "Games Drawn" : String(self.draw ?? 000),
                 "Team Points" : String(self.points ?? 000),
                 "Team Form" : String(self.form ?? 000),
                 "Overall Strength Home" : String(self.strength_overall_home ?? 000),
                 "Overall Strength Away" : String(self.strength_overall_away ?? 000),
                 "Strength Attack Home" : String(self.strength_attack_home ?? 000),
                 "Strength Attack Away" : String(self.strength_attack_away ?? 000),
                 "Strength Defense Home" : String(self.strength_defence_home ?? 000),
                 "Strength Defense Away" : String(self.strength_defence_away ?? 000),
                 "Team Division" : String(self.team_division ?? 000)
            ]
    }
    
    func displayProps() -> [String] {
        return [
            "Team Code",
            "Strength" ,
//            "League Position" ,
//            "Games Played" ,
//            "Games Won" ,
//            "Games Lost" ,
//            "Games Drawn" ,
//            "Team Points" ,
//            "Team Form" ,
            "Overall Strength Home" ,
            "Overall Strength Away" ,
            "Strength Attack Home" ,
            "Strength Attack Away" ,
            "Strength Defense Home" ,
            "Strength Defense Away" ,
//            "Team Division"
        ]
    }

}
