//
//  WelcomeView.swift
//  DemoUIApp
//
//

import SwiftUI

struct WelcomeView: View {
	@State private var selection: String? = nil
	
	var body: some View {
		NavigationView {
			VStack(alignment: .center, spacing: 20){
				NavigationLink(destination: SignInView(), tag: "A", selection: $selection) { EmptyView() }
				NavigationLink(destination: RegisterView1(), tag: "B", selection: $selection) { EmptyView() }
                Image("login")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                   // .frame(width: 320)
				Button {
					selection = "A"
				} label: {
					Text("Iniciar Sesion")
				}
				.buttonStyle(CustomButtonStyle())
				
				Button {
					selection = "B"
				} label: {
					Text("Registrarse")
				}
				.buttonStyle(CustomButtonStyle())
                Spacer()
			}
			.padding()
			.navigationBarHidden(true)
		}
	}
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
