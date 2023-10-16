//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operandLabel.text = "0"
        operatorLabel.text = ""
    }

    
    @IBAction func clearButton(_ sender: Any) {
        operandLabel.text = "0"
    }
    
    @IBAction func resetButton(_ sender: Any) {
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
}

