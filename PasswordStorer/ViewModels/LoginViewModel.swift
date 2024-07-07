//
//  LoginViewModel.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import Foundation
import LocalAuthentication

class LoginViewModel: ObservableObject {
    @Published var isAuthenticated = false
    
    func authenticateUsingBiometrics(type: LABiometryType) {
        let context = LAContext()
        var error: NSError?
        
        // Check if biometric authentication is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = type == .faceID ? "FaceID ile kimliğinizi doğrulayın" : "Parmak izi ile kimliğinizi doğrulayın"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // Authentication was successful
                        self.isAuthenticated = true
                    } else {
                        // There was a problem with authentication
                        print("Authentication failed")
                        self.isAuthenticated = false
                    }
                }
            }
        } else {
            // No biometry available
            print("Biometric authentication not available")
            //TODO: value will change 
            self.isAuthenticated = true
        }
    }
}
