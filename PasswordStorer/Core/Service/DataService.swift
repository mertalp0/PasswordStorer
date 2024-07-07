//
//  DataService.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import Foundation
import CoreData

class DataService {
    let viewContext = PersistenceController.shared.container.viewContext
    
    func getAllPasswords() -> [Password] {
        do {
            let request: NSFetchRequest<Password> = Password.fetchRequest()
            return try viewContext.fetch(request)
        } catch {
            fatalError("Error fetching passwords: \(error.localizedDescription)")
        }
    }
    
    func deletePassword(_ password: Password) {
        viewContext.delete(password)
        saveContext()
    }
    func updatePassword(password: Password, newPassword: String, newPlatform: String, newSelectedChangeToTime: ChangeFrequency) {
        password.password = newPassword
        password.platform = newPlatform
        password.strength = Int64(CoreUtils.calculateStrength(password: newPassword))
        password.selectedChangeToTime = Int64(newSelectedChangeToTime.rawValue)
        password.createdAt = Date()
        
        saveContext()
    }
    
    
    func addPassword(password: String, platform: String, selectedChangeToTime :ChangeFrequency ) {
        let newItem = Password(context: viewContext)
        newItem.id = UUID()
        newItem.password = password
        newItem.platform = platform
        newItem.strength = Int64(CoreUtils.calculateStrength(password: password)) 
        newItem.createdAt = Date()
        newItem.selectedChangeToTime = Int64(selectedChangeToTime.rawValue)
        
        saveContext()
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            
        } catch {
            let nsError = error as NSError
            fatalError("Error saving context: \(nsError), \(nsError.userInfo)")
        }
    }
}
