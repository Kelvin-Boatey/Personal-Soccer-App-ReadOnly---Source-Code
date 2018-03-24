//
//  DataManager.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/16/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    var aResponse: DataResponse!
    static let shared = DataManager()
    

    func players(_ forTeamID: Int) -> [PlayerObject] {
        
        let allPlayers = aResponse.PlayerObject
        let filtered = allPlayers?.filter({$0.team_code == forTeamID})
        
        return filtered ?? [PlayerObject]()
        
    }
    func playerInfo(_ forPlayerID:Int) -> PlayerObject? {
        
        let allPlayers = aResponse.PlayerObject
        let filtered = allPlayers?.filter({$0.id == forPlayerID}).first
        
        return filtered
    }
    
    func teamName(_ fromTeamId: Int) -> String {
        let teams = aResponse.TeamObject
        let aTeam = teams?.filter({$0.code == fromTeamId}).first
        return aTeam?.name ?? "Team Error"
    }
    
    func playerPosition(_ fromPlayerType: Int) -> String {
        let allPositions = aResponse.PlayerType
        let aPosition = allPositions?.filter({$0.id == fromPlayerType}).first
        return aPosition?.singular_name ?? "Try Again"
        
    
    }
}
