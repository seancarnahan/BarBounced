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
    var cardOrdinal = 0
    var buttonList :[UIButton] = []
    var layerNumber = 1
    var peopleToDisplay : [Int] = []
    
    
    var personalityTitleToAssign = ""
    var personalityRuleToAssign = ""
    var personalityIDToAssign = 0

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
        if layerNumber == 2 {
            print("enter second layer A")
            secondPlayerChosen(ID: 0)
        } else {
            playerChosen(ID: 0)
        }
    }
    
    @IBAction func userTwoClicked(_ sender: Any) {
        
        if layerNumber == 2 {
            print("enter second layer B")
            secondPlayerChosen(ID: 1)
        } else {
            playerChosen(ID: 1)
        }
    }
    
    @IBAction func userThreeClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer C")
            secondPlayerChosen(ID: 2)
        } else {
            playerChosen(ID: 2)
        }
    }
    
    func playerChosen(ID: Int) {
        if finalAddedPlayers[ID].personalityTitle == "" {
            //only access layer 1 -> clicked on person without personality
            
            finalAddedPlayers[ID].personalityTitle = listOfPersonCards[cardOrdinal].name!
            finalAddedPlayers[ID].personalityRules = listOfPersonCards[cardOrdinal].message
            finalAddedPlayers[ID].personalityCardID = cardOrdinal
            finalAddedPlayers[ID].hasPersonality = true
            
            //set data for transfer transfer
        peopleToDisplay.append(finalAddedPlayers[ID].playerID!)
            
            //then trigger segue
            performSegue(withIdentifier: "displayNewPersonSegue", sender: self)
            
        } else {
            //only access layer 2 -> clicked on person with personality
            
            //set global variables for layer 2
            personalityTitleToAssign = finalAddedPlayers[ID].personalityTitle!
            personalityRuleToAssign = finalAddedPlayers[ID].personalityRules!
            personalityIDToAssign = finalAddedPlayers[ID].personalityCardID!
            
            //set layer 2 headers
            cardTitleLabel.text = finalAddedPlayers[ID].personalityTitle!
            cardRuleLabel.text = finalAddedPlayers[ID].personalityRules!
            
            //setup buttons for layer 2
            for person in finalAddedPlayers {
                if person.hasPersonality == false {
                    person.assignedButton!.isHidden = false
                } else {
                    person.assignedButton!.isHidden = true
                }
            }
            
            //change first button pressed person's personality
            finalAddedPlayers[ID].personalityTitle = listOfPersonCards[cardOrdinal].name!
            finalAddedPlayers[ID].personalityRules = listOfPersonCards[cardOrdinal].message
            finalAddedPlayers[ID].personalityCardID = cardOrdinal
            
            //set data for transfer
        peopleToDisplay.append(finalAddedPlayers[ID].playerID!)
            
            
            
            layerNumber += 1
        }
        
    }
    
    func secondPlayerChosen(ID: Int) {
        
        finalAddedPlayers[ID].personalityTitle = personalityTitleToAssign
        finalAddedPlayers[ID].personalityRules = personalityRuleToAssign
        finalAddedPlayers[ID].personalityCardID = personalityIDToAssign
        finalAddedPlayers[ID].hasPersonality = true
        peopleToDisplay.append(finalAddedPlayers[ID].playerID!)
        
        
        performSegue(withIdentifier: "displayNewPersonSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DisplayNewPersonalityVC
        vc.finalAddedPlayers = self.finalAddedPlayers
        vc.peopleToDisplay = self.peopleToDisplay
        
        
        
    }
}

