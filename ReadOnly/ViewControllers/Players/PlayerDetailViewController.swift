//
//  PlayerDetailViewController.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/16/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit


class PlayerDetailViewController: UIViewController {
    var aResponse: DataResponse!
    var aTeam: TeamObject!
    var aPlayer : PlayerObject!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.title = aPlayer.first_name! + " " + aPlayer.second_name!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PlayerDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aPlayer.displayProps().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "aCell")

        let anArray = aPlayer.displayProps()
        let aKey = anArray[indexPath.row]
        aCell?.textLabel?.text = aKey
        aCell?.detailTextLabel?.text = aPlayer.displayDict()[aKey] as? String
        return aCell!
        
    }
}
