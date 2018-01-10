//: Playground - noun: a place where people can play


import UIKit

public enum Value :Int {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten,  Jack, Queen, King
    static let allValues :[Value] = [Value.Ace, Value.Two, Value.Three, Value.Four, Value.Five,
                                     Value.Six, Value.Seven, Value.Eight, Value.Nine,
                                     Value.Ten, Value.Jack, Value.Queen, Value.King]
}

enum Color :String {
    case Spade = "Spade"
    case Diamond = "Diamond"
    case Heart = "Heart"
    case Club = "Club"
    static let allColors :[Color] = [Color.Spade, Color.Diamond, Color.Heart, Color.Club]
}

class Card: NSObject {
    var color: Color;
    var value: Value;
    
    init(color: Color, value: Value) {
        self.color = color;
        self.value = value;
    }
    
    override var description: String {
        return "\(value.rawValue) of \(color.rawValue)";
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if (object is Card){
            let card2 = (object as! Card);
            if (card2.value == self.value && card2.color == self.color){
                return true;
            }
        }
        return false;
    }
}

class Deck: NSObject {
    
    static let allSpades: [Card] = Value.allValues.map{Card(color: Color.Spade, value: $0)};
    static let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.Diamond, value: $0)};
    static let allHearts: [Card] = Value.allValues.map{Card(color: Color.Heart, value: $0)};
    static let allClubs: [Card] = Value.allValues.map{Card(color: Color.Club, value: $0)};
    static let allCards = Deck.allSpades + Deck.allDiamonds + Deck.allHearts + Deck.allClubs;
    
    var cards :[Card] = Deck.allCards;
    var discards :[Card] = [];
    var outs :[Card] = [];
    
    init(mix: Bool) {
        if (mix) {
            cards.mix();
        }
    }
    
    override var description: String {
        return "\(cards)";
    }
    
    func draw() -> Card? {
        let card = cards.first;
        if (card != nil) {
            outs.append(card!);
            cards.removeFirst();
        } else {
            print("no more cards");
        }
        return card;
    }
    
    func fold(c: Card) {
        for card in outs {
            if (card.isEqual(c)){
                discards.append(c);
                outs.removeFirst();
            }
        }
    }
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


var deck = Deck(mix: true);
print("shuffle Deck")
print(deck.description);

print("\n\n");
var deck2 = Deck(mix: false);
print("sort cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

print("\n\n");
deck2.draw();
print("Draw card \(deck2.outs)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

var card = Card(color: Color.Spade, value: Value.Ace);
print("\n\n");
print("Fold \(card.description)");
deck2.fold(c: card);
//print("deck cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

deck2.draw();
card = Card(color: Color.Heart, value: Value.Ace);
print("\n\n");
print("Fold \(card.description)");
deck2.fold(c: card);
//print("deck cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

card = Card(color: Color.Spade, value: Value.Two);
print("\n\n");
print("Fold \(card.description)");
deck2.fold(c: card);
//print("deck cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

print("\n\n");
print("try to draw 55 cards");
for i in 0..<55 {
    deck2.draw();
}
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

print("\n\n");
print("fold all cards");
for card in deck2.outs {
    deck2.fold(c: card);
}
deck2.fold(c: card);
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");
