//
//  ViewController.swift
//  BarBounced
//
//  Created by Sean Carnahan on 3/24/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addPlayerTextField: UITextField!
    
    var player1Name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Head Hancho -> first person -> the rest are just ur average honchos
    }
    
    @IBAction func addPlayerButton(_ sender: UIButton) {
        self.player1Name = addPlayerTextField.text!
        performSegue(withIdentifier: "addedPlayer1Segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! oneAddedPlayerViewController
        vc.user1 = self.player1Name
    }
    
    
    
}

