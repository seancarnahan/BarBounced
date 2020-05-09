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
    //USER should be replaced with random name
    var gameMessages = [
        "Must vote as a group and decide who they believe is the least likely to be able to swim.": false,
        "Must vote and decide who is most likely to get a kill tonight": false,
        "First to stand to stand on a table": false,
        "Play Drive": false,
        "Play Waterfall regarding the person who reads this card": false,
        "You are not a true sender, the player to the USER's right, take off your pants or else drink": true,
        "You are not a true sender, look at this card and make the person to the right drink twice because you have no goals in your life": false
    ]
    
    var ordinalCounter = 0
    
    class GameObj {
        var ordinal: Int?
        var color: String?
        var personalityWinner: String?
        var personality: String?
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
        for (key,value) in gameMessages {
            populateListofGames(key: key, value: value)
        }
        
        ViewListOfGames() //print contents of listOfGames
    }
    
    func populateListofGames(key: String, value: Bool) {
        let newGame = GameObj()
        
        //get random name
        print(getRandomName())
        
        //add userName field
        let nameToReplace = getRandomName()
        if value {
            newGame.message = key.replacingOccurrences(of: "USER", with:nameToReplace)
        } else {
            newGame.message = key
        }
        
        
        
        newGame.ordinal = ordinalCounter
        newGame.color = "(--Replace with hex value--)" //add logic
        newGame.personalityWinner = ""
        newGame.personality = ""
        
        newGame.personalityGame = false //add logic
        
        ordinalCounter += 1
        
        listOfGames.append(newGame)
        
    }
    
    func ViewListOfGames(){
        for game in listOfGames {
            print("-----------Game ", game.ordinal!, ": -------------------")
            print("Ordinal:",game.ordinal!)
            print("color:",game.color!)
            print("personalityWinner:",game.personalityWinner!)
            print("personality:",game.personality!)
            print("message:",game.message!)
            print("personalityGame:",game.personalityGame!)
        }
    }
    
    func getRandomName() -> String{
        //add check to see if any players were added
        return finalAddedPlayer.randomElement()!
    }
}
