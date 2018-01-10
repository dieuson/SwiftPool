//
//  main.swift
//  
//
//  Created by Dieuson VIRGILE on 1/10/18.
//

import Foundation

var test0 = [0,1,2,3,4,5,6,7,8,9];
print("Initial array: \(test0)");
test0.mix();
print("First mix: \(test0)");
test0.mix();
print("Second mix: \(test0)");
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
