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

class gameController: UIViewController {
    var gameMessages = [
        "Must vote as a group and decide who they believe is the least likely to be able to swim.",
        "Must vote and decide who is most likely to get a kill tonight",
        "First to stand to stand on a table",
        "Play Drive",
        "Play Waterfall regarding the person who reads this card",
        "You are not a true sender, take off your pants or else drink",
        "You are not a true sender, look at this card and make the person to the right drink twice because you have no goals in your life"
    ]
    
    var ordinalCounter = 0
    
    class GameObj {
        var ordinal: Int?
        var color: String?
        var userName: Bool?
        var message: String?
        var personalityGame: Bool?
    }

    var finalAddedPlayer: [String] = []
    var listOfGames: [GameObj] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LOADED: gameController.swift")
        print(finalAddedPlayer)

        //construct games object -> underscore means we dont use that item
        for _ in gameMessages {
            populateListofGames()
        }
        
        ViewListOfGames() //print contents of listOfGames
    }
    
    func populateListofGames() {
        let newGame = GameObj()
        newGame.ordinal = ordinalCounter
        newGame.color = "(--Replace with hex value--)" //add logic
        newGame.userName = false //add logic
        newGame.message = gameMessages[ordinalCounter]
        newGame.personalityGame = false //add logic
        
        ordinalCounter += 1
        
        listOfGames.append(newGame)
    }
    
    func ViewListOfGames(){
        for game in listOfGames {
            print("-----------Game ", game.ordinal!, ": -------------------")
            print(game.ordinal!)
            print(game.color!)
            print(game.userName!)
            print(game.message!)
            print(game.personalityGame!)
        }
    }
}
