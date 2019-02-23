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
        
        
        
        
        /*
        let arrayIndex = checkArray(numberArray: calculationArray) */
        
        // print("Index:", arrayIndex)
        
        
        
        
        
        
        
        /*
        if (arrayIndex == 0) {
            calculationArray.append(formattedNumber)
        } else {
            calculationArray[arrayIndex] = formattedNumber
        }
        */
 
        print(calculationArray)
        
        
        
    }
    
    // method that executes when a function button is pressed
    @IBAction func functionButtonsPressed(_ sender: UIButton) {
        
        /* Create new value in calculationsArray */
        
        calculationArray.append("")
        
        /* Retrieve proper math function */
        
        var calculation: String = ""
        
        let functionName = sender.title(for: .normal)!
        
        // conditional statement to execute a specific function based on the button title
        switch functionName {
        case "÷":
            // code goes here
            // print("Divide")
            calculation = "Divide"
        case "x":
            // print("Multiply")
            calculation = "Multiply"
        case "-":
            // print("Subtract")
            calculation = "Subtract"
        case "+":
            // print("Add")
            calculation = "Add"
        case "=":
            // print("Equals")
            calculation = "Equals"
        default:
            print("Error")
        }
        
        print("What calculation should happen?:", calculation)
        
        
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
    

}

