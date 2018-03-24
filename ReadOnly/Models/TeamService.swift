//
//  TeamService.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/10/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit
import Alamofire
import Gloss

class TeamService: NSObject {

    class func getData(_ completion: @escaping (_ response: DataResponse?) -> Void) {
        Alamofire.request("https://fantasy.premierleague.com/drf/bootstrap-static").responseJSON { (aResponse) in
           /// print(aResponse)
            
            let jsonResponse = DataResponse(json: aResponse.result.value as! JSON)
            DataManager.shared.aResponse = jsonResponse
            completion(jsonResponse)
        }
    }

    
}
