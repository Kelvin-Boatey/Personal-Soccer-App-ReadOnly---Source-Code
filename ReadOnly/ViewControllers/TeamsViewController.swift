//
//  TeamsViewController.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/10/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit

class TeamsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var teams = [TeamObject]()
    var aResponse: DataResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        TeamService.getData { (aResponse) in
            print(aResponse)
            self.teams = (aResponse?.TeamObject)!
            self.aResponse = aResponse
            self.tableView.reloadData()
        }
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
        
        /*if segue.identifier == "toTeam" {
            let index = sender as! IndexPath
            let aTeam = teams[index.row]
            let aVC = segue.destination as! PlayersViewController
            aVC.aTeam = aTeam
            aVC.aResponse = self.aResponse
        }*/
        
        if segue.identifier == "toTeamInfo" {
            let index = sender as! IndexPath
            let aTeam = teams[index.row]
            let aVC = segue.destination as! TeamInfoViewController
            aVC.team = aTeam
            aVC.aResponse = self.aResponse
        }
        
        if segue.identifier == "toCV" {
            let index = sender as! IndexPath
            let aTeam = teams[index.row]
            let aVC = segue.destination as! TeamCollectionViewController
            aVC.team = aTeam
            aVC.aResponse = self.aResponse
        }
    }
    

}

extension TeamsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "aCell")
        let aTeam = teams[indexPath.row]
        aCell?.textLabel?.text = aTeam.name
        
        return aCell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "toTeamInfo", sender: indexPath)
        performSegue(withIdentifier: "toCV", sender: indexPath)
    }
    /*
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     performSegue(withIdentifier: "toTeamInfo", sender: indexPath)
     }
     */

}
