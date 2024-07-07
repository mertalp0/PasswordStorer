//  HomeViewModel.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//
import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    static let shared = HomeViewModel()
    @Published var visibilityAlert : Bool = false
    @Published var activeUpdate : Bool = false 
    @Published var passwords: [Password] = []
    
    
 


    private let dataService: DataService
    
    init(dataService: DataService = DataService()) {
        self.dataService = dataService
        fetchPasswords()
    }
    
    func OnTapAllCard(){
        fetchPasswords()
    }
    
    func OnTapWeakCard(){
        let allPasswords = dataService.getAllPasswords()
        passwords = allPasswords.filter { $0.strength <= 3 }
    }
    
    func OnTapTimeOutCard() {
         let allPasswords = dataService.getAllPasswords()
         let currentDate = Date()
         
         passwords = allPasswords.filter { password in
             let selectedChangeToTime = Int(password.selectedChangeToTime)
             let createdAt = password.createdAt
             
             if selectedChangeToTime > 0 {
                 let expirationDate = Calendar.current.date(byAdding: .day, value: selectedChangeToTime, to: createdAt!)
                 return expirationDate != nil && expirationDate! < currentDate
             }
             return false
         }
    
     }
    
    func fetchPasswords() {
        passwords = dataService.getAllPasswords()
        
    }
    
    
    func deletePassword(at offsets: IndexSet) {
        for index in offsets {
            let password = passwords[index]
            dataService.deletePassword(password)
        }
        fetchPasswords()
    }
    
    func updatePassword(password:Password ,newPassword: String , newPlatform:String , newSelectedChangeToTime : ChangeFrequency){
        dataService.updatePassword(password: password, newPassword: newPassword, newPlatform: newPlatform, newSelectedChangeToTime: newSelectedChangeToTime)
        fetchPasswords()
        
    }
}
