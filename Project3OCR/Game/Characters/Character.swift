//
//  characters.swift
//  jeu
//
//  Created by Anthony Laurent on 29/06/2021.
//

import Foundation
// Class for all character
class Character {
    
    var name: String
    var life: Int
    var weapon: Weapon
    
    var info: String {
        return "\(name):\(life)PV"
    }
    
    init (name: String , life: Int ,weapon: Weapon ) {
        self.name = name
        self.life = life
        self.weapon = weapon
        
    }
    // Name a character
    func namedCharacter() {
        print("Veuillez donner un nom à votre personnage")
        
        if let characterName = readLine() {
            name = characterName
        }
    }
    // So that the character name must unique
    func uniqueName(arrayOfCharacters : [Character]) -> Bool {
        for character in arrayOfCharacters {
            if character.name == name {
                print("Veuillez donner un autre nom, celui là est déjà pris")
                return false
            }
        }
        print("Je m'appelle \(name) avec \(life)PV équipé de \(weapon.info)")
        return true
    }
    //If a chest is found, know if the player wants to change weapon or keep the one equipped
    func openChest (chest: Chest) {
        print("Voulez vous remplacer l'arme \(weapon.info) par \(chest.weapon.name):\(chest.weapon.damage)DMG ? Y/N")
        if let choice = readLine() {
            switch choice.lowercased() {
            case "y": weapon = chest.weapon
                print("Vous vous équipez de l'arme trouvé.")
                
            case "n": print("Vous gardez l'arme équipé.")
            default:
                print("Vous vous êtes trompé!")
                openChest(chest: chest)
            }
        }
    }
    // Attack and subtract damage from the target
    func attack(target: Character) {
        print("\(name) attaque \(target.name)")
        target.life = target.life - weapon.damage
        print ("\(target.name) perd \(weapon.damage)PV")
    }
}

    
