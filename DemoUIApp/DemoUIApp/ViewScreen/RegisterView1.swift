//
//  RegisterView1.swift
//  DemoUIApp
//
//

import SwiftUI

struct RegisterView1: View {
	@State private var nombre: String = ""
	@State private var apellido: String = ""
	@State private var edad: Int = ""
	@State private var Genero: String = ""
	@State private var selection: String? = nil
	
	var body: some View {
		VStack {
			NavigationLink(destination: RegisterView2(), tag: "A", selection: $selection) { EmptyView() }
            HStack{
                Image("signUp")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    // .frame(width: 300)
            }
			VStack(alignment: .leading, spacing: 12){
                
				TextField("Nombre", text: $nombre)
					.textFieldStyle(CustomTextfiled())
				TextField("Apellido", text: $apellido)
					.textFieldStyle(CustomTextfiled())
				TextField("Edad", text: $edad)
					.textFieldStyle(CustomTextfiled())
				TextField("Genero", text: $password)
					.textFieldStyle(CustomTextfiled())
			}
			.padding()
	
			Button {
				selection = "A"
			} label: {
				Text("Guardar y salir")
			}
			.buttonStyle(CustomButtonStyle())
			.padding([.leading, .trailing], 20)
            Spacer()
		}
        .navigationBarTitleDisplayMode(.inline)
	}
}

struct RegisterView1_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView1()
    }
}
