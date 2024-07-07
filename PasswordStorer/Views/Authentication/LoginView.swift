//
//  LoginView.swift
//  PasswordStorer
//
//  Created by mert alp on 24.06.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        Group {
            if viewModel.isAuthenticated {
                HomeView()
            } else {
                loginContent
            }
        }
    }
    
    var loginContent: some View {
        ZStack {
            Image("background") // Assetlerdeki görselin ismini buraya yazın
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Merhaba, hoş geldiniz! Şifreleriniz bizimle güvende.")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                    .cornerRadius(10)
                    .padding()
                
                Spacer()
                
                VStack(spacing: 20) {
                    Button(action: {
                        viewModel.authenticateUsingBiometrics(type: .faceID)
                    }) {
                        HStack {
                            Image(systemName: "faceid")
                                .foregroundColor(.white)
                            Text("FaceID ile devam et")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                    }
                    
                    Button(action: {
                        viewModel.authenticateUsingBiometrics(type: .touchID)
                    }) {
                        HStack {
                            Image(systemName: "touchid")
                                .foregroundColor(.white)
                            Text("Parmak İzi ile devam et")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }.padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
