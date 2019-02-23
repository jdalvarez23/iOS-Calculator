//
//  ViewController.swift
//  Auto layout caluclator
//
//  Created by student9 on 2/9/19.
//  Copyright © 2019 Erica Bermudez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calculationArray: [String] = []
    
    var executeCalculation: [String] = [""]
    
    var functionsPressedTwice = false
    
    // initialize storyboard components
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var functionButtons: [UIButton]!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // method that executes when a number button is pressed
    @IBAction func numberButtonsPressed(_ sender: UIButton) {
        
        let number = sender.title(for: .normal)!
        
        print("Number pressed:", number)
        
        // insert call to update user interface here
        
        
        if (calculationArray.count > 0) {
            
            let arrayIndex = checkArray(numberArray: calculationArray)
            
            // retrieve the number
            var arrayNumber = calculationArray[arrayIndex] // retrieve the value from the array at index 0
            
            print("Number from array:", arrayNumber)
            
            // insert number pressed into number from array
            arrayNumber.append(number)
            
            print("New number:", arrayNumber)
            
            calculationArray[arrayIndex] = arrayNumber // push modified arrayNumber to the array
            
            
        } else {
            calculationArray.append(number)
        }
        
 
        print(calculationArray)
        
        
        
    }
    
    // method that executes when a function button is pressed
    @IBAction func functionButtonsPressed(_ sender: UIButton) {
        
        /* Create new value in calculationsArray */
        
        calculationArray.append("")
        
        /* Retrieve proper math function */
        
        let calculation = sender.title(for: .normal)!
        
        print("What calculation should happen?:", calculation)
        
        if calculation == "=" {
            //print(executeCalculation)
            // call the method that totals
            total(firstNumber: calculationArray[0], secondNumber: calculationArray[1], calculation: executeCalculation[0])
            executeCalculation.removeAll() // remove all calculations inserted into executeCalculation array
        } else {
            // insert calculations to executeCalculation array at index 0
            executeCalculation.insert(calculation, at: 0)
        }
        
        
        /* Implement functionality where it calculates total on second button press */
        
        if (calculation != "=") {
            if (!functionsPressedTwice) {
                functionsPressedTwice = true // set value to true
            } else {
                print("Second time clicking the functions")
                
                // call method to calculate total and push total value to index 0
                total(firstNumber: calculationArray[0], secondNumber: calculationArray[1], calculation: executeCalculation[0])
            }
        }
        
        
        
        
    }
    
    // method that executes when the decimal button is pressed
    @IBAction func decimalButtonPressed(_ sender: UIButton) {
        
        
    }
    
    // method that executes when the clear button is pressed
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
    }
    
    // method that checks array and returns index to append number
    func checkArray(numberArray: [String]) -> Int {
        
        if (numberArray.count > 0) {
            return numberArray.count - 1
        } else {
            return 0
        }
        
    }
    
    // method that calculates total
    func total(firstNumber: String, secondNumber: String, calculation: String) {
        
        let formattedFirstNum = Double(firstNumber) ?? 0
        let formattedSecondNum = Double(secondNumber) ?? 0
        
        var total: Double = 0
        
        // conditional statement to execute a specific function based on calculation passed
        switch calculation {
        case "÷":
            // Divide
            total = formattedFirstNum / formattedSecondNum
        case "x":
            // Multiply
            total = formattedFirstNum * formattedSecondNum
        case "-":
            // Subtract
            total = formattedFirstNum - formattedSecondNum
        case "+":
            // Add
            total = formattedFirstNum + formattedSecondNum
        default:
            print("Error")
        }
        
        print("The total is:", total)
        
        // insert call to update user interface here
        
        /* [NOTE] We can actually remove the following two lines and simply display the number in the label and if the user justs presses a function button then we can add the number in the label back to the calculations array */
        
        calculationArray[0] = String(total)
        
        calculationArray.remove(at: 1)
        
    }
    

}

