//
//  Password+Extension.swift
//  PasswordStorer
//
//  Created by mert alp on 30.06.2024.
//

import Foundation
import CoreData

extension Password {
    @objc var isEditing: Bool {
        get { return false }
        set { willChangeValue(forKey: "isEditing"); setPrimitiveValue(newValue, forKey: "isEditing"); didChangeValue(forKey: "isEditing") }
    }
}
