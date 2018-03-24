//
//  PlayerObject.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/10/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit
import Gloss

class PlayerObject: Glossy {
    
    var id: Int?
    var photo: String?
    var web_name: String?
    var team_code: Int?
    var status: String?
    var code: Int?
    var first_name: String?
    var second_name: String?
    var squad_number: Int?
    var news: String?
    var now_cost: Int?
    var chance_of_playing_this_round: Int?
    var chance_of_playing_next_round: Int?
    var value_form: String?
    var value_season: String?
    var cost_change_start: Int?
    var cost_change_event: Int?
    var cost_change_start_fall: Int?
    var cost_change_event_fall: Int?
    var in_dreamteam: Bool?
    var dreamteam_count: Int?
    var selected_by_percent: String?
    var form: String?
    var transfers_out: Int?
    var transfers_in: Int?
    var transfers_out_event: Int?
    var transfers_in_even: Int?
    var loans_i: Int?
    var loans_out: Int?
    var loaned_in: Int?
    var loaned_out: Int?
    var total_point: Int?
    var event_points: Int?
    var points_per_game: String?
    var ep_this: String?
    var ep_next: String?
    var special: Bool?
    var minutes: Int?
    var goals_scored: Int?
    var assists: Int?
    var clean_sheets: Int?
    var goals_conceded: Int?
    var own_goals: Int?
    var penalties_saved: Int?
    var penalties_missed: Int?
    var yellow_card: Int?
    var red_card: Int?
    var saves: Int?
    var bonus: Int?
    var bps: Int?
    var influence: String?
    var creativity: String?
    var threat: String?
    var ict_index: String?
    var ea_index: Int?
    var element_type: Int?
    var team: Int?
    
    required init?(json: JSON) {
        
        self.id = "id" <~~ json
        self.photo = "photo" <~~ json
        self.web_name = "web_name" <~~ json
        self.team_code = "team_code" <~~ json
        self.status = "status" <~~ json
        self.code = "code" <~~ json
        self.first_name = "first_name" <~~ json
        self.second_name = "second_name" <~~ json
        self.squad_number = "squad_number" <~~ json
        self.news = "news" <~~ json
        self.now_cost = "now_cost" <~~ json
        self.chance_of_playing_this_round = "chance_of_playing_this_round " <~~ json
        self.chance_of_playing_next_round = "chance_of_playing_next_round" <~~ json
        self.value_form = "value_form" <~~ json
        self.value_season = "value_season" <~~ json
        self.cost_change_start = "cost_change_start" <~~ json
        self.cost_change_event = "cost_change_event" <~~ json
        self.cost_change_start_fall = "cost_change_start_fall " <~~ json
        self.cost_change_event_fall = "cost_change_event_fall" <~~ json
        self.in_dreamteam = "in_dreamteam" <~~ json
        self.dreamteam_count = "dreamteam_count" <~~ json
        self.selected_by_percent = "selected_by_percent " <~~ json
        self.form = "form" <~~ json
        self.transfers_out = "transfers_out" <~~ json
        self.transfers_in = "transfers_in" <~~ json
        self.transfers_out_event = "transfers_out_event " <~~ json
        self.transfers_in_even = "transfers_in_even" <~~ json
        self.loans_i = "loans_i" <~~ json
        self.loans_out = "loans_out" <~~ json
        self.loaned_in = "loaned_in" <~~ json
        self.loaned_out = "loaned_out" <~~ json
        self.total_point = "total_point" <~~ json
        self.event_points = "event_points" <~~ json
        self.points_per_game = "points_per_game" <~~ json
        self.ep_this = "ep_this" <~~ json
        self.ep_next = "ep_next" <~~ json
        self.special = "special " <~~ json
        self.minutes = "minutes" <~~ json
        self.goals_scored = "goals_scored" <~~ json
        self.assists = "assists" <~~ json
        self.clean_sheets = "clean_sheets" <~~ json
        self.goals_conceded = "goals_conceded" <~~ json
        self.own_goals = "own_goals" <~~ json
        self.penalties_saved = "penalties_saved" <~~ json
        self.penalties_missed = "penalties_missed" <~~ json
        self.yellow_card = "yellow_card" <~~ json
        self.red_card = "red_card " <~~ json
        self.saves = "saves" <~~ json
        self.bonus = "bonus" <~~ json
        self.bps = "bps" <~~ json
        self.influence = "influence" <~~ json
        self.creativity = "creativity" <~~ json
        self.threat = "threat" <~~ json
        self.ict_index = "ict_index" <~~ json
        self.ea_index = "ea_index" <~~ json
        self.element_type = "element_type" <~~ json
        self.team = "team" <~~ json
    }
    func toJSON() -> JSON? {
        return [:]
    }
    
    func displayDict() -> [String : Any?] {
        return [
                "Jersey Name" : self.web_name,
                "Jersey Number" : String(self.squad_number ?? 0000),
                "Position" : DataManager.shared.playerPosition(element_type!),
                "Team": DataManager.shared.teamName(team_code!),
                "Influence" : self.influence,
                "Threat" : self.threat,
                "Creativity" : self.creativity,
                "Goals Scored" : String(self.goals_scored ?? 0000),
                "Assists": String(self.assists ?? 0000)
                ]
    }
    
    func displayProps() -> [String] {
        return [
                "Jersey Name",
                "Jersey Number",
                "Position",
                "Influence",
                "Threat",
                "Creativity",
                "Goals Scored",
                "Assists"
        ]
    }
}



