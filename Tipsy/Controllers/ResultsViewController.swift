//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Aditi Bansal on 1/3/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculatedResult: String?
    var split: Int?
    var tipValue: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        totalLabel.text = calculatedResult
        settingsLabel.text = "Split between \(split!) people, with \(tipValue!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
