//
//  Deck.swift
//  
//
//  Created by Dieuson VIRGILE on 1/9/18.
//

import Foundation

class Deck: NSObject {
    
    override init() {
    }
    
    static let allSpades: [Card] = Value.allValues.map{Card(color: Color.Spade, value: $0)};
    static let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.Diamond, value: $0)};
    static let allHearts: [Card] = Value.allValues.map{Card(color: Color.Heart, value: $0)};
    static let allClubs: [Card] = Value.allValues.map{Card(color: Color.Club, value: $0)};
    static let allCards = Deck.allSpades + Deck.allDiamonds + Deck.allHearts + Deck.allClubs;
    
}
