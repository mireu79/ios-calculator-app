//
//  ExpressionParser.swift
//  Calculator
//
//  Created by mireu on 2023/10/06.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        print(input)
        let components = componentsByOperators(from: input)
        
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        components.forEach { component in
            if let oprand = Double(component) {
                operands.enqueue(oprand)
            } else if let `oprator` = Operator(rawValue: Character(component)) {
                operators.enqueue(`oprator`)
            }
        }
        
        return Formula(operands: operands, operators: operators)
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var components = [input]
                
                Operator.allCases.forEach { operatorSymbol in
                    components = components.flatMap { str in
                        str.split(with: operatorSymbol.rawValue)
                    }
                }
                
                return components.filter { $0 != "" }
    }
}
