//
//  ThreeCardModel.swift
//  ThreeCards
//
//  Created by Joel Hollingsworth on 9/27/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import Foundation
import UIKit

class MatchGame {
    let deck = Deck()
    var hand: [Card] = []
    
    var flips = 0
    
    init() {
        for _ in 1...16 {
            hand.append(deck.dealRandomCard())
        }
    }
    
    // Return the image from the card in the hand
    func getCardImage(_ which: Int) -> UIImage {
        return hand[which].getCurrentImage()
    }
    
    // flip one card in the hand
    func flipCard(_ which: Int) {
        hand[which].flip()
        flips = flips + 1
    }
    
}
