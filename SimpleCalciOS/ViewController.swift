//
//  ViewController.swift
//  SimpleCalciOS
//
//  Created by Smyth on 10/21/15.
//  Copyright © 2015 Smyth May. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var calcText: UILabel!
    @IBOutlet weak var One: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var count: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var factorial: UIButton!
    @IBOutlet weak var multiply: UIButton!
    @IBOutlet weak var rpn: UIButton!
    @IBOutlet weak var average: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    var isRpn : Bool?;
    var numbers : [Int]?;
    var operations : [String]?;
    var currentInput : String?;
    var wasAnswer : Bool?;

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentInput = "";
        numbers = [];
        isRpn = false;
        wasAnswer = false;
        operations = [];
        One.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        two.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        three.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        four.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        five.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        six.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        seven.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        eight.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        nine.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        zero.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        plus.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        minus.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        multiply.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        divide.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        rpn.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        count.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        average.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        factorial.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        clear.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        submit.addTarget(self, action:"collectUserInput:", forControlEvents: .TouchUpInside);
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func collectUserInput(sender : UIButton) {
        if (wasAnswer!) {
            if (sender == One || sender == two || sender == three || sender == four || sender == five || sender == six || sender == seven || sender == eight || sender == nine || sender == zero) {
                calcText.text == "";
                numbers = [];
                operations = [];
                currentInput = "";
            } else if (sender != clear || sender != submit || sender != rpn) {
                currentInput = calcText.text;
            }
            wasAnswer = false;
        }
        switch(sender) {
        case One:
            currentInput! += "1";
            calcText.text = currentInput;
        case two:
            currentInput! += "2";
            calcText.text = currentInput;
        case three:
            currentInput! += "3";
            calcText.text = currentInput;
        case four:
            currentInput! += "4";
            calcText.text = currentInput;
        case five:
            currentInput! += "5";
            calcText.text = currentInput;
        case six:
            currentInput! += "6";
            calcText.text = currentInput;
        case seven:
            currentInput! += "7";
            calcText.text = currentInput;
        case eight:
            currentInput! += "8";
            calcText.text = currentInput;
        case nine:
            currentInput! += "9";
            calcText.text = currentInput;
        case zero:
            currentInput! += "0";
            calcText.text = currentInput;
        case count:
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            }
            currentInput = "";
            operations!.append("count");
            calcText.text = String(numbers!.count);
        case plus:
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            } else {
                numbers!.append(0);
            }
            operations!.append("+");
            calcText.text = "";
            currentInput = "";
        case minus:
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            } else {
                numbers!.append(0);
            }
            operations!.append("-");
            calcText.text = "";
            currentInput = "";
        case divide:
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            } else {
                numbers!.append(0);
            }
            operations!.append("/");
            calcText.text = "";
            currentInput = "";
        case factorial:
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            }
            operations!.append("fact");
            calcText.text = "";
            currentInput = "";
            doMath();
        case multiply:
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            } else {
                numbers!.append(0);
            }
            operations!.append("*");
            calcText.text = "";
            currentInput = "";
        case rpn:
            isRpn! = true;
        case average:
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            } else {
                numbers!.append(0);
            }
            operations!.append("avg");
            calcText.text = "";
            currentInput = "";
        case clear:
            operations = [];
            currentInput = "";
            numbers = [];
            calcText.text = "";
        case submit:
            print(operations);
            print(numbers);
            if (currentInput!.characters.count > 0) {
                let currentNumber : Int? = Int(currentInput!);
                numbers!.append(currentNumber!);
            }
            if (numbers!.count > 0 && operations!.count > 0) {
                doMath();
            }
            NSLog("\(currentInput)");
        default:
            currentInput! += "";
            NSLog("Default case");
        }
    }
    
    func doMath() {
        var currentResult = 0;
        var opNum = 0;
        for (var i = 0; i < numbers!.count; i++) {
            if (i == 0) {
                currentResult = numbers![i];
            }
            if (numbers!.count == 1) {
                if (operations![i] == "fact") {
                    currentResult = factorialOp(currentResult);
                }
            } else {
                if (i > 0) {
                    switch operations![opNum] {
                    case "+":
                        currentResult += numbers![i];
                    case "-":
                        currentResult -= numbers![i];
                    case "*":
                        currentResult *= numbers![i];
                    case "/":
                        currentResult /= numbers![i];
                    case "avg":
                        var sum = 0;
                        for (var k = 0; k < numbers!.count; k++) {
                            sum += numbers![k];
                        }
                        currentResult = sum / numbers!.count;
                    default:
                        currentResult += 0;
                    }
                    opNum++;
                }
            }
        }
        numbers = [];
        operations = [];
        calcText.text = String(currentResult);
        wasAnswer = true;
        
    }
    
    func factorialOp(num : Int) -> Int {
        var result = 1;
        for (var i = numbers![0]; i > 0; i--) {
            result *= i;
        }
        return result;
    }
    
    
    


}

