//
//  TeamInfoViewController.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/20/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit

class TeamInfoViewController: UIViewController {
    
    var aResponse: DataResponse!
    var team: TeamObject!
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
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
        if segue.identifier == "toPlayers" {
            let aVC = segue.destination as! PlayersViewController
            aVC.aTeam = team
            aVC.aResponse = self.aResponse
        }
    }


}

extension TeamInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.displayProps().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "aCell")
        
        let anArray = team.displayProps()
        let aKey = anArray[indexPath.row]
        aCell?.textLabel?.text = aKey
        aCell?.detailTextLabel?.text = team.displayDict()[aKey] as? String
        return aCell!
        
    }
}
