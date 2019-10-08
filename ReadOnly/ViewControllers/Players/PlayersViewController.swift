//
//  PlayersViewController.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/13/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    var aResponse: DataResponse!
    var aTeam: TeamObject!
    var players = [PlayerObject]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        players = DataManager.shared.players(aTeam.code!)
        tableView.reloadData()
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toPlayerInfo3" {
            let index = sender as! IndexPath
            let aPlayer = players[index.row]
            let aVC = segue.destination as! PlayerInfoColViewController
            aVC.player = aPlayer
            aVC.team = aTeam
            aVC.aResponse = self.aResponse
        }
    }
    

}


extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "aCell")
        let aPlayer = players[indexPath.row]
        aCell?.textLabel?.text = aPlayer.first_name! + " " + aPlayer.second_name!
        //aCell?.detailTextLabel?.text = String(aPlayer.squad_number ?? 909090)
        return aCell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toPlayerInfo3", sender: indexPath)
    }
}
