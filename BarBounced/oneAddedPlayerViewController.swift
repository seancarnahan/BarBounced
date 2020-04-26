//
//  oneAddedPlayerViewController.swift
//  BarBounced
//
//  Created by Sean Carnahan on 4/13/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

class oneAddedPlayerViewController: UIViewController {

    @IBOutlet weak var playerLabel: UILabel!
    
    var user1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerLabel.text = user1

        // Do any additional setup after loading the view.
    }
    

}
