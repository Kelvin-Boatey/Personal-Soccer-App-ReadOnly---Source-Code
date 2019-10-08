//
//  PlayerInfoColViewController.swift
//  ReadOnly
//
//  Created by Kelvin Boatey on 11/20/17.
//  Copyright © 2017 Kelvin Boatey. All rights reserved.
//

import UIKit
import SDWebImage


private let reuseIdentifier = "Cell"

class PlayerInfoColViewController: UIViewController {
    
    
    @IBOutlet weak var aCV: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    
    var team: TeamObject!
    var player: PlayerObject!
    var aResponse: DataResponse!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aCV.delegate = self
        aCV.dataSource = self
        navigationItem.title = player.first_name! + " " + player.second_name!


        // Do any additional setup after loading the view.
        let _url = "https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/p"
        let playerCode = String(player.code ?? 000)
        self.imageView.sd_setImage(with: URL(string:(_url + playerCode + ".png")), completed: nil)
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

extension PlayerInfoColViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return player.displayProps().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aCell", for: indexPath) as! PlayerDataCollectionViewCell
        
        let anArray = player.displayProps()
        let aKey = anArray[indexPath.row]
        cell.tobLabel?.text = aKey
        cell.bottomLabel?.text = player.displayDict()[aKey] as? String
        
        
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
