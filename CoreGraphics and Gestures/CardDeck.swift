//
//  CardDeck.swift
//  CoreGraphics and Gestures
//
//  Created by Maxim on 09/02/2019.
//  Copyright © 2019 Maxim. All rights reserved.
//

import Foundation

struct CardDeck {
    private(set) var cards = [Card]()
    
    init () {
        for colour in Card.Colour.all {
            for number in 0...9 {
                cards.append(Card(colour: colour, number: number))
            }
        }
    }
    mutating func draw() -> Card? {
        if cards.count>0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}



extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
