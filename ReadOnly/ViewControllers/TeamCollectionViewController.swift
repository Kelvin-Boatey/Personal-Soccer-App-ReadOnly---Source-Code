//
//  TeamCollectionViewController.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 10/23/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit

class TeamCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var team: TeamObject!
    var aResponse: DataResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.title = team.name! + ": " + team.short_name! 
        
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

extension TeamCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return team.displayProps().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath) as! TeamInfoCollectionViewCell
        
        let anArray = team.displayProps()
        let aKey = anArray[indexPath.row]
        cell.topLabel?.text = aKey
        cell.bottomLabel?.text = team.displayDict()[aKey] as? String
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
//        let nbCol = indexPath.item == 0 ? 1 : 2
        let nbCol = 2
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
        
        return CGSize(width:size, height:120)
    }
}
