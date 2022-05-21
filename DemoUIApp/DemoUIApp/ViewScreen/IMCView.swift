//
//  IMCView.swift
//  DemoUIApp
//
//

import SwiftUI

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


struct IMCView: View {
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            Text("Tu IMC actual es: \(results[0].peso / ((results[0].altura / 100)**2)")
            Text("Si su IMc es menor a 18.5, se encuentra en peso insuficiente, Si su imc es entre 18. Y 24.9 esta en rango saludable. Si su im es entre 25 y 29.9 se encuentra en sobrepeso.")
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct IMCView_Previews: PreviewProvider {
    static var previews: some View {
        IMCView()
    }
}