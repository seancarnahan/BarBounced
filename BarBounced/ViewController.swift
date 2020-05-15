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
    var isHomeVersion = 0

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
    
    @IBOutlet var warningPopover: UIView!
    
    @IBAction func textField_changed(_ sender: UITextField) {
        
        //limit input text to only 16 characters
        let text = addPlayerTextField.text
        let length = text!.count
        
        if length > 16 {
            let index = text!.index((text?.startIndex)!,offsetBy: 16)
            addPlayerTextField.text = String((addPlayerTextField.text![..<index]))
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        self.player1Name = addPlayerTextField.text!
        
        possibleUsers[addedUsers].isHidden = false
        possibleUsers[addedUsers].text = self.player1Name
        
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
        vc.isHomeVersion = self.isHomeVersion
    }
    
    
}

