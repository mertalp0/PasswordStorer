//
//  PasswordStorerApp.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import SwiftUI

@main
struct PasswordStorerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
