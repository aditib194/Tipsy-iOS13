//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var splitNumber = 2
    var tip = 0.1
    var result: String?

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        tip = Double(sender.currentTitle!.dropLast())!/100
        
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        var oldValue = Double(splitNumberLabel.text!)!
        if sender.value > oldValue {
            oldValue += 1
        } else {
            oldValue -= 1
        }
        
        splitNumber = Int(oldValue)
        splitNumberLabel.text = "\(splitNumber)"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
//        let bill = billTextField.text!
//        if bill != "" {
//            billTotal = Double(bill)!
//            let result = billTotal * (1 + tip) / Double(numberOfPeople)
//            finalResult = String(format: "%.2f", result)
//        }
        if billTextField.text! != "" {
            result = String(format: "%.2f", (Double(billTextField.text!)! * (1 + tip)) / Double(splitNumber))
            print(result)
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.calculatedResult = result
            destinationVC.split = splitNumber
            destinationVC.tipValue = Int(tip * 100)
        }
    }
    
}

