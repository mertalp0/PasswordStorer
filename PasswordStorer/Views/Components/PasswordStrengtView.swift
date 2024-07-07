//
//  PasswordStrengtView.swift
//  PasswordStorer
//
//  Created by mert alp on 30.06.2024.
//

import SwiftUI

struct PasswordStrengtView: View {
    var strength: Int
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<5) { index in
                Rectangle()
                    .fill(index < strength ? Color.green : Color.gray.opacity(0.3))
                    .frame(width: 10, height: 10)
                    .cornerRadius(2)
            }
        }
    }
}



#Preview {
    PasswordStrengtView(strength: 2)
}
