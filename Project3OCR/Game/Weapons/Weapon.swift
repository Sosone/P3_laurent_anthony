//
//  Weapon.swift
//  jeu
//
//  Created by Anthony Laurent on 29/06/2021.
//

import Foundation
// Class for all Weapons
class Weapon {
    
    var damage: Int
    var name: String
    
    var info: String {
        return "\(name):\(damage)DMG"
    }
    
    init(damage: Int , name: String) {
        self.damage = damage
        self.name = name
    }
}
