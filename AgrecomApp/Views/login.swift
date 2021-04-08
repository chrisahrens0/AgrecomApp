
import SwiftUI

struct login: View {
    @State var username: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding(20)
                .background(Color(red:240.0/255.0, green: 240.0/255, blue: 244.0/255.0))
                .cornerRadius(20.0)
            SecureField("Password", text: $password)
                .padding(20)
                .background(Color(red:240.0/255.0, green: 240.0/255, blue: 244.0/255.0))
                .cornerRadius(20.0)
        }
    }
}

struct login_Preview:
    PreviewProvider {
        static var previews: some View {
            login()
        }
    }