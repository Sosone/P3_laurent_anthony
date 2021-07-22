//
//  Robot.swift
//  jeu
//
//  Created by Anthony Laurent on 29/06/2021.
//

import Foundation

class Robot: Character {

    init() {
        super.init (name: "Robot" , life: 150 , weapon: Stapler() )
    }
}
