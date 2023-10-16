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
        initialView()
    }

    @IBAction func operandsButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text  else { return }
        guard let currentOperands = operandLabel.text else { return }
        
        guard inputNumber == "0" else { return operandLabel.text = currentOperands + inputNumber } 
        operandLabel.text = currentOperands
    }
    
    @IBAction func operatorsButton(_ sender: UIButton) {
        guard let operatorSign = sender.titleLabel?.text else { return }
        guard let currentText = operandLabel.text else { return }
        
        guard currentText != "0" else { return }
        guard operandLabel.text?.isEmpty == false else { return }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        operandLabel.text = "0"
    }
    
    @IBAction func resetButton(_ sender: Any) {
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    func initialView() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
}

