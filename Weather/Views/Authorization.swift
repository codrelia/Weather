import SwiftUI
import RealmSwift

struct Authorization: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var selection: Int? = nil
    
    @State private var isFoundOfUser = true
    @State private var isNewView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                Text("Авторизация")
                    .font(.custom("Montserrat-Medium", size: 24))
                    .padding(.bottom, 25)
                    .padding(.top, 100)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Логин")
                        .font(montserratRegular)
                        .multilineTextAlignment(.leading)
                    
                    TextField("Введите логин", text: $username)
                        .disableAutocorrection(true)
                        .font(montserratRegular)
                    Divider()
                    
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Пароль")
                        .font(montserratRegular)
                        .multilineTextAlignment(.leading)
                    
                    SecureField("Введите пароль", text: $password)
                        .disableAutocorrection(true)
                        .font(montserratRegular)
                    
                    Divider()
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .center) {
                    if (username == "" || password == "") {
                        Button(action: {
                            print("\(username), \(password)")
                        }){
                            Text("Войти").padding([.leading, .trailing], 60)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(.white)
                                .font(montserratRegular)
                            
                        }
                        .buttonStyle(.bordered)
                        .background(Color.init("LightBlue"))
                        .cornerRadius(5)
                        .disabled(true)
                    }
                    else {
                        NavigationLink(destination: WeatherGeneral().navigationBarBackButtonHidden(true), isActive: $isNewView) {
                            Button(action: {
                                if (userViewModel.accountVerification(username, password)) {
                                    isFoundOfUser = true
                                    isNewView = true
                                } else {
                                    isFoundOfUser = false
                                    isNewView = false
                                }
                            }){
                                Text("Войти").padding([.leading, .trailing], 60)
                                    .padding([.top, .bottom], 5)
                                    .foregroundColor(.white)
                                    .font(montserratMedium)
                                
                            }
                            .buttonStyle(.bordered)
                            .background(Color.blue)
                            .cornerRadius(5)
                        }
                        Text(isFoundOfUser == true ? "" : "Пользователь не найден или пароль неверный")
                            .font(montserratRegular)
                            .foregroundColor(.red)
                    }
                    
                }.padding(.top, 10)
                    HStack(alignment: .center, spacing: 90) {
                        NavigationLink(destination: Registration().navigationBarBackButtonHidden(true), tag: 1, selection: $selection) {
                            Button(action: {
                                self.selection = 1
                            }) {
                                Text("У меня нет аккаунта")
                                    .font(montserratMedium)
                            }
                        }
                        Button(action: {}) {                    Text("Вспомнить пароль")
                                .font(montserratMedium)
                        }
                    }.padding(.top, 10)
                
                VStack{
                    Text("Войти с другим аккаунтом")
                        .font(montserratRegular)
                    Button(action: {}){
                        Image.init("vk_logo")
                    }
                }
                .padding(.bottom, 20)
                .padding(.top, 50)
            }
        }
    }
}
struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        Authorization()
    } 
}
