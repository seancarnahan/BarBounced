//
//  PersonalityGameVC.swift
//  BarBounced
//
//  Created by Sean Carnahan on 5/10/20.
//  Copyright © 2020 Sean Carnahan. All rights reserved.
//

import UIKit

extension UIColor {
    static var  randomColor: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                        blue: .random(in: 0...1),
                        alpha: 1.0)
    }
}

class PersonalityGameVC: UIViewController {
    var gameMessages = [
        "The Wine Aficionado" : ["The Wine Aficionado game USER",true],
        "The Heart Breaker" :  ["The Heart Breaker game USER",true],
        "The Sound Cloud Rapper" :  ["The Sound Cloud Rapper game",false],
        "The Celebrity" :  ["The Celebrity game",false],
        "The Matt Mercier" :  ["The Matt Mercier game",false],
        "The Uber" :  ["The Uber game",false],
        "The Really Personal Card": ["The Really Personal Card game USER",true] ,
        "The medium card" : ["The medium card game",false],
        "The Mr. Worldwide Card":  ["The Mr. Worldwide Card game",false],
        "The Drug Dealer Card": ["The Drug Dealer Card game USER",true] ,
        "The Conservationist Card": ["The Conservationist Card game",false] ,
        "The anonymous card": ["The anonymous card game",false],
        "The Nicotine Fiend": ["The Nicotine Fiend game",false] ,
        "The Marriage Proposal Card":  ["The Marriage Proposal Card game",false],
        "The Judgement day Card":  ["The Judgement day Card game USER",true],
        "The Ray Charles Cousin Card": ["The Ray Charles Cousin Card game USER",true] ,
        "The Magician Card": [ "The Self Centered Role game",false],
        "The Self Centered Role":  ["The Self Centered Role game USER",true],
        "The Average Size Card": ["The Average Size Card game USER",true] ,
        "The Where do I know you from card":  ["The Where do I know you from card game USER",true],
        "Young Entrepreneur Card": ["Young Entrepreneur Card game USER",true] ,
        "The Lumberjack Card": ["The Lumberjack Card game USER",true]
    ]
    
    var personMessages = [
        "The Wine Aficionado" : "must talk to people about their poor drink choices, only drink wine for the night and explain to everyone the taste of their wine and how much better it is than their drink",
        "The Heart Breaker" : "You have to bring up your ex at least 2x in each conversation",
        "The Sound Cloud Rapper": "You have to say 'I'm on the fucking come up bro' in each of your conversations through the night",
        "The Celebrity" : "Must flex on each person they see and emphasize how they have testosterone pumping through their veins and say 'you don't know who I know' or 'my bros will fuck you up') in each of your conversations",
        "The Matt Mercier" : "Must acknowledge how their race has affected their past and must say 'roll tide' after each conversation or wear a MAGA hat",
        "The Uber": "Ask each person if you can order an Uber for them, then never order it of ask for their credit card number",
        "The Really Personal Card":"You have to ask about their most recent death, or just start rambling about yours and say how a depressed sack of shit you are",
        "The medium card":"Must explain that you can talk to the dead and see the future, during your conversations show off your skills",
        "The Mr. Worldwide Card": "Must say 'Delé' after each sentence, unironically",
        "The Drug Dealer Card": "Must offer drugs during each conversation but must use words/slang no one will understand. Exp. 'Wanna soar this bird",
        "The Conservationist Card": "Must bring up how the global climate crisis is the only topic you can converse about and if any other topic comes up, then you must consider them an earth hater",
        "The anonymous card":"Must never give your real name to anybody, the group you are playing with will assign you with new names that you have to go with for the rest of the night",
        "The Nicotine Fiend": "Must walk up to at least 12 people by the end of the night and beg them for their nicotine mention how you quit recently.  Dont take no for an anwser",
        "The Marriage Proposal Card": "Must propose to a friend/stranger in front of everyone",
        "The Judgement day Card":"Must ask at least 20 people to rate them on their looks on a scale of 1-10",
        "The Ray Charles Cousin Card":"You are now Ray Charles cousin and you have to mention how your cousin was so talented and you wish he wasn't blind and how you're a better piano player because you can see.  Stop questioning this card, you picked it, don't put this on me",
        "The Magician Card":"must perform a magic trick to each person they meet, the magic doesn't have to work, that's what makes it magic",
        "The Self Centered Role":"Everything you talk about with anybody must be brought back into how your endeavors have a correlation with the topic",
        "The Average Size Card":"Must acknowledge how mediocre is the best of the best.  Talk about how your average size penis is the best.  Good luck with this one bud",
        "The Where do I know you from card":"Must go up to strangers and ask them where you know them from.  Get offended if they do not remember you",
        "Young Entrepreneur Card":"Must talk about how you have multiple forms of passive income and that college isn't for you and a waste of time but you are very must interested in gaining knowledge.  You live at your parents home",
        "The Lumberjack Card":"Must wear a flannel and button it up all the way, beard"
    ]
    
    var finalAddedPlayers: [String:String] = [:]
    var listOfPersonCards: [PGameObj] = []
    var ordinalCounter = 0
    
    @IBOutlet weak var pGameTitle: UILabel!
    
    @IBOutlet weak var pGameMain: UILabel!
    
    class PGameObj {
        var ordinal : Int?
        var message : String?
        var name : String?
        var color : UIColor?
        var personalityGame = true
        var gameMessage : String?
        var isPerson: Bool?
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("personality game LOADED")
        for (key,value) in personMessages {
            populateListOfPersonCards(key: key, value: value)
        }
        
        //viewListOfPersonCards() //-> used for debugging purposes
        
        populatePCard()
        
    }
    
    func populatePCard() {
        let randomCard = getRandomPCard()
        let titleText = pGameTitle.text!
        
        pGameTitle.text = titleText.replacingOccurrences(of: "BLANK", with:randomCard.name!)
        
        view.backgroundColor = randomCard.color
        pGameMain.text = randomCard.gameMessage
        
        
    }
    
    func populateListOfPersonCards(key: String, value: String) {
        let newPGame = PGameObj()
        
        //add random color for background
        let randomColor: UIColor = .randomColor
        
        
        //populate personality card game

        
        
        newPGame.ordinal = ordinalCounter
        newPGame.message = value
        newPGame.name = key
        newPGame.color = randomColor
        newPGame.gameMessage = getPGame(cardName: key)
        ordinalCounter += 1
        
        listOfPersonCards.append(newPGame)
        
    }
    
    func getRandomName() -> String{
        //add check to see if any players were added
        
        return finalAddedPlayers.keys.randomElement()!
        
    }
    
    func getRandomPCard() -> PGameObj {
        return listOfPersonCards.randomElement()!
    }
    
    func getPGame(cardName: String) -> String {
        let nameToReplace = getRandomName()
        print("-------")
        print(cardName)
        if cardName == "The Wine aficionado" {
            print("BREAK")
        }
        print(gameMessages[cardName]![0])
        let pGameMessage = gameMessages[cardName]![0]
        
        if ((gameMessages[cardName]?[1]) != nil) {
            return (pGameMessage as AnyObject).replacingOccurrences(of: "USER", with:nameToReplace)
        } else {
            return pGameMessage as! String
        }
    }
    
    
    func viewListOfPersonCards() {
        for game in listOfPersonCards {
            print("-----------Game ", game.ordinal!, ": -------------------")
            print("Ordinal:",game.ordinal!)
            print("name:",game.name!)
            print("message:",game.message!)
            print("color:",game.color!)
            print("personalityGame:",game.personalityGame)
        }
    }

}
