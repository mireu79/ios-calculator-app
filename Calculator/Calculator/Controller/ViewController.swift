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
    
    var input: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialView()
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }

    @IBAction func operandsButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text  else { return }
        guard let currentOperands = operandLabel.text else { return }
        input.append(inputNumber)
        
        if currentOperands == "0" {
            operandLabel.text = inputNumber
        } else {
            operandLabel.text = currentOperands + inputNumber
        }
        
        if inputNumber == "00" {
            if currentOperands == "0" {
                operandLabel.text = "0"
            }
        }
    }
    
    @IBAction func operatorsButton(_ sender: UIButton) {
        guard let operatorSign = sender.titleLabel?.text else { return }
        guard let currentText = operandLabel.text else { return }
        input.append(operatorSign)
        
        guard currentText != "0", operandLabel.text?.isEmpty == false else { return }
        expressionStackView()
        operatorLabel.text = operatorSign
        operandLabel.text = "0"
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        if operandLabel.text?.isEmpty == false {
            operandLabel.text?.removeLast()
        }
        
        if input.isEmpty == false {
            input.removeLast()
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        initialView()
        input.removeAll()
        stackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    @IBAction func minusPlusButton(_ sender: UIButton) {
        guard let currentInput = operandLabel.text, operandLabel.text != "0" else { return }
        
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
        self.input.append(input)
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
        guard operandLabel.text != "0" else { return }
        guard operandLabel.text?.isEmpty == false else { return }
        
        var formula = ExpressionParser.parse(from: input)
        let result = formula.result()
        
        expressionStackView()
        operandLabel.text = String(result)
        operatorLabel.text = ""
    }
    
    func initialView() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    func formatter(_ number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        return numberFormatter.string(from: NSNumber(value: Double(number) ?? 0)) ?? ""
    }
    
    func makeStackView(sub: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .fill
        
        for view in sub {
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }
    
    func makeLabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        return label
    }
    
    func expressionStackView() {
        let oprendLabel = makeLabel(text: operandLabel.text)
        let operatorLabel = makeLabel(text: operatorLabel.text)
        let appearStackView = makeStackView(sub: [operatorLabel, oprendLabel])
        
        stackView.addArrangedSubview(appearStackView)
    }
}

