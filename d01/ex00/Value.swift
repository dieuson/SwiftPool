//
//  Value.swift
//  
//
//  Created by Dieuson VIRGILE on 1/9/18.
//

import Foundation

enum Value :Int {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten,  Jack, Queen, King, Ace
    static let allValues :[Value] = [Value.Two, Value.Three, Value.Four, Value.Five,
                                     Value.Six, Value.Seven, Value.Eight, Value.Nine,
                                     Value.Ten, Value.Jack, Value.Queen, Value.King, Value.Ace]
}
