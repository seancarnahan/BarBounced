//
//  exitEightOrLessVC.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/16/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class exitEightOrLessVC: UIViewController {
    var finalAddedPlayers: [playerObject] = []
    var playerLabels: [UILabel] = []
    
    @IBOutlet weak var player1Label: UILabel!

    @IBOutlet weak var player2Label: UILabel!
    
    @IBOutlet weak var player3Label: UILabel!
    
    @IBOutlet weak var player4Label: UILabel!
    
    @IBOutlet weak var player5Label: UILabel!
    
    @IBOutlet weak var player6Label: UILabel!
    
    @IBOutlet weak var player7Label: UILabel!
    
    @IBOutlet weak var player8Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerLabels.append(player1Label)
        playerLabels.append(player2Label)
        playerLabels.append(player3Label)
        playerLabels.append(player4Label)
        playerLabels.append(player5Label)
        playerLabels.append(player6Label)
        playerLabels.append(player7Label)
        playerLabels.append(player8Label)
        
        for player in 0...7 {
            if player < finalAddedPlayers.count {
                playerLabels[player].isHidden = false
                playerLabels[player].text = finalAddedPlayers[player].playerName! + " is " + finalAddedPlayers[player].personalityTitle!
            } else {
                playerLabels[player].isHidden = true
            }
        }
        

    }

    @IBAction func startNewGame(_ sender: Any) {
        performSegue(withIdentifier: "newGame2Segue", sender: self)
    }
}
