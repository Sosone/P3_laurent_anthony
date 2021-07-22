//
//  Game.swift
//  Project3OCR
//
//  Created by Anthony Laurent on 01/07/2021.
//

import Foundation

class Game {
    
    // Create player 1
    private let playerOne: Player
    
    // Create Player 2
    private let playerTwo: Player
    
    private var attacker: Player
    private var target: Player
    
    // Create turn
    private var turn = 1
    
    init() {
        playerOne = Player(name: "Joueur 1")
        playerTwo = Player(name: "Joueur 2")
        attacker = playerOne
        target = playerTwo
    }
    
    // func for launching game
     func start() {
        setup()
        play()
    }
    
    
    // Choose a name and a team
     private func setup() {
        print("Bienvenue dans le jeu!")
        print("Vous allez devoir composer une équipe de trois personnages, et de combattre chacun votre tour jusqu'a ce qu'une des deux équipes soit morte.")
        print("\(playerOne.name) choisit son nom et ensuite son équipe de trois personnages")
        playerOne.chooseTeam()
        
        print("\(playerTwo.name) choisit son nom et ensuite son équipe de trois personnages")
        playerTwo.chooseTeam()
    }
    
    // Loop to constitute the fight, with the opening of the chest and the attack of the enemy character
     private func play() {
        print("\nMaintenant que vous avez constitués vos deux équipes, à l'attaque !!!\n")
        
        while attacker.characters.count != 0 || target.characters.count != 0 {
            print("\(attacker.name) choisit un personnage de son équipe, puis un personnage ennemis à attaquer.")
            attacker.teamView()
            
            let attackCharacter = attacker.selectCharacter(characters: attacker.characters, asTarget: false)
            checkChest(selectedCharacter: attackCharacter)
            
            let victimCharacter =  attacker.selectCharacter(characters: target.characters, asTarget: true)
            attackCharacter.attack(target: victimCharacter)
            
            target.checkTeamLife()
            if checkWinner() == true {
                break
            }
            turn += 1
            
            let tempTarget = attacker
            attacker = target
            target = tempTarget
        }
        
        print("Le jeu est terminé")
        print("Bravo !")
        print("Vous avez gagné en \(turn/2) tours et voici les survivants:")
        playerOne.teamView()
        playerTwo.teamView()
    }
    
   // Know if one of the two players has no more characters
    private func checkWinner() -> Bool {
        if playerTwo.characters.isEmpty {
            print("\(playerTwo.name) n'a plus de personnages dans son équipe")
            print("\(playerOne.name) a gagné")
            
            return true
        }
        
        if playerOne.characters.isEmpty {
            print("\(playerOne.name) n'a plus de personnages dans son équipe")
            print("\(playerTwo.name) a gagné")
            
            return true
        }
        
        return false
    }
    
   // Know if a chest is found
    private func checkChest(selectedCharacter: Character) {
        let randomNumber = Int(arc4random_uniform(3))
        
        if randomNumber == 0 {
            print("Vous trouvez un coffre!")
            let newChest = Chest()
            selectedCharacter.openChest(chest: newChest)
        }
    }
}
