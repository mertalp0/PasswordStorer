import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewModel: HomeViewModel
    
    init() {
        viewModel = HomeViewModel.shared
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HomeViewAppBar()
                Spacer()
                HStack(alignment: .center, spacing: 20) {
                    CategoryCard(text: "All", icon: "tray.full", onTap: viewModel.OnTapAllCard) // Tümü
                    CategoryCard(text: "Weak", icon: "exclamationmark.triangle", onTap: viewModel.OnTapWeakCard) // Zayıf
                    CategoryCard(text: "Time out", icon: "timer", onTap: viewModel.OnTapTimeOutCard) // Yenilenmesi gerek
                }
                .frame(maxWidth: .infinity)
                .background(Color.clear)
                .padding()
                
                if viewModel.passwords.isEmpty {
                    ScrollView{
                        Text("Şifre Yok")
                            .foregroundColor(.gray) // Opsiyonel: Metin rengini gri yapabiliriz
                            .padding()
                    }
                } else {
                    List {
                        ForEach(viewModel.passwords) { item in
                            if ChangeFrequency(rawValue: Int(item.selectedChangeToTime)) != nil {
                                PasswordCard(viewModel: viewModel, password: item)
                            }
                        }
                        .onDelete(perform: viewModel.deletePassword)
                        
                    }
                    
                    .listStyle(PlainListStyle())
                }
            }
        }
    }
}
#Preview {
    HomeView()
}
