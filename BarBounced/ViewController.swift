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

class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var label: UILabel?
    var indexOfLabel: Int?
    var playerID: Int?
}

class SettingsTapRecognizer: UITapGestureRecognizer {
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var addPlayerTextField: UITextField!
    
    var player1Name = ""
    var addedUsers = 0
    var possibleUsers: [UILabel] = []
    var addedPlayers: [playerObject] = []
    var isHomeVersion = 0
    var possiblePlayerIDs : [Int] = []

    @IBOutlet weak var userOne: UILabel!
    
    @IBOutlet weak var userTwo: UILabel!
    
    @IBOutlet weak var userThree: UILabel!
    
    @IBOutlet weak var userFour: UILabel!
    
    @IBOutlet weak var userFive: UILabel!
    
    @IBOutlet weak var userSix: UILabel!
    
    @IBOutlet weak var userSeven: UILabel!
    
    @IBOutlet weak var userEight: UILabel!
    
    @IBOutlet weak var userNine: UILabel!
    
    @IBOutlet weak var userTen: UILabel!
    
    @IBOutlet weak var userEleven: UILabel!
    
    @IBOutlet weak var userTwelve: UILabel!
    
    @IBOutlet weak var userThirteen: UILabel!
    
    @IBOutlet weak var userFourteen: UILabel!
    
    @IBOutlet weak var userFifteen: UILabel!
    
    @IBOutlet weak var userSixteen: UILabel!
    
    
    @IBOutlet weak var homeOrBarSwitch: UISegmentedControl!
    
    
    @IBAction func homeorBarController(_ sender: Any) {
        isHomeVersion = homeOrBarSwitch.selectedSegmentIndex
    }
    
    @IBAction func finishedUserWarning(_ sender: Any) {
        self.warningPopover.removeFromSuperview()
    }
    
    @IBAction func leaveSettingsView(_ sender: Any) {
        self.settingsPopover.removeFromSuperview()
    }
    
    
    @IBOutlet var warningPopover: UIView!
    
    @IBOutlet var settingsPopover: UIView!
    
    @IBAction func textField_changed(_ sender: UITextField) {
        
        //limit input text to only 16 characters
        let text = addPlayerTextField.text
        let length = text!.count
        
        if length > 16 {
            let index = text!.index((text?.startIndex)!,offsetBy: 16)
            addPlayerTextField.text = String((addPlayerTextField.text![..<index]))
        }
    }
    
    @objc func clickLabel(sender: CustomTapGestureRecognizer){
        //clicked on label, remove player from game
        
        addedUsers -= 1
        let label = sender.label!
        let playerID = sender.playerID!
        let playerIndex = sender.indexOfLabel!
        
        
        //hide label
        label.isHidden = true
        
        //add label from possibleUsers
        possibleUsers.append(label)
        
        //add player's id to possible playerIDs
        possiblePlayerIDs.append(playerID)
        
        //remove player from added players
        //issue is HERE because added players is shrinking when we might remove at index 16 even tho added players has shrank to a size of like 12
        //addedPlayers.remove(at: playerIndex)
        var indexCounter = 0
        for player in addedPlayers {
            
            if player.playerID == playerID {

                addedPlayers.remove(at: indexCounter)
            }
            indexCounter += 1
        }
    }
    
    func makeLabelTapable(label: UILabel, labelIndex: Int, playerID: Int) {
        //be able to disable a user from the screen
        
        label.isUserInteractionEnabled = true
        
        let tapGesture = CustomTapGestureRecognizer(target: self,
        action: #selector(clickLabel(sender:)))
        tapGesture.numberOfTapsRequired = 1
        
        tapGesture.indexOfLabel = labelIndex
        tapGesture.label = label
        tapGesture.playerID = playerID
        
        
        label.addGestureRecognizer(tapGesture)
        
    }
    
    func makeSettingsClickable() {
        settingsTab.isUserInteractionEnabled = true
        
        let tapGesture = SettingsTapRecognizer(target: self,
        action: #selector(settingsTableisClicked))
        
        tapGesture.numberOfTapsRequired = 1
        
        settingsTab.addGestureRecognizer(tapGesture)
    }
    
    @objc func settingsTableisClicked(){
        print("Settings Icon has been tapped")
        self.settingsPopover.layer.cornerRadius = 10
        self.view.addSubview(settingsPopover)
        settingsPopover.center = self.view.center
        
    }
    
    @IBOutlet weak var settingsTab: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //settings popover
         makeSettingsClickable()

        
        
        
        //user warning popover
        self.warningPopover.layer.cornerRadius = 10
        self.view.addSubview(warningPopover)
        warningPopover.center = self.view.center
        

        
        userOne.isHidden = true
        userTwo.isHidden = true
        userThree.isHidden = true
        userFour.isHidden = true
        userFive.isHidden = true
        userSix.isHidden = true
        userSeven.isHidden = true
        userEight.isHidden = true
        userNine.isHidden = true
        userTen.isHidden = true
        userEleven.isHidden = true
        userTwelve.isHidden = true
        userThirteen.isHidden = true
        userFourteen.isHidden = true
        userFifteen.isHidden = true
        userSixteen.isHidden = true
        
        possibleUsers.append(userOne)
        possibleUsers.append(userTwo)
        possibleUsers.append(userThree)
        possibleUsers.append(userFour)
        possibleUsers.append(userFive)
        possibleUsers.append(userSix)
        possibleUsers.append(userSeven)
        possibleUsers.append(userEight)
        possibleUsers.append(userNine)
        possibleUsers.append(userTen)
        possibleUsers.append(userEleven)
        possibleUsers.append(userTwelve)
        possibleUsers.append(userThirteen)
        possibleUsers.append(userFourteen)
        possibleUsers.append(userFifteen)
        possibleUsers.append(userSixteen)
        
        
        // Do any additional setup after loading the view.
        //Head Hancho -> first person -> the rest are just ur average honchos
    }
    
    @IBAction func addPlayerButton(_ sender: UIButton) {
        //ADDING USER
        if addPlayerTextField.text!.count > 0  {
            if addedUsers < 16 {
                self.player1Name = addPlayerTextField.text!
                
                possiblePlayerIDs.append(addedUsers)
                let newId = possiblePlayerIDs.randomElement()
                
                var randomLablel = UILabel()
                while true {
                    randomLablel = possibleUsers.randomElement()!
                    if randomLablel.text!.count > 0 {
                        //exit while loop with new blank random label
                        break
                    }
                }
                
                randomLablel.isHidden = false
                randomLablel.text = "X " + self.player1Name

                let newPlayer = playerObject()
                //possiblePlayerIDs
                newPlayer.playerID = newId
                newPlayer.playerName = self.player1Name
                newPlayer.personalityTitle = ""
                newPlayer.personalityRules = ""
                newPlayer.hasPersonality = false
                addedPlayers.append(newPlayer)
                
                
                makeLabelTapable(label: randomLablel, labelIndex: addedUsers, playerID:newId!)
                    
                //remove randomLabel from list of possible users
                possibleUsers = possibleUsers.filter { $0 != randomLablel }
                //remove from possible playerIDs
                possiblePlayerIDs = possiblePlayerIDs.filter { $0 != newId }
                
                addedUsers += 1
                addPlayerTextField.text = ""
            } else {
                addPlayerTextField.text = "Can't add more than 16 players :("
            }

        } else {
            //this is if the user did not input anything text field
        }
    }
    
   //withIdentifier is the identifier for the segue
    @IBAction func sendItButton(_ sender: UIButton) {
        var orderPlayerIDs = 0
        for player in addedPlayers {
            player.playerID = orderPlayerIDs
            orderPlayerIDs += 1
        }
        if addedPlayers.count > 1 {
            performSegue(withIdentifier: "gameViewSegue", sender: self)
        } else {
            //no users inputed
            print("---NEED TO ADD A PLAYER---")
        }
        
    }
    
    //this function is called everytime a segue is called
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! gameController
        
        //sets value of a variable in gameController
        vc.finalAddedPlayers = self.addedPlayers
        vc.isHomeVersion = self.isHomeVersion
    }
    
    
}

