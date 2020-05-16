//
//  gameController.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/9/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//
//DIFFERENCE BETWEEN CLASS AND STRUCT:
//When you pass a class object around your program, you are actually passing a reference to that object, so different parts of your program can share and modify your object. When you pass a structure [ or enum] around your program, what gets passes around is a copy of the structure. So modifications to structures don’t get shared.

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1.0)
    }
}



class gameController: UIViewController {
    //USER should be replaced with random name
    var gameMessages = [
        "Must vote as a group and decide who they believe is the least likely to be able to swim.": false,
        "Must vote and decide who is most likely to get a kill tonight": false,
        "Say this outload: 'First to stand on a table doesnt have to drink. 1 . 2 . 3 GO! ": false,
        "Play Drive": false,
        "Play Waterfall regarding the person who reads this card": false,
        "You are not a true sender, the player to the USER1's right, take off your pants or else drink": true,
        "You are not a true sender, look at this card and make the person to the right drink twice because you have no goals in your life": false,
        "USER1 slaps USER2 or drink": true
    ]
    
    var ordinalCounter = 0
    var finalAddedPlayers: [playerObject] = []
    var listOfGames: [GameObj] = []
    var gameCardCounter = 0
    var isHomeVersion = 0
    
    class GameObj {
        var ordinal: Int?
        var color: UIColor?
        
        var personality: String?
        var message: String?
        var personalityGame: Bool?
    }


    @IBOutlet weak var gameViewMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TESTING
        for player in finalAddedPlayers {
            print("playerID", player.playerID!)
            print("playerName", player.playerName!)
        }
        
        

        //construct games object -> underscore means we dont use that item
        for (key,value) in gameMessages {
            populateListofGames(key: key, value: value)
        }
        
        //ViewListOfGames() //print contents of listOfGames
        
        
        
        
        //LEFT TAP and RIGHT TAP
        let touchArea = CGSize(width: self.view.frame.width/2, height: self.view.frame.height)
        let leftView = UIView(frame: CGRect(origin: .zero, size: touchArea))
        let rightView = UIView(frame: CGRect(origin: CGPoint(x: self.view.frame.width - touchArea.width, y: 0), size: touchArea))
    leftView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftViewTapped)))
    rightView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightViewTapped)))

        self.view.addSubview(leftView)
        self.view.addSubview(rightView)

        
        //START GAME -> show new Card
        populateGameCard()
        
    }
    
    @objc func leftViewTapped() {
        
        populateGameCard()
        
    }
    
    @objc func rightViewTapped() {
        
        populateGameCard()
    }
    
    
    func populateGameCard(){
        let randomList = [1,2,3]
        let random = randomList.randomElement()
        let amountOfPlayers = finalAddedPlayers.count
        
        //algorithm
        let randomizerDict = [
            2:[10,13],
            3:[10,13],
            4:[10,13],
            5:[6,8],
            6:[6,8],
            7:[6,8],
            8:[6,8],
            9:[4,5],
            10:[4,5],
            11:[4,5],
            12:[4,5],
            13:[3,4],
            14:[3,4],
            15:[3,4],
            16:[3,4],
        ]
        
        let start = randomizerDict[amountOfPlayers]![0]
        let end = randomizerDict[amountOfPlayers]![1]
        
        
        if gameCardCounter == start && random == 1 {
            //possibility of segue to personality warning
        
            performSegue(withIdentifier: "personalityWarningSegue", sender: self)
            
        } else if gameCardCounter == end {
            //absolutely segue to personality warning
            performSegue(withIdentifier: "personalityWarningSegue", sender: self)
        }
    
        
        
        let game = getRandomGame()
        
        gameViewMessage.text = game.message
        view.backgroundColor = game.color
        gameCardCounter += 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! PersonalityWarningVC
        
        //sets value of a variable in gameController
        vc.finalAddedPlayers = self.finalAddedPlayers
        vc.isHomeVersion = self.isHomeVersion
    }
    
    func populateListofGames(key: String, value: Bool) {
        let newGame = GameObj()
    
        
        //add userName field
        //nameToReplace has 2 different random names associated with it
        let nameToReplace = getRandomName()
        
        if value {
            newGame.message = key.replacingOccurrences(of: "USER1", with: nameToReplace[0])
            
            
            newGame.message = newGame.message!.replacingOccurrences(of: "USER2", with: nameToReplace[1])
        } else {
            newGame.message = key
        }
        
        
        //add random color for background
        let randomColor: UIColor = .random
        
        
        //SET FIELDS
        newGame.ordinal = ordinalCounter
        newGame.color = randomColor
        
        newGame.personality = ""
        
        newGame.personalityGame = false //add logic
        
        ordinalCounter += 1
        
        listOfGames.append(newGame)
        
    }
    
    func getRandomName() -> [String]{
        //add check to see if any players were added
        var randomNames : [String] = []
        var randomNamesToSend : [String] = []
        for player in finalAddedPlayers {
            randomNames.append(player.playerName!)
        }
        
        let player1 = randomNames.randomElement()!
        randomNamesToSend.append(player1)
        var player2 : String
        
        //make sure we dont repeat a name
        while true {
            player2 = randomNames.randomElement()!
            if player1 != player2 {
                randomNamesToSend.append(player2)
                break
            }
        }
        
        return randomNamesToSend
    }
    
    func getRandomGame() -> GameObj{
        return listOfGames.randomElement()!
    }
    

//    var listOfColors: [String] = ["0xfc0303", "0xfc8003", "0xfcfc03", "0x03ff03", "0x0303ff", "0x8103ff", "0xff03ff"]
//
    
    
}
