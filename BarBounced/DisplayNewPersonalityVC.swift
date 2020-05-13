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
    var peopleToDisplay : [Int] = []
    var replacementTitle = ""
    var isSecondCard = false
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ruleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var player1 = peopleToDisplay[0]
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
            performSegue(withIdentifier: "gameLoopSegue", sender: self)
        }
        
        if peopleToDisplay.count > 1 {
            displaySecondPerson()
            
        } else {
            //then segue
            performSegue(withIdentifier: "gameLoopSegue", sender: self)
        }
    }
    
    @objc func rightViewTapped() {
        
        if isSecondCard {
            //then segue
            performSegue(withIdentifier: "gameLoopSegue", sender: self)
        }
        
        if peopleToDisplay.count > 1 {
            displaySecondPerson()
        } else {
            //then segue
            performSegue(withIdentifier: "gameLoopSegue", sender: self)
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
        let vc = segue.destination as! gameController
          
          
        vc.finalAddedPlayers = self.finalAddedPlayers
    }
}
