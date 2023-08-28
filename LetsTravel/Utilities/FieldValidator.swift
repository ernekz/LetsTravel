//
//  FieldValidator.swift
//  LetsTravel
//
//  Created by Ernestas Kazinevicius on 2023-08-28.
//

import Foundation

struct FieldValidator {
    var errorMessage: String?
    var isEmpty: Bool {
        return errorMessage != nil
    }
}
