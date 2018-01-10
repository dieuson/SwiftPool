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

extension Array {
    mutating func mix() {
        var tmp :Element;
        var randomIndex = 0;
        let arraySize = self.count;
        for i in 0..<arraySize {
            randomIndex = Int(arc4random_uniform(UInt32(arraySize)));
            tmp = self[i];
            self[i] = self[randomIndex];
            self[randomIndex] = tmp;
        }
        return
    }
}
