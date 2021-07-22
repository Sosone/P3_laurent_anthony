//
//  Chest.swift
//  Project3OCR
//
//  Created by Anthony Laurent on 01/07/2021.
//

import Foundation

// Generate a random weapon
class Chest {
    
    let weapon: Weapon
    
    init() {
        let allWeapons = [
            Lucille(),
            FryingPan(),
            Scissors(),
            Tonfa(),
            Hammer(),
            Axe(),
            Stapler(),
            Knife()
        ]
        let weaponsRandomIndex = Int(arc4random_uniform(7))
        weapon = allWeapons[weaponsRandomIndex]
    }
}
