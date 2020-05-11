//
//  PersonalityWarningVC.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/9/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class PersonalityWarningVC: UIViewController {

    var finalAddedPlayers: [String:String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LOADED PersonalityWarningVC")
        print(finalAddedPlayers)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pleaseReturnToGame(_ sender: Any) {
        performSegue(withIdentifier: "returnToGameSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! gameController
        
        //sets value of a variable in gameController
        vc.finalAddedPlayers = self.finalAddedPlayers
    }
    
    
}
