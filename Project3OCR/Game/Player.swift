//
//  Player.swift
//  Project3OCR
//
//  Created by Anthony Laurent on 01/07/2021.
//

import Foundation

class Player {
    
    var name: String
    
    var characters:[Character] = []
    
    init(name: String) {
        self.name = name
    }
    
    // Give a name to the player
    private func namedPlayer() {
        print("Veuillez entrer votre nom")
        
        if let namedPlayer = readLine() {
            name = namedPlayer
        }
    }
    
    private func charactersList() {
        print("Vous avez \(characters.count) personnage(s). (\(characters.count)/3)")
        print("Veuillez suivre la consigne suivante:")
        print("Tapez 1 pour choisir l'Alien (60PV/20ATK)")
        print("Tapez 2 pour choisir l'Humain (100PV/10ATK)")
        print("Tapez 3 pour choisir le Robot (150PV/5ATK)")
        print("Tapez 4 pour choisir l'Homme-poisson (80PV/15ATK)")
    }
    
    private func chooseCharacter() {
        print("\(name) veuillez choisir un personnage")
        if let readline = readLine() {
            if let choice = Int (readline) {
                switch choice {
                
                case 1:
                    let alien = Alien()
                    alien.namedCharacter()
                    if alien.uniqueName(arrayOfCharacters: self.characters) == true {
                        characters.append(alien)
                    }
                    
                case 2:
                    let human = Human()
                    human.namedCharacter()
                    if human.uniqueName(arrayOfCharacters: self.characters) == true {
                        characters.append(human)
                    }
                    
                case 3:
                    let robot = Robot()
                    robot.namedCharacter()
                    if robot.uniqueName(arrayOfCharacters: self.characters) == true {
                        characters.append(robot)
                    }
                    
                case 4:
                    let fishman = Fishman()
                    fishman.namedCharacter()
                    if fishman.uniqueName(arrayOfCharacters: self.characters) == true {
                        characters.append(fishman)
                    }
                    
                default:
                    print("Veuillez entrer un chiffre entre 1 et 4.")
                    chooseCharacter()
                }
            }
        }
    }
    // Show the team of each player
    func teamView() {
        for character in characters {
            print("\(character.info)  ;  \(character.weapon.info)")
        }
    }
    // Create the team of each player
    func chooseTeam() {
        namedPlayer()
        print("A vous de jouer \(name)")
        let maxCharacter = 3
        
        while characters.count < maxCharacter {
            
            charactersList()
            chooseCharacter()
        }
        teamView()
    }
    // Select a character, for attack or target (asTarget).
    func selectCharacter(characters: [Character], asTarget: Bool) -> Character {
        if asTarget {
            print("Veuillez choisir une cible")
        }
        
        characters.enumerated().forEach { index, character in
            print("Veuillez taper \(index+1) pour \(character.info) ; \(character.weapon.info)")
        }
        
        if let choice = readLine() {
            if let choice = Int(choice) {
                if choice <= 3 && choice >= 1 {
                    return characters[choice - 1]
                }
            }
        }
        
        return selectCharacter(characters: characters, asTarget: asTarget)
    }
    
    // Check if a character is dead and remove them from the team
    func checkTeamLife() {
        var dead = 0
        
        for _ in characters {
            if characters[dead].life <= 0 {
                print("\(characters[dead].name) meurt!")
                characters.remove(at: dead)
                
                break
            } else {
                print("")
            }
            dead += 1
        }
    }
}

      

