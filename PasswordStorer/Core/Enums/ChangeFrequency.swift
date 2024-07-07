//
//  ChangeFrequency.swift
//  PasswordStorer
//
//  Created by mert alp on 25.06.2024.
//

import SwiftUI

enum ChangeFrequency: Int, CaseIterable {
    case never = 0
    case oneMonth = 1
    case threeMonths = 2
    case sixMonths = 3 

    var title: String {
        switch self {
        case .never: return "Asla"
        case .oneMonth: return "1 Ay"
        case .threeMonths: return "3 Ay"
        case .sixMonths: return "6 Ay"
            
        }
    }
}
