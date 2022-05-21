//
//  ProfileView.swift
//  DemoUIApp
//
//
import SwiftUI

struct ProfileView: View {
    @binding var username
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

        @Published var results = [DataStruct]()
        guard let url = URL(string: "http://127.0.0.1/get_user/\(username)") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let results = try! JSONDecoder().decode([DataStruct].self, from: data!)
            print(results)
            DispatchQueue.main.async {
                completion(results)
            }
        }.resume()

        VStack (alignment: .center, spacing: 10){
            Text("\(results[0].Username)")
            Text("Peso actual \(results[0].peso) Peso deseado: \(results[username].pesoMeta)")
            Text("Meta: \(results[0].peso - results[username].pesoMeta))")
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Inicio")
            }
            .buttonStyle(CustomButtonStyle())
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}