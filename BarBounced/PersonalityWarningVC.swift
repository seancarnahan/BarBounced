//
//  PersonalityWarningVC.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/9/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class PersonalityWarningVC: UIViewController {

    var finalAddedPlayers: [playerObject] = []
    var whichSegue = "game"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("LOADED PersonalityWarningVC")
        //print(finalAddedPlayers)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func startPersonGameButton(_ sender: Any) {
        whichSegue = "personality"
        performSegue(withIdentifier: "personGameSegue", sender: self)
    }
    
    
    @IBAction func pleaseReturnToGame(_ sender: Any) {
        whichSegue = "game"
        performSegue(withIdentifier: "returnToGameSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if whichSegue == "game" {
            let vc = segue.destination as! gameController
                   
            //sets value of a variable in gameController
            vc.finalAddedPlayers = self.finalAddedPlayers
        } else if whichSegue == "personality" {
            let PGVC = segue.destination as! PersonalityGameVC
                              
            //sets value of a variable in gameController
            PGVC.finalAddedPlayers = self.finalAddedPlayers
            
        }
       
    }
    
    
}
