import SwiftUI

struct Registration: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var redoPassword: String = ""
    
    @State private var isActiveText = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                Text("Регистрация")
                    .font(.custom("Montserrat-Medium", size: 24))
                    .padding(.bottom, 25)
                    .padding(.top, 100)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Логин")
                        .font(.custom("Montserrat-Regular", size: 12))
                        .multilineTextAlignment(.leading)
                    
                    TextField("Введите логин", text: $username)
                        .disableAutocorrection(true)
                        .font(.custom("Montserrat-Regular", size: 12))
                    Divider()
                    
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Пароль")
                        .font(.custom("Montserrat-Regular", size: 12))
                        .multilineTextAlignment(.leading)
                    
                    SecureField("Введите пароль", text: $password)
                        .disableAutocorrection(true)
                        .font(.custom("Montserrat-Regular", size: 12))
                    
                    Divider()
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Повторите пароль")
                        .font(.custom("Montserrat-Regular", size: 12))
                        .multilineTextAlignment(.leading)
                    
                    SecureField("Ещё раз введите пароль", text: $redoPassword)
                        .disableAutocorrection(true)
                        .font(.custom("Montserrat-Regular", size: 12))
            
                    Divider()
                    if (redoPassword != password && redoPassword != "") {
                        Text("Пароли не совпадают")
                            .font(.custom("Montserrat-Regular", size: 12))
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
                                .font(.custom("Montserrat-Medium", size: 12))
                            
                        }
                        .buttonStyle(.bordered)
                        .background(Color.init("LightBlue"))
                        .cornerRadius(5)
                        .disabled(true)
                    }
                    else {
                        Button(action: {
                            if (userViewModel.isIdenticalNames(username)) {
                                isActiveText = true
                            } else {
                                isActiveText = false
                                userViewModel.addNewAccount(username, password)
                            }
                        }){
                            Text("Зарегистрироваться").padding([.leading, .trailing], 60)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(.white)
                                .font(.custom("Montserrat-Medium", size: 12))
                            
                        }
                        .buttonStyle(.bordered)
                        .background(Color.blue)
                        .cornerRadius(5)
                    }
                    Text(isActiveText == true ? "Имя пользователя уже существует" : "")
                        .font(.custom("Montserrat-Regular", size: 12))
                        .foregroundColor(.red)
                }.padding(.top, 10)
                HStack(alignment: .center, spacing: 90) {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("У меня есть аккаунт")
                            .font(.custom("Montserrat-Medium", size: 12))
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
