//
//  Card.swift
//  
//
//  Created by Dieuson VIRGILE on 1/9/18.
//

import Foundation

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
