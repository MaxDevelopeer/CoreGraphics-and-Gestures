//
//  ViewController.swift
//  CoreGraphics and Gestures
//
//  Created by Maxim on 09/02/2019.
//  Copyright © 2019 Maxim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = CardDeck()
    override func viewDidLoad() {
        for _ in 0...9 {
            if let card = deck.draw() {
                print("\(card)")
            }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

