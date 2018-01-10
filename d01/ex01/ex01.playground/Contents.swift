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

var card1 = Card(color: Color.Pikes, value: Value.Eight);
var card2 = Card(color: Color.Pikes, value: Value.Nine);
var card3 = Card(color: Color.Pikes, value: Value.Eight);
var card4 = card2;


card1.isEqual(card2);
card2.isEqual(card3);
card3.isEqual(card4);
card2.isEqual(card4);
card1.isEqual(card4);
card2.isEqual(card2);

//print(card3 == card2);


