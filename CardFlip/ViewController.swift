//
//  ViewController.swift
//  CardFlip
//
//  Created by Joel Hollingsworth on 10/3/17.
//  Copyright © 2017 Joel Hollingsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card0_0: UIImageView!
    @IBOutlet weak var card0_1: UIImageView!
    @IBOutlet weak var card0_2: UIImageView!
    @IBOutlet weak var card0_3: UIImageView!
    @IBOutlet weak var card1_0: UIImageView!
    @IBOutlet weak var card1_1: UIImageView!
    @IBOutlet weak var card1_2: UIImageView!
    @IBOutlet weak var card1_3: UIImageView!
    @IBOutlet weak var card2_0: UIImageView!
    @IBOutlet weak var card2_1: UIImageView!
    @IBOutlet weak var card2_2: UIImageView!
    @IBOutlet weak var card2_3: UIImageView!
    @IBOutlet weak var card3_0: UIImageView!
    @IBOutlet weak var card3_1: UIImageView!
    @IBOutlet weak var card3_2: UIImageView!
    @IBOutlet weak var card3_3: UIImageView!
    
    var imageViews: [UIImageView] = []
    
    @IBOutlet weak var flipsLabel: UILabel!
    
    let matchGame = MatchGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // place the imageviews into an array to mimic the hand of cards
        imageViews = [ card0_0, card0_1, card0_2, card0_3,
                       card1_0, card1_1, card1_2, card1_3,
                       card2_0, card2_1, card2_2, card2_3,
                       card3_0, card3_1, card3_2, card3_3 ]
        
        // assign the images from the hand of cards
        for i in 0..<imageViews.count {
            imageViews[i].image = matchGame.getCardImage(i)
        }
    }
    
    @IBAction func cardTapped(_ sender: UITapGestureRecognizer) {
        
        // figure out which UIImageView was tapped
        let cardImageView = sender.view! as! UIImageView
        
        // determine which UIImageView was tapped
        var which = -1
        for i in 0..<imageViews.count {
            if imageViews[i] == cardImageView {
                which = i
            }
        }
        
        // flip the card and update the UI
        matchGame.flipCard(which)
        imageViews[which].image = matchGame.getCardImage(which)
        
        // update the flip lable
        flipsLabel.text = "Flips: \(matchGame.flips)"
    }


}

