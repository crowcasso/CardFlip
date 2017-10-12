//
//  MatchGame.swift
//  CardFlip
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
    var score = 0
    var message = "Welcome!"
    
    // used to remember the previous card for matching
    var previousCard: Card? = nil
    
    init() {
        // deal out 16 cards
        for _ in 1...16 {
            hand.append(deck.dealRandomCard())
        }
    }
    
    // return the image from the card in the hand
    func getCardImage(_ which: Int) -> UIImage {
        return hand[which].getCurrentImage()
    }
    
    // a card was tapped
    func cardTapped(_ which: Int) {
        
        // card is already up, do nothing
        if hand[which].state == .up {
            return
        }
        
        // flip and set the message
        hand[which].flip()
        message = hand[which].text
        
        // update flips/score values
        flips = flips + 1
        score = score - 1
        
        // this might be the new previousCard (if its not matched)
        var possiblePreviousCard: Card? = hand[which]
        
        // make sure we have a previous card
        if previousCard != nil {
            
            // go ahead and flip, it might be matched soon
            previousCard?.flip()
            
            // match on value?
            if previousCard?.value == hand[which].value {
                score = score + 16 + 1
                previousCard?.state = .matched
                hand[which].state = .matched
                possiblePreviousCard = nil
                message = "Matched on \(hand[which].value)"
            }
            
            // match of suit?
            if previousCard?.suit == hand[which].suit {
                score = score + 4 + 1
                previousCard?.state = .matched
                hand[which].state = .matched
                possiblePreviousCard = nil
                message = "Matched on \(hand[which].suit)"
            }
        }
        
        // set the previous card for the next tap
        previousCard = possiblePreviousCard
    }
    
    // is the card matched?
    func isMatched(_ which: Int) -> Bool {
        return hand[which].isMatched()
    }
}
