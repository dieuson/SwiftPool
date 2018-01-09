//: Playground - noun: a place where people can play


import UIKit

enum Value :Int {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten,  Jack, Queen, King, As
    static let allValues :[Value] = [Value.Two, Value.Three, Value.Four, Value.Five,
                                     Value.Six, Value.Seven, Value.Eight, Value.Nine,
                                     Value.Ten, Value.Jack, Value.Queen, Value.King, Value.As]
}

enum Color :String {
    case Clovers = "Clovers"
    case Tiles = "Tiles"
    case Hearts = "Hearts"
    case Pikes = "Pikes"
    static let allColors :[Color] = [Color.Clovers, Color.Tiles, Color.Hearts, Color.Pikes]
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

var card1 = Card(color: Color.Pikes, value: Value.Eight);
var card2 = Card(color: Color.Pikes, value: Value.Nine);
print(card1 == card2)

