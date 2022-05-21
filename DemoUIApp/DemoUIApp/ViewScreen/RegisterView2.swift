//
//  RegisterView2.swift
//  DemoUIApp
//
//

import SwiftUI

struct RegisterView2: View {
	@State private var pesometa: Double = 0
	@State private var username: String = ""
	@State private var pass: String = ""
	@State private var selection: String? = nil
	
    var body: some View {
		VStack {
			NavigationLink(destination: RegisterView3(), tag: "A", selection: $selection) { EmptyView() }
			VStack(alignment: .leading, spacing: 12){
				TextField("Peso desdeado", text: $pesometa)
					.textFieldStyle(CustomTextfiled())
				TextField("User Name", text: $username)
					.textFieldStyle(CustomTextfiled())
				TextField("Password", text: $pass)
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

struct RegisterView2_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView2()
    }
}
