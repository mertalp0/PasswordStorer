//
//  AddPasswordViewModel.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import Foundation

class AddPasswordViewModel : ObservableObject {
    
    static let shared  = AddPasswordViewModel()
    private var homeViewModel  :HomeViewModel
    private let dataService: DataService
    
    @Published var textPlatform : String = ""
    @Published var textPassword : String = ""
    @Published var selectedChangeToTime : ChangeFrequency = .never
    @Published var visibilityAlert : Bool = false
    
    
    init(dataService: DataService = DataService(), homeViewModel : HomeViewModel = HomeViewModel.shared ) {
        
        self.dataService = dataService
        self.homeViewModel = homeViewModel
        
        
    }
    func addPassword()-> Bool {
        if textPlatform.isEmpty {
            visibilityAlert = true
            // textPlatform boş ise burası çalışır
            // Eğer textPlatform boş ise yapılacak işlemleri buraya yazabilirsiniz
            return false
        }
        
        if textPassword.isEmpty {
            visibilityAlert = true
            // textPlatform boş ise burası çalışır
            // Eğer textPlatform boş ise yapılacak işlemleri buraya yazabilirsiniz
            return false
        }
        
        dataService.addPassword(password: textPassword, platform: textPlatform ,selectedChangeToTime: selectedChangeToTime)
        homeViewModel.fetchPasswords()
        textPassword = ""
        textPlatform = ""
        selectedChangeToTime = .never
        return true 
    }
    
    
}
