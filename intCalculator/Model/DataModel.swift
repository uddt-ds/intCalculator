//
//  DataModel.swift
//  intCalculator
//
//  Created by Lee on 4/1/25.
//

import Foundation

class DataModel {
    func calculate(expression: String) -> Int? {
            let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}
