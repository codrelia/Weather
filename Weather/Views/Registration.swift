import SwiftUI

struct Registration: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var redoPassword: String = ""
    
    @State private var isNewView = false
    
    @State private var isActiveText = false
    
    @Environment(\.presentationMode) var presentation
    
    let montserratRegular = Font.custom("Montserrat-Regular", size: 12)
    let montserratMedium = Font.custom("Montserrat-Medium", size: 12)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                Text("Регистрация")
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
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Повторите пароль")
                        .font(montserratRegular)
                        .multilineTextAlignment(.leading)
                    
                    SecureField("Ещё раз введите пароль", text: $redoPassword)
                        .disableAutocorrection(true)
                        .font(montserratRegular)
            
                    Divider()
                    if (redoPassword != password && redoPassword != "") {
                        Text("Пароли не совпадают")
                            .font(montserratRegular)
                            .foregroundColor(.red)
                    }
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .center) {
                    if (username == "" || password == "" || redoPassword == "" || (password != redoPassword)) {
                        Button(action: {
                            userViewModel.addNewAccount(username, password)
                        }){
                            Text("Зарегистрироваться").padding([.leading, .trailing], 60)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(.white)
                                .font(montserratMedium)
                            
                        }
                        .buttonStyle(.bordered)
                        .background(Color.init("LightBlue"))
                        .cornerRadius(5)
                        .disabled(true)
                    }
                    else {
                        NavigationLink(destination: WeatherGeneral().navigationBarBackButtonHidden(true), isActive: $isNewView) {
                        Button(action: {
                            if (userViewModel.isIdenticalNames(username)) {
                                isActiveText = true
                                isNewView = false
                            } else {
                                isActiveText = false
                                isNewView = true
                                userViewModel.addNewAccount(username, password)
                            }
                        }){
                            Text("Зарегистрироваться").padding([.leading, .trailing], 60)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(.white)
                                .font(montserratMedium)
                            
                        }
                        .buttonStyle(.bordered)
                        .background(Color.blue)
                        .cornerRadius(5)
                    }
                    }
                    Text(isActiveText == true ? "Имя пользователя уже существует" : "")
                        .font(montserratRegular)
                        .foregroundColor(.red)
                }.padding(.top, 10)
                HStack(alignment: .center, spacing: 90) {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("У меня есть аккаунт")
                            .font(montserratMedium)
                    }
                }.padding(.top, 10)
            }
            .padding(.bottom, 100)
        }
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}
