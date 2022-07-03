import SwiftUI

struct Authorization: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Авторизация")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 25)
                .padding(.top, 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Логин")
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                
                TextField("Введите логин", text: $username)
                    .disableAutocorrection(true)
                Divider()
                
            }.padding([.leading, .trailing], 20)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Пароль")
                    .font(.headline)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                
                SecureField("Введите пароль", text: $password)
                    .disableAutocorrection(true)
                Divider()
            }.padding([.leading, .trailing], 20)
            
            VStack(alignment: .center) {
                Button(action: {
                    print("\(username), \(password)")
                }){
                    Text("Войти").padding([.leading, .trailing], 60)
                        .padding([.top, .bottom], 5)
                        .foregroundColor(.white)
                        .font(.headline)
                    
                }
                .buttonStyle(.bordered)
                .background(Color.blue)
                .cornerRadius(5)
            }.padding(.top, 10)
            HStack(alignment: .center, spacing: 90) {
                Button(action: {}) {
                    Text("У меня нет аккаунта")
                        .font(.system(size: 12, weight: .light, design: .default))
                }
                Button(action: {}) {                    Text("Вспомнить пароль")
                        .font(.system(size: 12, weight: .light, design: .default))
                }
            }.padding(.top, 10)
            VStack{
                Text("Войти с другим аккаунтом")
                    .font(.system(size: 12, weight: .light, design: .default))
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
