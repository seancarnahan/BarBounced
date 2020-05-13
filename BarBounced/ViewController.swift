//
//  ViewController.swift
//  BarBounced
//
//  Created by Sean Carnahan on 3/24/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class playerObject {
    var playerID: Int? //index in the list
    var playerName: String?
    var personalityTitle: String?
    var personalityRules: String?
    var hasPersonality: Bool?
    var assignedButton: UIButton?
    var personalityCardID: Int?
}

class ViewController: UIViewController {
    
    @IBOutlet weak var addPlayerTextField: UITextField!
    
    var player1Name = ""
    var addedUsers = 0
    var possibleUsers: [UILabel] = []
    var addedPlayers: [playerObject] = []

    @IBOutlet weak var userOne: UILabel!
    
    @IBOutlet weak var userTwo: UILabel!
    
    @IBOutlet weak var userThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userOne.isHidden = true
        userTwo.isHidden = true
        userThree.isHidden = true
        
        possibleUsers.append(userOne)
        possibleUsers.append(userTwo)
        possibleUsers.append(userThree)
        
        print("-------------")
        // Do any additional setup after loading the view.
        //Head Hancho -> first person -> the rest are just ur average honchos
    }
    
    @IBAction func addPlayerButton(_ sender: UIButton) {
        //ADDING USER
        self.player1Name = addPlayerTextField.text!
        
        possibleUsers[addedUsers].isHidden = false
        possibleUsers[addedUsers].text = self.player1Name
        //addedPlayers[self.player1Name] = ""
        //addedPlayers[addedUsers] = [self.player1Name, ""]
        
        let newPlayer = playerObject()
        newPlayer.playerID = addedUsers
        newPlayer.playerName = self.player1Name
        newPlayer.personalityTitle = ""
        newPlayer.personalityRules = ""
        newPlayer.hasPersonality = false
        addedPlayers.append(newPlayer)
        
        addedUsers += 1
        addPlayerTextField.text = ""
    }
    
   //withIdentifier is the identifier for the segue
    @IBAction func sendItButton(_ sender: UIButton) {
        performSegue(withIdentifier: "gameViewSegue", sender: self)
    }
    
    //this function is called everytime a segue is called
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! gameController
        
        //sets value of a variable in gameController
        vc.finalAddedPlayers = self.addedPlayers
    }
    
    
}

