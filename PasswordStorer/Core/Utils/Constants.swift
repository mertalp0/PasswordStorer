//
//  Constants.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import Foundation
import UIKit

struct Constants {
    
    private static var safeAreaSize: CGSize {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            return window.safeAreaLayoutGuide.layoutFrame.size
        }
        return CGSize(width: 0, height: 0)
    }
    
    static var safeAreaWidth: CGFloat {
        return safeAreaSize.width
    }
    
    static var safeAreaHeight: CGFloat {
        return safeAreaSize.height
    }
}
