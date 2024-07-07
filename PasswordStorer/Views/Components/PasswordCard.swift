//
//  PasswordCard.swift
//  PasswordStorer
//
//  Created by mert alp on 25.06.2024.
//
import SwiftUI


struct PasswordCard: View {
    @State private var isEditing = false
    @State private var visibilityPassword = false
    
    @State private var updatedPlatformName = ""
    @State private var updatedPassword = ""
    @State private var updateSelectedChangeToTime: ChangeFrequency = .never
    
    var password: Password
    @ObservedObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel, password: Password) {
        self.viewModel = viewModel
        self.password = password
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
            
                Text("Platform Adı:")
                    .font(.headline)
                    .foregroundColor(.secondary)
                if isEditing {
                    TextField("Platform Adı", text: $updatedPlatformName)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                   
                    Text(password.platform ?? "Unknown")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    if let platform = password.platform,
                              UIImage(named: platform) != nil {
                               Image(platform)
                                   .resizable()
                                   .frame(width: 34, height: 34)
                                   .clipShape(Circle())
                           } else {
                               // Boş bir yer tutucu olarak boş bir `Image` döndürülebilir
                               Image(systemName: "questionmark.circle")
                                   .resizable()
                                   .frame(width: 34, height: 34)
                                   .opacity(0) // Görünmez hale getirmek için
                           }
                     
                }
            }
            
            HStack {
                Text("Şifre:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if isEditing {
                    TextField("Password ", text: $updatedPassword)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } else {
                    visibilityPassword ? Text(password.password ?? "Unknown")
                        .font(.headline)
                        .foregroundColor(.primary) : Text("******").font(.headline)
                }
            }.onTapGesture {
                withAnimation{
                    visibilityPassword.toggle()
                }
            }
            
            HStack {
                Text("Güç:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                PasswordStrengtView(strength: Int(password.strength))
            }
            
            HStack {
                
                if isEditing {
                    PasswordChangeFrequency(selectedChangeToTime: $updateSelectedChangeToTime)
                } else {
                    Text("Değiştirme Sıklığı:")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(password.selectedChangeToTime == 0 ? "Asla" : "\(ChangeFrequency(rawValue: Int(password.selectedChangeToTime))!.title)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
            
            HStack {
                Text("Son Güncellenme Tarihi:")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                if let createdAt = password.createdAt {
                    Text("\(createdAt, formatter: CoreUtils.dateFormatter)")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                } else {
                    Text("Belirtilmemiş")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
            Text(isEditing ? "Kaydet" : "Güncelle")
                .padding(4)
                .foregroundColor(.white)
                .background(Color.themePrimary)
                .cornerRadius(5)
                .onTapGesture {
                    if isEditing {
                        password.platform = updatedPlatformName
                        password.password = updatedPassword
                        password.selectedChangeToTime = Int64(updateSelectedChangeToTime.rawValue)
                        viewModel.updatePassword(password: password,newPassword: updatedPassword , newPlatform: updatedPlatformName ,newSelectedChangeToTime: updateSelectedChangeToTime )
                    } else {
                        updatedPlatformName = password.platform ?? ""
                        updatedPassword = password.password ?? ""
                        updateSelectedChangeToTime = ChangeFrequency(rawValue: Int(password.selectedChangeToTime))!
                    }
                    withAnimation{
                        isEditing.toggle()
                    }
                }
            
        }
        .frame(width: Constants.safeAreaWidth-Constants.safeAreaWidth/7)
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 2)
        .animation(.easeInOut, value: isEditing)

    }
}




struct PasswordCard_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let password = Password(context: context)
        password.id = UUID()
        password.platform = "facebook"
        password.password = "password123"
        password.strength = 2
        password.selectedChangeToTime = 30
        password.createdAt = Date()
        
        return PasswordCard(viewModel: HomeViewModel.shared, password: password)
            .previewLayout(.sizeThatFits)
    }
}


