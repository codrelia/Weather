import SwiftUI
import RealmSwift

struct PasswordChange: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var redoPassword: String = ""
    
    @State private var isActiveText = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
            VStack(alignment: .center, spacing: 20) {
                Text("Восстановление пароля")
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
                    Text("Новый пароль")
                        .font(montserratRegular)
                        .multilineTextAlignment(.leading)
                    
                    SecureField("Введите новый пароль", text: $password)
                        .disableAutocorrection(true)
                        .font(montserratRegular)
                    
                    Divider()
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Повторите новый пароль")
                        .font(montserratRegular)
                        .multilineTextAlignment(.leading)
                    
                    SecureField("Ещё раз введите новый пароль", text: $redoPassword)
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
                        
                        }){
                            Text("Восстановить пароль").padding([.leading, .trailing], 60)
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
                        Button(action: {
                            if (userViewModel.isIdenticalNames(username)) {
                                isActiveText = false
                                userViewModel.changeThePassword(username, password)
                                self.presentation.wrappedValue.dismiss()
                                
                            } else {
                                isActiveText = true
                            }
                        }){
                            Text("Восстановить пароль").padding([.leading, .trailing], 60)
                                .padding([.top, .bottom], 5)
                                .foregroundColor(.white)
                                .font(montserratMedium)
                            
                        }
                        .buttonStyle(.bordered)
                        .background(Color.blue)
                        .cornerRadius(5)
                    }
                    Text(isActiveText == true ? "Пользователь не найден. Пожалуйста, проверьте свой логин!" : "")
                        .font(montserratRegular)
                        .foregroundColor(.red)
                }.padding(.top, 10)
                HStack(alignment: .center, spacing: 90) {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("Я помню пароль")
                            .font(montserratMedium)
                    }
                }.padding(.top, 10)
            }
            .padding(.bottom, 100)
        }
}
struct PasswordChange_Previews: PreviewProvider {
    static var previews: some View {
        PasswordChange()
    }
}


