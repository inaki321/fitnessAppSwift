//
//  SignInView.swift
//  DemoUIApp
//
//

import SwiftUI

struct SignInView: View {
	
	@State private var username: String = ""
	@State private var password: String = ""
	
	var body: some View {
		VStack(alignment: .leading, spacing: 12){
			TextField("User Name", text: $username)
				.textFieldStyle(CustomTextfiled())
			TextField("Password", text: $password)
			.textFieldStyle(CustomTextfiled())
		}
		.padding()
		Button(action: goDashboard) {
			Text("Submit")
		}
		.buttonStyle(CustomButtonStyle())
		.padding([.leading, .trailing], 20)
		Spacer()
        .navigationBarTitleDisplayMode(.inline)
	}
  
	func goDashboard() {
		if let window = UIApplication.shared.windows.first {
			window.rootViewController = UIHostingController(rootView: DashboardView())
			window.makeKeyAndVisible()
		}
	}
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
