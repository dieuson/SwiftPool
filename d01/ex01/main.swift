//
//  main.swift
//  
//
//  Created by Dieuson VIRGILE on 1/9/18.
//

import Foundation

var card1 = Card(color: Color.Diamond, value: Value.Eight);
var card2 = Card(color: Color.Diamond, value: Value.Nine);
var card3 = Card(color: Color.Spade, value: Value.Nine);
var card4 = card2;

print("Compare: (\(card1.description)) - (\(card2.description))|");
print("resut: \(card1.isEqual(card2))\n\n");

print("Compare: (\(card2.description)) - (\(card3.description))");
print("resut: \(card2.isEqual(card3))\n\n");

print("Compare: (\(card3.description)) - (\(card4.description))");
print("resut: \(card3.isEqual(card4))\n\n");

print("Compare: (\(card2.description)) - (\(card4.description))");
print("resut: \(card2.isEqual(card4))\n\n");

print("Compare: (\(card1.description)) - (\(card4.description))");
print("resut: \(card1.isEqual(card4))\n\n");

print("Compare: (\(card2.description)) - (\(card2.description))");
print("resut: \(card2.isEqual(card2))\n\n");
