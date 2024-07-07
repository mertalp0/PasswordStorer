//
//  AddPasswordViewAppBar.swift
//  PasswordStorer
//
//  Created by mert alp on 25.06.2024.
//

import SwiftUI

struct AddPasswordViewAppBar: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.white)
                .background(Color.themePrimary)
            }
            Spacer()
            
            Text("Parola ekle")
                .font(.headline)
                .foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.themePrimary)
    }
}

#Preview {
    AddPasswordViewAppBar()
}
