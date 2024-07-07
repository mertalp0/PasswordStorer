//
//  CoreUtils.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import Foundation

class CoreUtils {
    static let shared = CoreUtils()

    private init() {}

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    
    static func calculateStrength(password: String) -> Int {
           var score = 0
           
           // Uzunluk puanı (Minimum 8 karakter)
           if password.count >= 8 {
               score += 1
           }
           
           // Büyük harf varlığı
           if password.rangeOfCharacter(from: .uppercaseLetters) != nil {
               score += 1
           }
           
           // Küçük harf varlığı
           if password.rangeOfCharacter(from: .lowercaseLetters) != nil {
               score += 1
           }
           
           // Rakam varlığı
           if password.rangeOfCharacter(from: .decimalDigits) != nil {
               score += 1
           }
           
           // Özel karakter varlığı
           if password.rangeOfCharacter(from: .symbols) != nil {
               score += 1
           }
           
           return score
       }
}
