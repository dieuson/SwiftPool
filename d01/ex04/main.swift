//
//  main.swift
//  
//
//  Created by Dieuson VIRGILE on 1/10/18.
//

import Foundation

var deck = Deck(mix: true);
print("shuffle Deck")
print(deck.description);

print("\n\n");
var deck2 = Deck(mix: false);
print("sort cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

print("\n\n");
var card: Card? = deck2.draw();
print("Draw card \(deck2.outs)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

card = Card(color: Color.Spade, value: Value.Ace);
print("\n\n");
print("Fold \(card!.description)");
deck2.fold(c: card!);
//print("deck cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

card = deck2.draw();
card = Card(color: Color.Heart, value: Value.Ace);
print("\n\n");
print("Fold \(card!.description)");
deck2.fold(c: card!);
//print("deck cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

card = Card(color: Color.Spade, value: Value.Two);
print("\n\n");
print("Fold \(card!.description)");
deck2.fold(c: card!);
//print("deck cards:\n\(deck2.description)");
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

print("\n\n");
print("try to draw 55 cards");
for i in 0..<55 {
    card = deck2.draw();
    i += 1;
}
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

print("\n\n");
print("fold all cards");
for card in deck2.outs {
    deck2.fold(c: card);
}
deck2.fold(c: card!);
print("discard cards:\n\(deck2.discards)");
print("outs cards:\n\(deck2.outs)");

