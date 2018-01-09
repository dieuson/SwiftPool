//: Playground - noun: a place where people can play


import UIKit

enum Value :Int {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten,  Jack, Queen, King, As
    static let allValues :[Value] = [Value.Two, Value.Three, Value.Four, Value.Five,
                                     Value.Six, Value.Seven, Value.Eight, Value.Nine,
                                     Value.Ten, Value.Jack, Value.Queen, Value.King, Value.As]
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
    
    override init() {
    }

    static let allSpades: [Card] = Value.allValues.map{Card(color: Color.Spade, value: $0)};
    
    static let allDiamonds: [Card] = Value.allValues.map{Card(color: Color.Diamond, value: $0)};

    static let allHearts: [Card] = Value.allValues.map{Card(color: Color.Heart, value: $0)};

    static let allClubs: [Card] = Value.allValues.map{Card(color: Color.Club, value: $0)};

    static let allCards = Deck.allSpades + Deck.allDiamonds + Deck.allHearts + Deck.allClubs;
    
}

var card1 = Card(color: Color.Spade, value: Value.Eight);
var card2 = Card(color: Color.Spade, value: Value.Nine);
var deck = Deck();
print(card1 == card2)
print(Deck.allCards);


