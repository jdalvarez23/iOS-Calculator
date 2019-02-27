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
    
    var finalTotalValue: Double?
    
    // initialize storyboard components
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var functionButtons: [UIButton]!
    @IBOutlet weak var decimalButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var numberDisplay: UILabel!
    
    
    

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
        
        let mathExpression = sender.title(for: .normal)! // set value to button title
        
        print("Math expression called:", mathExpression)
        
        // check if there is a value in finalTotalValue variable and if calculationArray is empty
        if (finalTotalValue != nil && (calculationArray.count == 0)) {
            
            // there is a value in the finalTotalValue variable AND the calculation array IS empty so the user wants to add on a calculation to the total value
            print("User wants to ADD on to the total value")
            
            let totalValue = finalTotalValue!
            
            let formattedValue = String(totalValue)
            
            print("MATH EXPRESSIONS:", executeCalculation)
            
            calculationArray.append("")
            calculationArray.insert(formattedValue, at: 0)
            
            // insert calculations to executeCalculation array at index 0
            executeCalculation.insert(mathExpression, at: 0)
            
            
        } else {
            
            // there is no value in the finalTotalValue variable OR the calculationArray IS NOT empty so the user wants to calculate a new expression
            print("User wants NEW expression")
            
            calculationArray.append("") // create empty value in calculation array
        
            // execute the total expression
            if (mathExpression == "=") {
                print("Executing TOTAL math expression")
                
                // call method that calculates the total
                total(firstNumber: calculationArray[0], secondNumber: calculationArray[1], expression: executeCalculation[0])
                
                executeCalculation.removeAll() // remove all calculations inserted into executeCalculation array
                
                functionsPressedTwice = false // default back to false
                
                
                
            } else {
                
                // insert calculations to executeCalculation array at index 0
                executeCalculation.insert(mathExpression, at: 0)
                
                // check for second time function pressing
                
                // execute if function is pressed for the first time
                if (!functionsPressedTwice) {
                    functionsPressedTwice = true // set value to true
                    
                // execute if function has been pressed and user pressed again
                } else {
                    print("Second time executing functions!")
                    
                    // call method to calculate total and push total value to index 0
                    total(firstNumber: calculationArray[0], secondNumber: calculationArray[1], expression: executeCalculation[0])
            
                    if finalTotalValue != nil {
                        calculationArray.append("")
                        calculationArray.insert(String(finalTotalValue!), at: 0)
                        
                    }
                    
                    
                }
                
 
            }
        
        
        }
        
        /*
        
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
        } */
        
        
        
        
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
    func total(firstNumber: String, secondNumber: String, expression: String) {
        
        print("Numbers passed into function:", firstNumber, secondNumber)
        
        let formattedFirstNum = Double(firstNumber) ?? 0
        let formattedSecondNum = Double(secondNumber) ?? 0
        
        var total: Double = 0
        
        // conditional statement to execute a specific function based on calculation passed
        switch expression {
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
        
       // calculationArray[0] = String(total)
        
        // calculationArray.remove(at: 1)
        
        finalTotalValue = total // set value to calculated total
        
        calculationArray.removeAll() // remove all values in array
        
    }
    
    func updateUserInterface(value: Double) {
        
        // check to see if value (as a Double) is a whole number or a decimal number
        
        
    }
    

}

