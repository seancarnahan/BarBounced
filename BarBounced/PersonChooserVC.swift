//
//  PersonChooserVC.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/10/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class PersonChooserVC: UIViewController {
    //finalAddedPlayers: [ordinal# : [nameOfPlayer, Personality Trait]]
    var finalAddedPlayers: [playerObject] = []
    var listOfPersonCards: [PGameObj] = [] //switch this PCardObj note
    var dictNameToOrdinal: [String: Int] = [:]
    var cardOrdinal = 0
    var buttonList :[UIButton] = []

    @IBOutlet weak var cardTitleLabel: UILabel!
    
    @IBOutlet weak var cardRuleLabel: UILabel!
    

    @IBOutlet weak var userOneB: UIButton!
    @IBOutlet weak var userTwoB: UIButton!
    @IBOutlet weak var userThreeB: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardTitleLabel.text = listOfPersonCards[cardOrdinal].name
        cardRuleLabel.text = listOfPersonCards[cardOrdinal].message
        
        userOneB.isHidden = true
        userTwoB.isHidden = true
        userThreeB.isHidden = true
        
        buttonList.append(userOneB)
        buttonList.append(userTwoB)
        buttonList.append(userThreeB)
        
        
        
        //show buttons for the amount of players added and give button correct name
        var counter = 0
        for player in finalAddedPlayers{
            
            player.assignedButton = buttonList[counter]
            player.assignedButton!.isHidden = false
            
            player.assignedButton!.setTitle(player.playerName, for: [])
            counter += 1
        }
    }
        
        
    
    
    @IBAction func userOneClicked(_ sender: Any) {
        playerChosen(playerID: 0)
        
    }
    
    @IBAction func userTwoClicked(_ sender: Any) {
        playerChosen(playerID: 1)
    }
    
    @IBAction func userThreeClicked(_ sender: Any) {
        playerChosen(playerID: 2)
    }
    
    func playerChosen(playerID: Int) {
        if finalAddedPlayers[playerID].personalityTitle == "" {
            //only access layer 1 -> clicked on person without personality
            finalAddedPlayers[playerID].personalityTitle = listOfPersonCards[cardOrdinal].name!
            finalAddedPlayers[playerID].hasPersonality = true
            
            //then trigger segue
        } else {
            //only access layer 2 -> clicked on person with personality
            
            for person in finalAddedPlayers {
                if person.hasPersonality == false {
                    person.assignedButton!.isHidden = false
                } else {
                    person.assignedButton!.isHidden = true
                }
            }
            

        }
        
    }
}

