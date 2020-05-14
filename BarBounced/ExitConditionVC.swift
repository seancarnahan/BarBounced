//
//  ExitConditionVC.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/13/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class ExitConditionVC: UIViewController {
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
    
    @IBOutlet weak var player9Label: UILabel!
    
    @IBOutlet weak var player10Label: UILabel!
    
    @IBOutlet weak var player11Label: UILabel!
    
    @IBOutlet weak var player12Label: UILabel!
    
    @IBOutlet weak var player13Label: UILabel!
    
    @IBOutlet weak var player14Label: UILabel!
    
    @IBOutlet weak var player15Label: UILabel!
    
    @IBOutlet weak var player16Label: UILabel!
    
    
    
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
        playerLabels.append(player9Label)
        playerLabels.append(player10Label)
        playerLabels.append(player11Label)
        playerLabels.append(player12Label)
        playerLabels.append(player13Label)
        playerLabels.append(player14Label)
        playerLabels.append(player15Label)
        playerLabels.append(player16Label)

        for player in 0...15 {
            if player < finalAddedPlayers.count {
                playerLabels[player].isHidden = false
                playerLabels[player].text = finalAddedPlayers[player].playerName! + " is " + finalAddedPlayers[player].personalityTitle!
            } else {
                playerLabels[player].isHidden = true
            }
        }
    }
    //newGameSegue
    
    @IBAction func startNewGame(_ sender: Any) {
        performSegue(withIdentifier: "newGameSegue", sender: self)
    }
    
}
