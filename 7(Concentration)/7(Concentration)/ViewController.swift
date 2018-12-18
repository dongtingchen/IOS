//
//  ViewController.swift
//  7(Concentration)
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardButons.count + 1) / 2)
    
    @IBOutlet weak var Score: UILabel!
    @IBOutlet var cardButons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in cardButtons!")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButons.indices {
            let button = cardButons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                 button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        Score.text = "Score: \(game.score)"
    }
    
    var themes = [0:["🎃","👻","🐶","🐱","🐭","🐹","🦊","🐼","🐵","🐮","🐸"],
                  1:["🍏","🍎","🍐","🍊","🍋","🍌","🍉","🍇","🍑","🍒","🍓"],
                  2:["⚽️","🏀","🏈","⚾️","🎱","🏉","🏐","🎾","🏓","🏸","🏒"],
                  3:["🌿","☘️","🌴","🌱","🌵","🎄","🌳","🍂","🍃","🌺","🌷"],
                  4:["❤️","🧡","💛","💚","💙","🖤","💜","💔","💖","💘","💝"],
                  5:["☀️","🌤","⛅️","🌥","☁️","🌦","🌧","❄️","💦","☔️","💨"]]
    
    //var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    lazy var emojiChoices = themes[0]!
    var emoji = [Int: String]()
    
    func emoji(for card:Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }

    @IBAction func newGame(_ sender: Any) {
        game = Concentration(numberOfPairsOfCards: (cardButons.count + 1) / 2)
        let them = Int(arc4random_uniform(UInt32(themes.keys.count)))
        emojiChoices = themes[them]!
        updateViewFromModel()
    }
}

