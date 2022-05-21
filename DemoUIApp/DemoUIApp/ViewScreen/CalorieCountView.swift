//
//  CalorieCountView.swift
//  DemoUIApp
//
//
import SwiftUI

struct CalorieCountView: View {
    
    @State private var selection: String? = nil
    @State var calco = 0
    
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            NavigationLink(destination: CalorieListView(), tag: "A", selection: $selection) { EmptyView() }
            Text("Tu cuenta es de \(calco) calorias")
            Button {
                selection = "A"
            } label: {
                Text("Lista de comida")
            }
            .buttonStyle(CustomButtonStyle())
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CalorieCountView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieCountView()
    }
}