//
//  AddPasswordView.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import SwiftUI


struct AddPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddPasswordViewModel
    
    init() {
        viewModel = AddPasswordViewModel.shared
    }
    
    var body: some View {
        VStack {
            AddPasswordViewAppBar()
            VStack{
                CustomTextField(text: $viewModel.textPlatform, placeholder: "Platform")
                CustomTextField(text:  $viewModel.textPassword, placeholder: "Şifre")
                PasswordChangeFrequency(selectedChangeToTime: $viewModel.selectedChangeToTime)
                Spacer()
                CustomButton(title: "Ekle") {
                    if viewModel.addPassword() {
                           self.presentationMode.wrappedValue.dismiss()
                       }
                }
            }.padding(.top, 20)
            
            Spacer()
        }
        .alert(isPresented: $viewModel.visibilityAlert) {
                  Alert(
                      title: Text("Uyarı"),
                      message: Text("Lütfen tüm alanları doldurun."),
                      dismissButton: .default(Text("Tamam"))
                  )
              }
        .navigationBarHidden(true)
     
    }}

#Preview {
    AddPasswordView()
}
