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
    
    var inputString: String = ""
    
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
        
        guard currentText != "0", operandLabel.text?.isEmpty == false else { return }
        operatorLabel.text = operatorSign
    }
    
    @IBAction func clearButton(_ sender: Any) {
        operandLabel.text = "0"
    }
    
    @IBAction func resetButton(_ sender: Any) {
        initialView()
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    @IBAction func minusPlusButton(_ sender: UIButton) {
        guard let currentInput = operandLabel.text else { return }
        
        if currentInput.contains("-") {
            operandLabel.text = currentInput.replacingOccurrences(of: "-", with: "")
        } else {
            operandLabel.text = "-" + currentInput
        }
    }
    
    @IBAction func dotButton(_ sender: UIButton) {
        guard let input = sender.titleLabel?.text else { return }
        guard let currentOperands = operandLabel.text else { return }
        
        operandLabel.text = currentOperands + input
    }
    
    
    
    func initialView() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
}

