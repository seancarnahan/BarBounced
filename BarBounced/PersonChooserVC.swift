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
    @IBOutlet weak var userFourB: UIButton!
    @IBOutlet weak var userFiveB: UIButton!
    @IBOutlet weak var userSixB: UIButton!
    @IBOutlet weak var userSevenB: UIButton!
    @IBOutlet weak var userEightB: UIButton!
    
    
    @IBOutlet weak var userNineB: UIButton!
    
    
    
    @IBOutlet weak var userTenB: UIButton!
    @IBOutlet weak var userElevenB: UIButton!
    @IBOutlet weak var userTwelveB: UIButton!
    @IBOutlet weak var userThirteenB: UIButton!
    @IBOutlet weak var userFourteenB: UIButton!
    @IBOutlet weak var userFifteenB: UIButton!
    @IBOutlet weak var userSixteenB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardTitleLabel.text = listOfPersonCards[cardOrdinal].name
        cardRuleLabel.text = listOfPersonCards[cardOrdinal].message
        
        userOneB.isHidden = true
        userTwoB.isHidden = true
        userThreeB.isHidden = true
        userFourB.isHidden = true
        userFiveB.isHidden = true
        userSixB.isHidden = true
        userSevenB.isHidden = true
        userEightB.isHidden = true
        userNineB.isHidden = true
        userTenB.isHidden = true
        userElevenB.isHidden = true
        userTwelveB.isHidden = true
        userThirteenB.isHidden = true
        userFourteenB.isHidden = true
        userFifteenB.isHidden = true
        userSixteenB.isHidden = true
        
        buttonList.append(userOneB)
        buttonList.append(userTwoB)
        buttonList.append(userThreeB)
        buttonList.append(userFourB)
        buttonList.append(userFiveB)
        buttonList.append(userSixB)
        buttonList.append(userSevenB)
        buttonList.append(userEightB)
        buttonList.append(userNineB)
        buttonList.append(userTenB)
        buttonList.append(userElevenB)
        buttonList.append(userTwelveB)
        buttonList.append(userThirteenB)
        buttonList.append(userFourteenB)
        buttonList.append(userFifteenB)
        buttonList.append(userSixteenB)
        
        
        
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
            print("enter second layer 2 with id 0")
            secondPlayerChosen(ID: 0)
        } else {
            playerChosen(ID: 0)
        }
    }
    
    @IBAction func userTwoClicked(_ sender: Any) {
        
        if layerNumber == 2 {
            print("enter second layer 2 with id 1")
            secondPlayerChosen(ID: 1)
        } else {
            playerChosen(ID: 1)
        }
    }
    
    @IBAction func userThreeClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 2")
            secondPlayerChosen(ID: 2)
        } else {
            playerChosen(ID: 2)
        }
    }
    
    
    @IBAction func userFourClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 3")
            secondPlayerChosen(ID: 3)
        } else {
            playerChosen(ID: 3)
        }
    }
    
    @IBAction func userFiveClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 4")
            secondPlayerChosen(ID: 4)
        } else {
            playerChosen(ID: 4)
        }
    }
    
    @IBAction func userSixClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 5")
            secondPlayerChosen(ID: 5)
        } else {
            playerChosen(ID: 5)
        }
    }
    
    @IBAction func userSevenClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 6")
            secondPlayerChosen(ID: 6)
        } else {
            playerChosen(ID: 6)
        }
    }
    
    @IBAction func userEightClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 7")
            secondPlayerChosen(ID: 7)
        } else {
            playerChosen(ID: 7)
        }
    }
    
    @IBAction func userNineClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 8")
            secondPlayerChosen(ID: 8)
        } else {
            playerChosen(ID: 8)
        }
    }
    
    @IBAction func userTenClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 9")
            secondPlayerChosen(ID: 9)
        } else {
            playerChosen(ID: 9)
        }
    }
    
    @IBAction func userElevenClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 10")
            secondPlayerChosen(ID: 10)
        } else {
            playerChosen(ID: 10)
        }
    }
    
    @IBAction func userTwelveClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 11")
            secondPlayerChosen(ID: 11)
        } else {
            playerChosen(ID: 11)
        }
    }
    
    @IBAction func userThirteenClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 12")
            secondPlayerChosen(ID: 12)
        } else {
            playerChosen(ID: 12)
        }
    }
    
    @IBAction func userFourteenClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 13")
            secondPlayerChosen(ID: 13)
        } else {
            playerChosen(ID: 13)
        }
    }
    
    @IBAction func userFifteenClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 14")
            secondPlayerChosen(ID: 14)
        } else {
            playerChosen(ID: 14)
        }
    }
    
    @IBAction func userSixteenClicked(_ sender: Any) {
        if layerNumber == 2 {
            print("enter second layer 2 with id 15")
            secondPlayerChosen(ID: 15)
        } else {
            playerChosen(ID: 15)
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

