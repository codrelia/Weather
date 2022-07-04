import SwiftUI

struct Authorization: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Авторизация")
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
            
            VStack(alignment: .center) {
                Button(action: {
                    print("\(username), \(password)")
                }){
                    Text("Войти").padding([.leading, .trailing], 60)
                        .padding([.top, .bottom], 5)
                        .foregroundColor(.white)
                        .font(.custom("Montserrat-Medium", size: 12))
                    
                }
                .buttonStyle(.bordered)
                .background(Color.blue)
                .cornerRadius(5)
            }.padding(.top, 10)
            HStack(alignment: .center, spacing: 90) {
                Button(action: {}) {
                    Text("У меня нет аккаунта")
                        .font(.custom("Montserrat-Medium", size: 12))
                }
                Button(action: {}) {                    Text("Вспомнить пароль")
                        .font(.custom("Montserrat-Medium", size: 12))
                }
            }.padding(.top, 10)
            VStack{
                Text("Войти с другим аккаунтом")
                    .font(.custom("Montserrat-Regular", size: 12))
                Button(action: {}){
                    Image.init("vk_logo")
                }
            }
            .padding(.bottom, 20)
            .padding(.top, 50)
        }
    }
}
struct Authorization_Previews: PreviewProvider {
    static var previews: some View {
        Authorization()
    } 
}
