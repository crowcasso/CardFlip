//
//  Card.swift
//  CardFlip
//
//  Created by Joel Hollingsworth on 9/25/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit

class Card {
    
    //: Properties
    var value: String
    var suit: String
    
    enum CardState {
        case up
        case down
        case matched
    }
    
    var state = CardState.down
    
    var upImage: UIImage
    var downImage = #imageLiteral(resourceName: "back")
    
    var text: String
    
    // initializer for the class
    init(_ value: String, _ suit: String) {
        self.value = value
        self.suit = suit
        
        upImage = UIImage(named: "\(value)_of_\(suit)")!
        
        text = "\(value) of \(suit)"
    }
    
    // the current image based on the card state
    func getCurrentImage() -> UIImage {
        if state == .down {
            return downImage
        }
        
        // for up and matched return upImage
        return upImage
    }
    
    // flip the card over
    func flip() {
        if state == .up {
            state = .down
        } else {
            state = .up
        }
        // do nothing for state == .matched
    }
    
    func isMatched() -> Bool {
        return state == .matched
    }
}
