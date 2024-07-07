//
//  CustomTextField.swift
//  PasswordStorer
//
//  Created by mert alp on 25.06.2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
            }
            
            TextField("", text: $text)
                .padding(.horizontal, 8)
        }
        .frame(height: 50)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(5)
        .padding(.horizontal)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @State private static var text: String = ""
    
    static var previews: some View {
        CustomTextField(text: $text, placeholder: "example")
           
    }
}
