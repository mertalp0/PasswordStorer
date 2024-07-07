//
//  CustomButton.swift
//  PasswordStorer
//
//  Created by mert alp on 25.06.2024.
//

import SwiftUI

struct CustomButton: View {
    var title : String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding(10)
                .frame(width: Constants.safeAreaWidth/2)
                .background(Color.themePrimary)
                .cornerRadius(10)
        } .padding(.horizontal)
       
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(title: "Press me") {
            print("Button pressed")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
