//
//  ViewController.swift
//  ex02
//
//  Created by Dieuson VIRGILE on 1/8/18.
//  Copyright © 2018 Dieuson VIRGILE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Operation {
        case add
        case sub
        case mult
        case div
        case none
    }
    
    @IBOutlet weak var textLabel: UILabel!
    var result: Double = 0.0;
    var buffer = "";
    var totalBuffer = "";
    var operation :Operation = Operation.none;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "";
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnClick(_ sender: UIButton) {
        let labelText = (sender.titleLabel?.text!)!;
        
        buffer = buffer + labelText;
        textLabel.text = buffer;
        print("click on \(labelText) concat prev number")
    }
    
    func resetVars(){
        textLabel.text = "";
        totalBuffer = "";
        buffer = "";
    }
    
    func detectOverFlow(str: String) -> Bool {
        let intval = Float(str);
        if (intval == nil){
            resetVars();
            textLabel.text = "nan";
            print("nan");
            return (false);
        }
        return (true);
    }
    
    @IBAction func applyOperator(_ sender: UIButton) {
        let labelText = (sender.titleLabel?.text!)!;
        var leftValue = 0.0;
        var rightValue = 0.0;
        
        if (!totalBuffer.isEmpty){
            if (!detectOverFlow(str: totalBuffer)){
                return;
            }
            leftValue = Double(totalBuffer)!;
        }
        if (!buffer.isEmpty){
            if (!detectOverFlow(str: buffer)){
                return;
            }
            rightValue = Double(buffer)!;
        }

        if (!totalBuffer.isEmpty && !buffer.isEmpty){
            switch operation {
            case .sub:
                result = leftValue - rightValue;
            case .add:
                if (!detectOverFlow(str: String(leftValue + rightValue))){
                    return;
                }
                result = leftValue + rightValue;
            case .mult:
                if (totalBuffer.isEmpty && !buffer.isEmpty){
                    result = rightValue;
                } else if (!totalBuffer.isEmpty && buffer.isEmpty){
                    result = leftValue;
                } else {
                    if (!detectOverFlow(str: String(leftValue * rightValue))){
                        return;
                    }
                    result = leftValue * rightValue;
                }
            case .div:
                if (rightValue == 0){
                    print("nan");
                    textLabel.text = "nan";
                    buffer = "";
                    totalBuffer = "";
                    return;
                } else {
                    result = leftValue / rightValue;
                }
            case .none:
                print("none case");
            }
            totalBuffer = String(result);
            textLabel.text = totalBuffer;
        } else {
            if (!buffer.isEmpty){
                totalBuffer = String(rightValue);
            }
        }
        
        switch labelText {
        case "-":
            operation = Operation.sub;
            print("click on sub");
        case "+":
            operation = Operation.add;
            print("click on add");
        case "*":
            operation = Operation.mult;
            print("click on mult");
        case "/":
            operation = Operation.div;
            print("click on divide");
        default:
            print("none");
        }
        buffer = "";
        textLabel.text = totalBuffer;
    }

    @IBAction func negBtnClick(_ sender: UIButton) {
        print("click on neg, try to reverse number...");
        if (buffer.isEmpty && totalBuffer.isEmpty){
            buffer = "-";
            textLabel.text = buffer;
        } else {
            if (!totalBuffer.isEmpty && buffer.isEmpty){
                totalBuffer = String(-1 * Double(totalBuffer)!)
                textLabel.text = totalBuffer;
            } else if (!buffer.isEmpty && buffer != "-"){
                    buffer = String(-1 * Double(buffer)!)
                    textLabel.text = buffer;
            } else {
                print("nan");
            }
        }
    }
    
    @IBAction func resetClick(_ sender: UIButton) {
        buffer = "";
        operation = Operation.none;
        totalBuffer = "";
        textLabel.text = "";
        print("click on reset, reset values");
    }
    
    
    @IBAction func solveBtnClick(_ sender: UIButton) {
        print("click on solve, try to solve...");
        var hasError = false;
        if (buffer == "-"){
            print("incorrect value");
            return
        } else if (totalBuffer.isEmpty){
            print("No inputs");
            return
        }
        
        let leftValue = Double(totalBuffer)!;
        if (!totalBuffer.isEmpty && !buffer.isEmpty){
            let rightValue = Double(buffer)!
            if (operation == Operation.add && !buffer.isEmpty){
                if (!detectOverFlow(str: String(leftValue + rightValue))){
                    return;
                }
                result = leftValue + rightValue;
            } else if (operation == Operation.sub && !buffer.isEmpty) {
                result = leftValue - rightValue;
            } else if (operation == Operation.mult && !buffer.isEmpty) {
                if (!detectOverFlow(str: String(leftValue * rightValue))){
                    return;
                }
                result = leftValue * rightValue;
            } else if (operation == Operation.div && !buffer.isEmpty) {
                if (rightValue == 0){
                    print("nan");
                    hasError = true;
                }
                 else {
                    result = Double(totalBuffer)! / Double(buffer)!;
                }
            }
        } else {
            result = leftValue;
        }

                    
        if (!hasError){
            totalBuffer = String(result);
            textLabel.text = totalBuffer;
        } else {
            textLabel.text = "nan";
            totalBuffer = "";
        }
        operation = Operation.none;
        buffer = "";
    }
    
}

