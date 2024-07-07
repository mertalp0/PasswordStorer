//
//  PasswordChangeFrequency.swift
//  PasswordStorer
//
//  Created by mert alp on 25.06.2024.
//

import SwiftUI

import SwiftUI

struct PasswordChangeFrequency: View {
    @Binding var selectedChangeToTime: ChangeFrequency 
    
    var body: some View {
        VStack {
            HStack {
                Text("Değiştirme sıklığı")
                Spacer()
            }.padding(.horizontal)
            HStack {
                ForEach(ChangeFrequency.allCases, id: \.self) { frequency in
                    Button(action: {
                        withAnimation {
                            selectedChangeToTime = frequency // 
                        }
                    }, label: {
                        Text(frequency.title)
                            .padding(5)
                            .foregroundColor(.black)
                            .background(selectedChangeToTime == frequency ? Color.themePrimary : .gray) //
                            .cornerRadius(5.0)
                    })
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct PasswordChangeFrequency_Previews: PreviewProvider {
    @State private static var example: ChangeFrequency = .never

    static var previews: some View {
        PasswordChangeFrequency(selectedChangeToTime: $example)
    }
}
