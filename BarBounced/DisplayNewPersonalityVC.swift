//
//  DisplayNewPersonalityVC.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/12/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class DisplayNewPersonalityVC: UIViewController {
    
    var finalAddedPlayers: [playerObject] = []
    var peopleToDisplay : [Int] = [] //list of playerids //these need to be ordered
    var replacementTitle = ""
    var isSecondCard = false
    var isTriggeredExit = false
    var isHomeVersion = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ruleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player1 = peopleToDisplay[0]
        
        replacementTitle = finalAddedPlayers[player1].playerName! + " is now " + finalAddedPlayers[player1].personalityTitle!
        
        titleLabel.text = replacementTitle
        ruleLabel.text = finalAddedPlayers[player1].personalityRules
        
            //LEFT TAP and RIGHT TAP
            let touchArea = CGSize(width: self.view.frame.width/2, height: self.view.frame.height)
            
            let leftView = UIView(frame: CGRect(origin: .zero, size: touchArea))
            let rightView = UIView(frame: CGRect(origin: CGPoint(x: self.view.frame.width - touchArea.width, y: 0), size: touchArea))
        leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftViewTapped)))
        rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightViewTapped)))

            self.view.addSubview(leftView)
            self.view.addSubview(rightView)
    }
    
    @objc func leftViewTapped() {
        if isSecondCard {
            //then segue
            if isTriggerExit() {
                if finalAddedPlayers.count > 8 {
                     performSegue(withIdentifier: "gameOverSegue", sender: self)
                } else {
                    performSegue(withIdentifier: "eightOrLessSegue", sender: self)
                }
            } else {
                performSegue(withIdentifier: "gameLoopSegue", sender: self)
            }
        }
        
        
        if peopleToDisplay.count > 1 {
            displaySecondPerson()
        } else {
            //then segue
            if isTriggerExit() {
                if finalAddedPlayers.count > 8 {
                     performSegue(withIdentifier: "gameOverSegue", sender: self)
                } else {
                    performSegue(withIdentifier: "eightOrLessSegue", sender: self)
                }
            } else {
                performSegue(withIdentifier: "gameLoopSegue", sender: self)
            }
        }
    }
    
    
    
    
    @objc func rightViewTapped() {
        
        if isSecondCard {
            //then segue
            if isTriggerExit() {
                if finalAddedPlayers.count > 8 {
                     performSegue(withIdentifier: "gameOverSegue", sender: self)
                } else {
                    performSegue(withIdentifier: "eightOrLessSegue", sender: self)
                }
            } else {
                performSegue(withIdentifier: "gameLoopSegue", sender: self)
            }
        }
        
        
        if peopleToDisplay.count > 1 {
            displaySecondPerson()
        } else {
            //then segue
            if isTriggerExit() {
                if finalAddedPlayers.count > 8 {
                     performSegue(withIdentifier: "gameOverSegue", sender: self)
                } else {
                    performSegue(withIdentifier: "eightOrLessSegue", sender: self)
                }
            } else {
                performSegue(withIdentifier: "gameLoopSegue", sender: self)
            }
        }
    }
    
    func displaySecondPerson(){
        isSecondCard = true
        let player2 = peopleToDisplay[1]
        replacementTitle = finalAddedPlayers[player2 ].playerName! + " is now " + finalAddedPlayers[player2].personalityTitle!
        
        titleLabel.text = replacementTitle
        ruleLabel.text = finalAddedPlayers[player2].personalityRules
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isTriggeredExit {
            //is there less than 9 players
            //eightOrLessSegue
            if finalAddedPlayers.count > 8 {
                let exitVC = segue.destination as! ExitConditionVC
                exitVC.finalAddedPlayers = self.finalAddedPlayers
                           
            } else {
                let exitEightOrLess = segue.destination as! exitEightOrLessVC
                exitEightOrLess.finalAddedPlayers = self.finalAddedPlayers
            }
           
        } else {
            let vc = segue.destination as! gameController
            vc.finalAddedPlayers = self.finalAddedPlayers
            vc.isHomeVersion = self.isHomeVersion
        }

    }
    
    func isTriggerExit() -> Bool {
        var triggerExit = true
        for player in finalAddedPlayers {
            if player.hasPersonality == false {
                triggerExit = false
            }
        }
        
        if triggerExit {
            //perform segue
            isTriggeredExit = true
            return true
        } else {
            return false
        }
    }
}
