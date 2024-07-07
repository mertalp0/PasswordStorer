//
//  CustomAppBar.swift
//  PasswordStorer
//
//  Created by mert alp on 25.06.2024.
//

import SwiftUI

struct HomeViewAppBar: View {
    @State private var isAddPasswordViewActive = false
    

    var body: some View {
        HStack {
            Spacer()
            Text("Parolalarım")
                .font(.headline)
            Spacer()
            HStack {
                Button(action: {
                    isAddPasswordViewActive = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .padding()
        .background(Color.themePrimary)
        .foregroundColor(.white)
        
        .sheet(isPresented: $isAddPasswordViewActive) {
            AddPasswordView().presentationDetents([.height(Constants.safeAreaHeight/2), .medium])
                .presentationDragIndicator(.automatic)

        }
    }
}

struct CustomAppBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewAppBar()
    }
}
