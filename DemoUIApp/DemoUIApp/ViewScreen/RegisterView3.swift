//
//  RegisterView3.swift
//  DemoUIApp
//
//

import SwiftUI

struct RegisterView3: View {
	
	@State private var peso: Double = 0
	@State private var Estatura: Double = 0

	
    var body: some View {
		VStack {
			VStack(alignment: .leading, spacing: 12){
				TextField("Peso(kg)", text: $username)
					.textFieldStyle(CustomTextfiled())
				TextField("Estatura", text: $password)
					.textFieldStyle(CustomTextfiled())
			}
			.padding()
			Button(action: goDashboard) {
				Text("Guardar y continuar")
			}
			.buttonStyle(CustomButtonStyle())
			.padding([.leading, .trailing], 20)
            Spacer()
		}
        .navigationBarTitleDisplayMode(.inline)
    }
	
	func goDashboard() {
		if let window = UIApplication.shared.windows.first {
			window.rootViewController = UIHostingController(rootView: DashboardView())
			window.makeKeyAndVisible()
		}
	}
}

struct RegisterView3_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView3()
    }
}
