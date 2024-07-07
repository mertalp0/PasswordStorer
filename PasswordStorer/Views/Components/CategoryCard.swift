//
//  CategoryCard.swift
//  PasswordStorer
//
//  Created by mert alp on 26.06.2024.
//

import SwiftUI

struct CategoryCard: View {
    var text : String
    var icon : String
    var onTap : ()-> Void
    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            VStack{
                VStack {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 25, height: 25) // İkon boyutunu ayarlar
                        .foregroundColor(Color.white)
                    
                    Text(text)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                }
                .frame(width: Constants.safeAreaWidth/8 , height: Constants.safeAreaHeight/10)
                .padding()
                .background(.indigo)
                .cornerRadius(30.0)
                
            }
        })
    }
}

#Preview {
    CategoryCard(text: "Time out", icon: "clock", onTap: {})
}
