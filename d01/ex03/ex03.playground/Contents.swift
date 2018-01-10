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

//print(card1 == card2)

var test0 = [0,1,2,3,4,5,6,7,8,9];
print(test0);
test0.mix();
print(test0);
test0.mix();
print(test0);
print("\n");

var testWithNil = [0,1,2,nil,4,5,6,7,nil,9];
print(testWithNil);
testWithNil.mix();
print(testWithNil);
testWithNil.mix();
print(testWithNil);
print("\n");

var test: [Int] = [];
print(test);
test.mix();
print(test);
test.mix();
print(test);
print("\n");

var test1 = [nil] as [Any?];
print(test1);
test1.mix();
print(test1);
test1.mix();
print(test1);
print("\n");

print()
