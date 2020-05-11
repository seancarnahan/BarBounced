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
    
    var personGameMessages = [
        "Wine aficionado card" : "must talk to people about their poor drink choices, only drink wine for the night and explain to everyone the taste of their wine and how much better it is than their drink",
        "Break up card" : "You have to bring up your ex at least 2x in each conversation",
        "Sound Cloud Rapper Card": "You have to say 'I'm on the fucking come up bro' in each of your conversations through the night",
        "The Celebrity Card" : "Must flex on each person they see and emphasize how they have testosterone pumping through their veins and say 'you don't know who I know' or 'my bros will fuck you up') in each of your conversations",
        "The Matt Mercier Card" : "Must acknowledge how their race has affected their past and must say 'roll tide' after each conversation or wear a MAGA hat",
        "The Uber Card": "Ask each person if you can order an Uber for them, then never order it of ask for their credit card number",
        "The Really Personal Card":"You have to ask about their most recent death, or just start rambling about yours and say how a depressed sack of shit you are",
        "The medium card":"Must explain that you can talk to the dead and see the future, during your conversations show off your skills",
        "The Mr. Worldwide Card": "Must say 'Delé' after each sentence, unironically",
        "The Drug Dealer Card": "Must offer drugs during each conversation but must use words/slang no one will understand. Exp. 'Wanna soar this bird",
        "The Conservationist Card": "Must bring up how the global climate crisis is the only topic you can converse about and if any other topic comes up, then you must consider them an earth hater",
        "The anonymous card":"Must never give your real name to anybody, the group you are playing with will assign you with new names that you have to go with for the rest of the night",
        "The Nicotine Fiend": "Must walk up to at least 12 people by the end of the night and beg them for their nicotine mention how you quit recently.  Dont take no for an anwser",
        "The Marriage Proposal Card": "Must propose to a friend/stranger in front of everyone",
        "The Judgement day Card":"Must ask at least 20 people to rate them on their looks on a scale of 1-10",
        "Ray Charles Cousin Card":"You are now Ray Charles cousin and you have to mention how your cousin was so talented and you wish he wasn't blind and how you're a better piano player because you can see.  Stop questioning this card, you picked it, don't put this on me",
        "The Magician Card":"must perform a magic trick to each person they meet, the magic doesn't have to work, that's what makes it magic",
        "Self Centered Role":"Everything you talk about with anybody must be brought back into how your endeavors have a correlation with the topic",
        "The Average Size Card":"Must acknowledge how mediocre is the best of the best.  Talk about how your average size penis is the best.  Good luck with this one bud",
        "Where do I know you from card":"Must go up to strangers and ask them where you know them from.  Get offended if they do not remember you",
        "Young Entrepreneur Card":"Must talk about how you have multiple forms of passive income and that college isn't for you and a waste of time but you are very must interested in gaining knowledge.  You live at your parents home",
        "The Lumberjack Card":"Must wear a flannel and button it up all the way, beard"
    ]
    
    var finalAddedPlayers: [String:String] = [:]
    var listOfPersonGames: [PGameObj] = []
    var ordinalCounter = 0
    
    @IBOutlet weak var pGameTitle: UILabel!
    
    @IBOutlet weak var pGameMain: UILabel!
    
    class PGameObj {
        var ordinal : Int?
        var message : String?
        var name : String?
        var color : UIColor?
        var personalityGame = true
        var game : String?
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("personality game LOADED")
        for (key,value) in personGameMessages {
            populateListOfPersonGames(key: key, value: value)
        }
        
        //viewListOfPersonGames() //-> used for debugging purposes
        
        populatePGameCard()
        
    }
    
    func populatePGameCard() {
        let randomCard = getRandomPGame()
        let titleText = pGameTitle.text!
        
        pGameTitle.text = titleText.replacingOccurrences(of: "BLANK", with:randomCard.name!)
        
        view.backgroundColor = randomCard.color
        pGameMain.text = randomCard.message
        
        
    }
    
    func populateListOfPersonGames(key: String, value: String) {
        let newPGame = PGameObj()
        
        //add random color for background
        let randomColor: UIColor = .randomColor
        
        newPGame.ordinal = ordinalCounter
        newPGame.message = value
        newPGame.name = key
        newPGame.color = randomColor
        ordinalCounter += 1
        
        listOfPersonGames.append(newPGame)
        
    }
    
    func getRandomPGame() -> PGameObj {
        return listOfPersonGames.randomElement()!
    }
    
    func viewListOfPersonGames() {
        for game in listOfPersonGames {
            print("-----------Game ", game.ordinal!, ": -------------------")
            print("Ordinal:",game.ordinal!)
            print("name:",game.name!)
            print("message:",game.message!)
            print("color:",game.color!)
            print("personalityGame:",game.personalityGame)
        }
    }

}
